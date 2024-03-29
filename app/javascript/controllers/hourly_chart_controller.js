import axios from 'axios';
import { Chart, LineController, LineElement, PointElement, LinearScale, TimeScale, Tooltip } from 'chart.js';
import 'chartjs-adapter-luxon';
import { Controller } from '@hotwired/stimulus';

Chart.register(LineController, LineElement, PointElement, LinearScale, TimeScale, Tooltip);

export default class extends Controller {
  static values = {
    beer: String,
    carboy: Number,
  }

  static targets = ["canvas", "loading"]

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
    } catch (error) {
      this.error = true;
      console.error(error);
    }
  }

  async fetchPages() {
    while(this.currentPage < this.pages) {
      this.currentPage += 1;
      await this.fetchPage(this.currentPage);
      this.renderOrUpdateChart();
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

  renderOrUpdateChart() {
    if (this.chart) {
      this.updateChart();
    } else {
      this.renderChart();
    }
  }

  updateChart() {
    this.chart.data.datasets[0].data = this.hourlyDataPoints;
    this.chart.data.datasets[1].data = this.hourlyDataPoints;
    this.chart.update();
  }

  renderChart() {
    if (this.hasLoadingTarget) {
      this.loadingTarget.remove();
    }

    const data = this.hourlyDataPoints;
    const datasets = {
      datasets: [
        {
          label: 'Temperature',
          data,
          yAxisID: 'left-y-axis',
          parsing: {
            xAxisKey: 'created_at',
            yAxisKey: 'temperature',
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
      interaction: {
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
            grid: {
              display: false,
            },
        },
        xAxes: {
          type: 'time',
        },
      },
      plugins: {
        tooltip: {
          callbacks: {
            label: function(context) {
              let label = context.dataset.label || '';

              if (label) {
                  label += ': ';
              }

              if (context.parsed.y !== null) {
                label += Number.parseFloat(context.parsed.y);
              }
              return label;
            },
          },
        },
      },
    };
    const context = this.canvasTarget.getContext('2d');
    this.chart = new Chart(context, {
      type: 'line',
      data: datasets,
      options: options
    });
  }
}
