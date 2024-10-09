# MBTA METRO

This package contains default styles as well as [LiveView Hooks](https://hexdocs.pm/phoenix_live_view/js-interop.html#client-hooks-via-phx-hook) for LiveComponents.

## Usage

Install the [Elixir package](https://hexdocs.pm/mbta_metro/MbtaMetro.html) first.

Then, add the mbta_metro library to your `assets/package.json`:

```
%> cd assets
%> npm install --save mbta_metro
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

If you want to MbtaMetro's LiveComponents, you'll need to add its hooks in your `assets/js/app.js`:

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

## Publishing

Make sure you are in the `assets` directory.

Bump the version number:

```
%> npm version patch
```

Then publish to npm as normal:

```
%> npm publish
```