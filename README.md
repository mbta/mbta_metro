# MBTA METRO

To demo all of the MBTA METRO components:

```
%> npm install --prefix assets
%> mix deps.get
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

If this is your first time using `mbta_metro`, copy its fonts into your project's static directory:

```
%> mix mbta_metro.install_fonts
```

Make sure the JS assets are in line with the hex version of `mbta_metro`:

```
%> mix mbta_metro.update_assets
```

Import its styles in your `assets/css/app.css`:

```css
@import "../../deps/mbta_metro/priv/static/assets/default.css";
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
```