import maplibregl from "maplibre-gl";

const style = {
  'version': 8,
  'sources': {
    'raster-tiles': {
      'type': 'raster',
      'tiles': [
      'https://mbta-map-tiles-dev.s3.amazonaws.com/osm_tiles/{z}/{x}/{y}.png'
      ],
      'tileSize': 256,
      'attribution': '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a>',
  }
},
'layers': [
    {
      'id': 'simple-tiles',
      'type': 'raster',
      'source': 'raster-tiles',
      'minzoom': 9,
      'maxzoom': 18
    }
  ]
};

/**
 * This is a LiveView hook that initializes a maplibre-gl map.
 */
export default {
  /**
   * Creates a new maplibre-gl map and adds it to the phx-hook DOM element.
   * If `data-click-handler` is set to true, the hook will push a "map-clicked" event with the clicked coordinates.
   */
  mounted() {
    this.map = new maplibregl.Map({
      container: this.el,
      center: [-71.05793935862762, 42.360445610002515],
      zoom: 12,
      // style: `https://tiles.stadiamaps.com/styles/alidade_smooth.json?api_key=${apiKey}`,
      style: style,
    });

    this.map.addControl(new maplibregl.NavigationControl(), "top-left");

    if (JSON.parse(this.el.dataset.clickHandler)) {
      this.map.on("click", (e) => {
        this.pushEvent("map-clicked", e.lngLat);
      });
    }
  },
  /**
   * Destroys the map when the hook is removed.
   */
  destroyed () {
    delete this.map;
  }
}