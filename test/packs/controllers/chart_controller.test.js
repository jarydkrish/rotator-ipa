import { Application } from "stimulus";
import ChartController from "chart_controller";

describe('ChartController', () => {
  beforeEach(() => {
    document.body.innerHTML =`<div
    id="chart-thing"
    data-controller="chart"
    data-chart-time-before-bottle-value="0"
    data-chart-time-until-bottle-value="100"
    data-chart-time-before-ready-value="100"
    data-chart-time-until-ready-value="100"
    data-chart-bottled-value="false"
    data-chart-brewed-value="false"
  >
    <canvas data-chart-target="canvas" class="my-auto"></canvas>
  </div>`;

    const application = Application.start();
    application.register("chart", ChartController);
  });

  it('should render a ChartController', () => {
    const result = document.getElementById("chart-thing");
    expect(result.innerHTML).toContain('canvas');
  });
});
