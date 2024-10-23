<div style="display: flex;">
  <img src="./priv/static/icons/brands/metro.svg" alt="MbtaMetro Logo" style="display: inline-block; height: 32px; width: 32px; fill: blue; margin-right: 6px; margin-top: 10px" />
  <p style="display: inline-block; font-size: 32px">MBTA METRO</p>
</div>

[![hex version](https://img.shields.io/hexpm/v/mbta_metro.svg)](https://hex.pm/packages/mbta_metro)
[![npm version](https://badge.fury.io/js/mbta_metro.svg)](https://badge.fury.io/js/mbta_metro)

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

If this is your first time using `mbta_metro`, copy its fonts into your project's static directory:

```
%> mix mbta_metro.install_fonts
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

### LiveComponents

Some components, like the Map, take further configuration.

#### Map

```elixir
config :mbta_metro, :map, api_key: System.get_env("MBTA_METRO_MAP_API_KEY")
```

You'll also have to add the following to your CSP (assuming you have one):

```elixir
[
  "child-src blob: ;",
  "connect-src *.stadiamaps.com",
  "worker-src blob: ;"
]
```

## Publishing

You can publish a new release with a single script:

```
%> ./release
Please enter a release level [patch | minor | major]: patch
...
```