import { Hooks } from "./../../priv/dist/metro";

(function () {
  window.storybook = {
    Hooks: {
      ...Hooks,
    },
  };
})();
