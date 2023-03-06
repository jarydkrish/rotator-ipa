import { Chart,  DoughnutController, ArcElement, Tooltip } from 'chart.js';
import 'chartjs-adapter-luxon';
import { Controller } from '@hotwired/stimulus';

Chart.register(DoughnutController, ArcElement, Tooltip);

export default class extends Controller {
  static values = {
    timeBeforeBottle: Number,
    timeUntilBottle: Number,
    timeBeforeReady: Number,
    timeUntilReady: Number,
    bottled: Boolean,
    brewed: Boolean,
  }

  static targets = ["canvas"]

  connect() {
    this.renderChart();
  }

  renderChart() {
    const data = {
      datasets: [{
        data: [
          this.timeBeforeBottleValue,
          this.timeUntilBottleValue,
          this.timeBeforeReadyValue,
          this.timeUntilReadyValue,
        ],
        backgroundColor: [
          'forestgreen',
          'gainsboro',
          'forestgreen',
          'gainsboro'
        ]
      }],
      // These labels appear in the legend and in the tooltips when hovering different arcs
      labels: [
        this.bottledValue ? 'Beer is bottled' : 'Days elapsed since start',
        'Days until bottled',
        this.brewedValue ? 'Beer is brewed' : 'Days elapsed since bottled',
        'Days until conditioned',
      ],
    };
    const options = {
      rotation: -90,
      circumference: 180,
      legend: {
        display: false,
      },
      aspectRatio: 2.30,
    };
    const context = this.canvasTarget.getContext('2d');
    this.chart = new Chart(context, {
      type: 'doughnut',
      data: data,
      options: options
    });
  }
}
