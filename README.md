# MBTA METRO

[![hex version](https://img.shields.io/hexpm/v/mbta_metro.svg)](https://hex.pm/packages/mbta_metro)

This repository contains:
- exported variables from our Rider Design System Figma library, defining standard colors, sizes, and more
- scripts to transform those variables into formats usable by applications
- Elixir function components, LiveComponents, and default styles provided  via compiled CSS, JS, and [Tailwind v3 configuration preset](https://v3.tailwindcss.com/docs/presets)
- a web application documenting these styled components in an interactive Storybook-like experience

To launch the Storybook and demo all of the `mbta_metro` components:

```
%> npm install --prefix assets
%> mix deps.get
%> mix assets.build
%> mix phx.server
```

Now you can visit [`http://localhost:4000/storybook`](http://localhost:4000/storybook) from your browser.

## Installing MBTA Metro in Your Phoenix Application

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
@import "../../deps/mbta_metro/priv/dist/metro.css";
```

If you want to use `mbta_metro`'s LiveComponents, you'll need to add its hooks in your `assets/js/app.js`:

```js
import { Hooks } from "../../../mbta_metro/priv/dist/metro";

let liveSocket = new LiveSocket("/live", Socket, {
  hooks: {
    ...Hooks
  }
})
```

If you want to include hooks individually, you can do so:

```js
import {Map} from "../../../mbta_metro/priv/dist/metro";

let liveSocket = new LiveSocket("/live", Socket, {
  hooks: {
    Map
  }
})
```

### Optional: Configure Tailwind

If using Tailwind, you can use the provided [tokens.js](./assets/js/tokens.js) in your Tailwind configuration, as the tokens are structured as a Tailwind theme. Using this will give you access to utility classes like `p-sm`, `font-heading` or `bg-red-line` that are tailored to the Rider Design System. You must add references to the Metro dependency files in your `content` section.


```javascript
/** @type {import('tailwindcss').Config} */
export default {
  content: [
    // ...your other content
    "../deps/mbta_metro/lib/mbta_metro/components/*.ex",
    "../deps/mbta_metro/lib/mbta_metro/live/*.ex",
  ],
  /* whatever other properties */
  presets: [require("./../deps/mbta_metro/priv/dist/tokens")],
};
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

WIP, so long as you're using the files from `deps/mbta_metro/priv/dist` it should work.

There are also icons and fonts, which can be added to your application's `/priv/static` directory with the mix task `mix mbta_metro.export_assets`.

# Contributing

We welcome contributions! To add a local version of `mbta_metro` to your application, use the `path` option:

```elixir
{:mbta_metro, path: "../mbta_metro", app: false}
```

## Building tokens

Variables have to be exported out of Figma manually. This is at `assets/figma-tokens.zip`, unzipped to `assets/figma-tokens/`. Building the tokens is as simple as running `mix tokens.build` -- StyleDictionary will complain about some things, but it ultimately works.

The workhorse script, a Style Dictionary configuration located at `assets/process-figma-tokens.js`, may need adjusting if the structure of the Figma variables changes.

It generates a few `variables.*.css` files in `assets/css/` and a single JavaScript file at `assets/js/tokens.js`. This JavaScript file basically matches the structure of a Tailwind theme.

## Compiling assets

After making edits to `mbta_metro`, you will have to run the `mix assets.build` script to regenerate the compiled CSS and JS. This runs the Esbuild and Tailwind CLI commands to process the assets and produce the following files in `priv/dist/`:

- `metro.css` - bundled CSS for all components, including any component dependencies
- `metro.js` - bundled JS for all components, including any component dependencies
- `tailwind-preset.js` - a Tailwind configuration containing a theme tailored to the MBTA Rider Design System (including bundled plugins)

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

Note this rebuilds the tokens, recompiles the assets, and bumps the application version automatically.
