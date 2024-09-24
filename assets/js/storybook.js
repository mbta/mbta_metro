import {Hooks} from "mbta_metro"

const SERVER_FORMAT = "Y-m-d G:i K"

/**
 * Formats a date into a string in the user's locale.
 */
const i18nDate = (date, locale = navigator.language) => {
  const formatter = new Intl.DateTimeFormat(locale, {
    month: "long",
    weekday: "short",
    day: "numeric",
    hour: "numeric",
    minute: "numeric"
  });

  return formatter.format(date);
}

(function () {
  window.storybook = {
    Hooks
  };
})();