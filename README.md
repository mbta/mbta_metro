# MBTA METRO

[![hex version](https://img.shields.io/hexpm/v/mbta_metro.svg)](https://hex.pm/packages/mbta_metro)

This package contains function components, live components, and default styles.

To demo all of the `mbta_metro` components:

```
%> npm install --prefix assets
%> mix deps.get
%> mix phx.server
```

Now you can visit [`http://localhost:4000`](http://localhost:4000/storybook) from your browser.

## Installation

Add this to your `mix.exs`:

```elixir
def deps do
  [
    {:mbta_metro, ">= 0.0.0"}
  ]
end
```

Import `mbta_metro`'s styles in your stylesheet:

```css
@import "../../deps/mbta_metro/priv/dist/metro.css";
```

**Optionally**, you can use `mbta_metro` as a base for your Tailwind configuration.

```js
module.exports = {
  presets: [require("../deps/mbta_metro/priv/dist/tailwind-preset")]
  // the rest of your Tailwind configuration
}
```

If you want to use `mbta_metro`'s LiveComponents, you'll need to add its hooks in your `assets/js/app.js`:

```js
import {Hooks} from "../deps/mbta_metro/priv/dist/metro.js"

let liveSocket = new LiveSocket("/live", Socket, {
  hooks: {
    ...Hooks
  }
})
```

If you want to include hooks individually, you can do so:

```js
import {Map} from "../deps/mbta_metro/priv/dist/metro.js"

let liveSocket = new LiveSocket("/live", Socket, {
  hooks: {
    Map
  }
})
```

### Custom Icons

Along with all of the [free Font Awesome icons](https://fontawesome.com/icons), you can add custom icons by pointing to any directory you like. E.g.,

```elixir
config :mbta_metro, custom_icons: "#{File.cwd!()}/priv/static/icons/your-directory/your-icon.svg"
```

SVGs in the above directory will be turned into icons and can be used as follows:

```
<.icon type="your-directory" name="your-icon" class="..." />
```

### LiveComponents

Some components, like the Map, take further configuration.

#### Map

The map components uses [maplibre-gl](https://maplibre.org/maplibre-gl-js/docs/) so you must pass in config with a valid [style spec](https://maplibre.org/maplibre-style-spec/).

You can use an external style source.

```elixir
@api_key = Application.compile_env!("MBTA_METRO_MAP_API_KEY")

config :mbta_metro, :map, %{
  style: "https://tiles.stadiamaps.com/styles/alidade_smooth.json?api_key=#{@api_key}"
}
```

If you do use an external source you'll have to make sure it is defined in your CSP (assuming you have one):

```elixir
[
  "child-src blob: ;",
  "connect-src *.stadiamaps.com",
  "worker-src blob: ;"
]
```

Or, you can define your own style.

```elixir
config :mbta_metro, :map, config: %{
  center: [-71.0589, 42.3601],
  style: %{
    "version" => 8,
    "sources" => %{...},
    "layers" => %{...}
  },
  zoom: 15
}
```

## Production usage

The required assets are bundled into the following files, make sure to include them:
- `/priv/dist/metro.css`
- `/priv/dist/metro.js`
- `/priv/fonts/`
- `/priv/icons/`

## Publishing

You can publish a new release with a single script:

```
%> git checkout main
%> git pull origin main
%> ./release
Please enter a release level [patch | minor | major]: patch
...
%> git push origin main
```
