// Entry point for the build script in your package.json
import * as ActiveStorage from '@rails/activestorage';
import * as Ujs from '@rails/ujs';
import { Turbo } from '@hotwired/turbo-rails';
import 'trix';
import '@rails/actiontext';

import './controllers';

Ujs.start();
ActiveStorage.start();
window.Turbo = Turbo;
