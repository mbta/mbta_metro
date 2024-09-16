# MBTA METRO

To demo all of the MBTA METRO components:

```
%> mix setup
%> mix phx.server
```

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Installation

### Install Tailwind

If you have a clean, recent installation of Phoenix, you should already have Tailwind installed.
If not, you can follow [this guide](https://tailwindcss.com/docs/guides/phoenix).

### Install MBTA METRO

Add this to your `mix.exs`:

```elixir
def deps do
  [{:mbta_metro, "0.0.1-alpha"}]
end
```

Import the styles in your `assets/css/app.css`:

```css
@import "../../deps/mbta_metro/priv/static/assets/app.css";
```

The, follow the installation instructions for the [npm package](https://www.npmjs.com/package/mbta_metro).

### Components

Some components, like the Map, take further configuration.

#### Map

```elixir
config :mbta_metro, :aws_location,
  api_key: System.get_env("AWS_LOCATION_API_KEY"),
  map_name: System.get_env("AWS_LOCATION_MAP_NAME"),
  region: System.get_env("AWS_LOCATION_REGION")
```