import {Hooks} from "./index"

(function () {
  window.storybook = {
    Hooks: {
      ...Hooks
    }
  };
})();