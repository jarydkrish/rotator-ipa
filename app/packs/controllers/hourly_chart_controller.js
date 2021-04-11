import axios from 'axios';
import { Chart, LineController, LineElement, PointElement, LinearScale, TimeScale, Tooltip } from 'chart.js';
import 'chartjs-adapter-moment';
import { Controller } from 'stimulus';

Chart.register(LineController, LineElement, PointElement, LinearScale, TimeScale, Tooltip);

export default class extends Controller {
  static values = {
    beer: String,
    carboy: Number,
  }

  static targets = ["canvas"]

  initialize() {
    this.pages = 1;
    this.currentPage = 0;
    this.error = false;
    this.hourlyDataPoints = [];
  }

  connect() {
    this.load();
  }

  async load() {
    try {
      this.error = false;
      await this.fetchPages();
      this.renderChart();
    } catch (error) {
      this.error = true;
      console.error(error);
    }
  }

  async fetchPages() {
    while(this.currentPage <= this.pages) {
      this.currentPage += 1;
      await this.fetchPage(this.currentPage);
    }
  }

  async fetchPage(page) {
    const response = await axios.get(`/api/beers/${this.beerValue}/hourly_data_points?carboy_id=${this.carboyValue}&page=${page}`)
    const total = parseInt(response.headers['total']);
    const perPage = parseInt(response.headers['per-page']);
    if (total > 0 && perPage > 0) {
      this.pages = Math.ceil(total / perPage);
    }
    this.hourlyDataPoints = [...this.hourlyDataPoints, ...response.data];
  }

  renderChart() {
    const data = this.hourlyDataPoints;
    const datasets = {
      datasets: [
        {
          label: 'Temperature',
          data,
          yAxisID: 'left-y-axis',
          parsing: {
            xAxisKey: 'created_at',
            yAxisKey: 'temperature'
          },
          fill: false,
          borderColor: 'forestgreen',
          backgroundColor: 'forestgreen',
        },
        {
          label: 'Specific Gravity',
          data,
          yAxisID: 'right-y-axis',
          parsing: {
            xAxisKey: 'created_at',
            yAxisKey: 'specific_gravity'
          },
          fill: false,
          borderColor: 'khaki',
          backgroundColor: 'yellow'
        }
      ],
    };

    const options = {
      tooltips: {
        mode: 'index'
      },
      scales: {
        'left-y-axis': {
          beginAtZero: true,
          suggestedMax: 120,
          ticks: {
            callback: function(value, index, values) {
              return value + '° F';
            }
          }
        },
        'right-y-axis': {
            type: 'linear',
            position: 'right',
            suggestedMin: 0.80,
            suggestedMax: 1.20,
            gridLines: {
              display: false,
            },
        },
        xAxes: {
          type: 'time',
        }
      }
    };
    const context = this.canvasTarget.getContext('2d');
    this.chart = new Chart(context, {
      type: 'line',
      data: datasets,
      options: options
    });
  }
}
