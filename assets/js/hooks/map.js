import maplibregl from "maplibre-gl";

/**
 * This is a LiveView hook that initializes a maplibre-gl map.
 */
export default {
  /**
   * Creates a new maplibre-gl map and adds it to the phx-hook DOM element.
   * Uses the data attributes `data-api-key`, `data-map-name`, and `data-region` to load the map style.
   * If `data-click-handler` is set to true, the hook will push a "map-clicked" event with the clicked coordinates.
   */
  mounted() {
    const apiKey = this.el.dataset.apiKey;
    const mapName = this.el.dataset.mapName;
    const region = this.el.dataset.region;

    this.map = new maplibregl.Map({
      container: this.el,
      center: [-71.05793935862762, 42.360445610002515],
      zoom: 12,
      style: `https://maps.geo.${region}.amazonaws.com/maps/v0/maps/${mapName}/style-descriptor?key=${apiKey}`,
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