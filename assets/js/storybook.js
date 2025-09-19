import { Hooks } from "./../../priv/dist/metro.js";

(function () {
  window.storybook = {
    Hooks: {
      ...Hooks,
    },
  };
})();
