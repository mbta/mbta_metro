import maplibregl from "maplibre-gl";

import colors from "../styles/colors";

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
      style: JSON.parse(this.el.dataset.style),
    });

    this.map.addControl(new maplibregl.NavigationControl(), "top-left");

    if (JSON.parse(this.el.dataset.clickHandler)) {
      this.map.on("click", (e) => {
        this.pushEvent("map-clicked", e.lngLat);
      });
    }

    this.el.querySelectorAll("svg.mbta-metro-marker").forEach(element => {
      const coordinates = JSON.parse(element.getAttribute("data-coordinates"));

      new maplibregl.Marker({element}).setLngLat(coordinates).addTo(this.map);
    });

    this.handleEvent("marker-added", ([index, lng, lat]) => {
      const element = this.el.querySelector(`#mbta-metro-marker-${index}`);

      new maplibregl.Marker({element}).setLngLat([lng, lat]).addTo(this.map);
    });
  },
  /**
   * Destroys the map when the hook is removed.
   */
  destroyed () {
    delete this.map;
  }
}