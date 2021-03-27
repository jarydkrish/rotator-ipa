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
    this.loading = true;
    this.error = false;
    this.hourlyDataPoints = [];
  }

  connect() {
    this.load();
  }

  load() {
    axios.get(`/api/beers/${this.beerValue}/hourly_data_points?carboy_id=${this.carboyValue}`)
        .then((response) => {
          this.loading = false;
          this.error = false;
          this.hourlyDataPoints = response.data;
          this.renderChart();
        })
        .catch((error) => {
          this.loading = false;
          this.hourlyDataPoints = [];
          this.error = true;
          console.error(error);
        });
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
