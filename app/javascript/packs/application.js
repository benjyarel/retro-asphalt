import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import {initMapbox, fitMapToMarkers } from '../plugins/init_mapbox';
import { toggleDateInputs } from '../plugins/booking';

toggleDateInputs();
initMapbox();
