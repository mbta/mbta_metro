import { Hooks } from "./metro.js";

(function () {
  window.storybook = {
    Hooks: {
      ...Hooks,
    },
  };
})();
