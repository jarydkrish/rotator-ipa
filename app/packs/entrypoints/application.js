import * as Ujs from '@rails/ujs';
import * as ActiveStorage from '@rails/activestorage';
import { Turbo } from '@hotwired/turbo-rails';

import 'channels';
import 'controllers';

import '../stylesheets/tailwind.scss';
import '../stylesheets/trix.scss';


import '../images/ipa-logo.png';
import '../images/champ-brewing.png';
import '../images/brewing-step-one.jpg';
import '../images/brewing-step-two.jpeg';


Ujs.start();
ActiveStorage.start();
window.Turbo = Turbo;
