// If you want to use Phoenix channels, run `mix help phx.gen.channel`
// to get started and then uncomment the line below.
// import "./user_socket.js"

// You can include dependencies in two ways.
//
// The simplest option is to put them in assets/vendor and
// import them using relative paths:
//
//     import "../vendor/some-package.js"
//
// Alternatively, you can `npm install some-package --prefix assets` and import
// them using a path starting with the package name:
//
//     import "some-package"
//

// Include phoenix_html to handle method=PUT/DELETE in forms and buttons.
import "phoenix_html"
// Establish Phoenix Socket and LiveView configuration.
import {Socket} from "phoenix"
import {LiveSocket} from "phoenix_live_view"
import L from "leaflet";

let csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content")

const Map = {
  mounted() {
    const hook = this;

    hook.map = L.map(hook.el, {
      center: [42.360402100405864, -71.05790767732184],
      zoom: 13
    });

    L.tileLayer('https://tiles.stadiamaps.com/tiles/stamen_toner_lite/{z}/{x}/{y}{r}.png', {
      maxZoom: 20,
      attribution: '&copy; <a href="https://stadiamaps.com/" target="_blank">Stadia Maps</a> &copy; <a href="https://stamen.com/" target="_blank">Stamen Design</a> &copy; <a href="https://openmaptiles.org/" target="_blank">OpenMapTiles</a> &copy; <a href="https://www.openstreetmap.org/copyright" target="_blank">OpenStreetMap</a>', 
    }).addTo(hook.map);

    L.marker([42.360402100405864, -71.05790767732184]).addTo(hook.map);

    hook.map.on('click', function(ev) {
      hook.pushEventTo(hook.el, 'map-clicked', ev.latlng);
    });
  },
  destroyed () {
    this.map.destroy();
  }
}

let liveSocket = new LiveSocket("/live", Socket, {
  hooks: {
    Map
  },
  longPollFallbackMs: 100,
  params: {_csrf_token: csrfToken}
})

// connect if there are any LiveViews on the page
liveSocket.connect()
// expose liveSocket on window for web console debug logs and latency simulation:
liveSocket.enableDebug()
liveSocket.enableLatencySim(1000) // enabled for duration of browser session
liveSocket.disableLatencySim()

window.liveSocket = liveSocket
