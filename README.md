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

### Install Tailwind

If you have a clean, recent installation of Phoenix, you should already have Tailwind installed.
If not, you can follow [this guide](https://tailwindcss.com/docs/guides/phoenix).

### Install MBTA METRO

Add this to your `mix.exs`:

```elixir
def deps do
  [
    {:mbta_metro, ">= 0.0.0"}
  ]
end
```

Import `mbta_metro`'s styles in your `assets/css/app.css`:

```css
@import "../../deps/mbta_metro/priv/static/assets/default.css";
```

Make sure your assets are in line with the hex version of `mbta_metro`:

```
%> mix mbta_metro.update_assets
```

You can then use some defaults in your `assets/tailwind.config.js`:

```js
const {colors, content, fontFamily, plugins, safelist} = require("mbta_metro")

module.exports = {
  content: [
    ...content,
  ],
  safelist: [
    ...safelist,
  ],
  plugins: [
    ...plugins(), // Note that this is a function
  ],
  theme: {
    extend: {
      colors: {
        ...colors
      }
    },
    fontFamily: {
      ...fontFamily,
    },
  }
}
```

If you want to use `mbta_metro`'s LiveComponents, you'll need to add its hooks in your `assets/js/app.js`:

```js
import {Hooks} from "mbta_metro"

let liveSocket = new LiveSocket("/live", Socket, {
  hooks: {
    ...Hooks
  }
})
```

If you want to include hooks individually, you can do so:

```js
import {Map} from "mbta_metro"

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

Because we ship Mbta Metro's javascript via hex and not npm, installing the library works a little differently than normal.
We included a mix task `mix mbta_metro.update_assets` that will install the javascript along with its dependencies in the normal Phoenix `node_modules` directory.
When you go to build and compile your application you might run into errors about Mbta Metro's dependencies not being found.
If you are building in an environment where you have Elixir and Node in the same image, you can simply run the above mix task.
If you only have Node in the image, you can run the underlying npm command that mix tasks calls:

```
%> npm install --prefix assets -S -install-links deps/mbta_metro/priv/
```

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