// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_controller.js.

import { Application } from '@hotwired/stimulus';
import { Dropdown } from 'tailwindcss-stimulus-components';

import ChartController from './chart_controller';
import HourlyChartController from './hourly_chart_controller';

const application = Application.start();

application.register('dropdown', Dropdown);
application.register('chart', ChartController);
application.register('hourly-chart', HourlyChartController);
