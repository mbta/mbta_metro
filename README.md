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

The, follow the installation instructions for the [npm package](https://www.npmjs.com/package/mbta_metro).