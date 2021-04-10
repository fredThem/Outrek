import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';

const initMapbox = () => {
const mapElement = document.getElementById('map');
  if (mapElement) { // only build a map if there's a div#map to inject into
    const center = JSON.parse(mapElement.dataset.center);
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/outdoors-v11',
      center: center,
      zoom: 7
    });
  }
};

export { initMapbox };
