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

### Install Preline

Follow [this guide](https://preline.co/docs/index.html).

### Install MBTA METRO

Add this to your `mix.exs`:

```elixir
def deps do
  [{:mbta_metro, github: "anthonyshull/mbta_metro"}]
end
```

You'll also need to add the MBTA METRO component files to your `tailwind.config.js`:

```javascript
module.exports = {
  content: [
    ...,
    "../deps/mbta_metro/**/*.*ex",
  ],
  ...
}
```