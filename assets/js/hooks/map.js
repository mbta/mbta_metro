import maplibregl from "maplibre-gl";

import colors from "../styles/colors";
import { max } from "date-fns";

/**
 * This is a LiveView hook that initializes a maplibre-gl map.
 */
export default {
  markers: [],
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
      this.handleEvent("update-lines", this.updateLines(this));
      this.handleEvent("update-markers", this.updateMarkers(this));

      this.pushEventTo("#mbta-metro-map", "map-loaded", {});
    });
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

      if (features.length === 0) {
        return;
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
      const markers = Array.from(that.el.querySelectorAll("#mbta-metro-map-markers svg")).map(element => {
        return {
          coordinates: JSON.parse(element.getAttribute("data-coordinates")),
          element
        }
      }).filter(marker => marker.coordinates.length === 2);

      if (markers.length === 0) {
        that.markers.forEach(marker => marker.remove());

        that.markers = [];

        return;
      }

      const bounds = that.calcBoundsFromCoordinates(markers.map(marker => marker.coordinates));

      that.map.fitBounds(bounds, {maxZoom: 16, padding: 50});

      markers.forEach(marker => {
        const mapMarker = new maplibregl.Marker({
          element: marker.element
        });

        that.markers.push(mapMarker);

        mapMarker.setLngLat(marker.coordinates).addTo(that.map);
      });
    }
  }
}
