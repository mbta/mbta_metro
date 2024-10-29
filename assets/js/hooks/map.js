import maplibregl from "maplibre-gl";

import colors from "../styles/colors";
import { max } from "date-fns";

/**
 * This is a LiveView hook that initializes a maplibre-gl map.
 */
export default {
  /**
   * Creates a new maplibre-gl map and adds it to the phx-hook DOM element.
   */
  mounted() {
    const config = JSON.parse(this.el.dataset.config);

    this.map = new maplibregl.Map({
      container: this.el.querySelector("#mbta-metro-map-container"),
      ...config,
    });

    this.map.addControl(new maplibregl.NavigationControl(), "top-left");

    this.map.on("load", () => {
      this.pushEventTo("#mbta-metro-map", "map-loaded", {});
    });

    this.handleEvent("update-lines", this.updateLines(this));
    this.handleEvent("update-markers", this.updateMarkers(this));
  },
  /**
   * Destroys the map when the hook is removed.
   */
  destroyed () {
    delete this.map;
  },
  /**
   * 
   */
  calcBoundsFromCoordinates(coordinatesCollection) {
    return [
      this.getSWCoordinates(coordinatesCollection),
      this.getNECoordinates(coordinatesCollection),
    ];
  },
  /**
   * 
   */
  getNECoordinates(coordinatesCollection) {
    const highestLng = Math.max(
      ...coordinatesCollection.map((coordinates) => coordinates[0])
    );
    const highestLat = Math.max(
      ...coordinatesCollection.map((coordinates) => coordinates[1])
    );
  
    return [highestLng, highestLat];
  },
  /**
   * 
   */
  getSWCoordinates(coordinatesCollection) {
    const lowestLng = Math.min(
      ...coordinatesCollection.map((coordinates) => coordinates[0])
    );
    const lowestLat = Math.min(
      ...coordinatesCollection.map((coordinates) => coordinates[1])
    );
  
    return [lowestLng, lowestLat];
  },
  /**
   * Converts a line object to a GeoJSON feature.
   */
  lineToGeoJSON (line) {
    return {
      type: "Feature",
      properties: {
        color: colors[line.color],
        width: line.width,
      },
      geometry: {
        type: "LineString",
        coordinates: line.coordinates,
      },
    };
  },
  /**
   * 
   */
  updateLines(that) {
    return function() {
      const elements = that.el.querySelectorAll("#mbta-metro-map-lines div");
      const features = Array.from(elements).map(element => {
        const line = JSON.parse(element.getAttribute("data-line"));
  
        return that.lineToGeoJSON(line);
      });

      if (that.map.getLayer("lines")) {
        that.map.removeLayer("lines");
      }

      if (that.map.getSource("lines")) {
        that.map.removeSource("lines");
      }

      that.map.addSource("lines", {
        type: "geojson",
        data: {
          type: "FeatureCollection",
          features
        }
      });
  
      that.map.addLayer({
        id: "lines",
        type: "line",
        source: "lines",
        paint: {
          "line-color": ["get", "color"],
          "line-width": ["get", "width"],
        }
      });
    }
  },
  /**
   * 
   */
  updateMarkers(that) {
    return function() {
      const elements = that.el.querySelectorAll("#mbta-metro-map-markers svg");

      const markers = Array.from(elements).map(element => {
        return JSON.parse(element.getAttribute("data-coordinates"));
      });

      const bounds = that.calcBoundsFromCoordinates(markers);

      that.map.fitBounds(bounds);

      elements.forEach((element, index) => {
        const coordinates = markers.at(index);

        new maplibregl.Marker({element}).setLngLat(coordinates).addTo(that.map);
      });
    }
  }
}
