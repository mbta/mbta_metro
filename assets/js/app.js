import {Hooks} from "mbta_metro"

(function () {
  window.storybook = {
    Hooks: {
      ...Hooks
    }
  };
})();