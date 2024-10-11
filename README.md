# MBTA METRO

To demo all of the MBTA METRO components:

```
%> mix setup
%> mix phx.server
```

Now you can visit [`localhost:4000`](http://localhost:4000/storybook) from your browser.

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

Copy the fonts from `mbta_metro` into your project's static directory:

```
%> mix mbta_metro.install_fonts
```

Import the styles in your `assets/css/app.css`:

```css
@import "../../deps/mbta_metro/priv/static/assets/default.css";
```

The, follow the installation instructions for the [npm package](assets/README.md).

### LiveComponents

Some components, like the Map, take further configuration.

#### Map

```elixir
config :mbta_metro, :aws_location,
  api_key: System.get_env("AWS_LOCATION_API_KEY"),
  map_name: System.get_env("AWS_LOCATION_MAP_NAME"),
  region: System.get_env("AWS_LOCATION_REGION")
```

You'll also have to add the following to your CSP (assuming you have one):

```elixir
[
  "child-src blob: ;",
  "connect-src *.amazonaws.com",
  "worker-src blob: ;"
]
```

## Publishing

If any JS assets have changed, publish a new [npm package](assets/README.md#publishing).

If any CSS assets have changed, export a new CSS file.

```
%> mix mbta_metro.export_css
```

Edit the `VERSIONS` file so that the *next* hex version points to the npm version you just published.

```
0.0.17-0.0.23
```

Then publish to hex as normal:

```
%> mix hex.publish
```
