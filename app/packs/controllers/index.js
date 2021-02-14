// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_controller.js.

import { Application } from 'stimulus';
import { definitionsFromContext } from 'stimulus/webpack-helpers';
import { Dropdown } from 'tailwindcss-stimulus-components';


const application = Application.start();

const context = require.context('.', true, /_controller\.js$/);
application.load(definitionsFromContext(context));
application.register('dropdown', Dropdown);
