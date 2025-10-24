import { Hooks } from "./metro";

(function () {
  window.storybook = {
    Hooks: {
      ...Hooks,
    },
  };
})();
