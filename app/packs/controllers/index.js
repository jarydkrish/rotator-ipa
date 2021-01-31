// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_controller.js.

const controllers = require.context('.', true, /_controller\.js$/);
controllers.keys().forEach(controllers);
