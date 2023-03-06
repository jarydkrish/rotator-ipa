// Entry point for the build script in your package.json
import * as ActiveStorage from '@rails/activestorage';
import * as Ujs from '@rails/ujs';
import 'trix';
import '@rails/actiontext';
import "@hotwired/turbo-rails"


import './controllers';

Ujs.start();
ActiveStorage.start();
