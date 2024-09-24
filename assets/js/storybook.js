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

const config = {
  allowInvalidPreload: true, // needed on mobile to prevent the input from becoming blank when selecting a date outside the min/max
  altInput: true, // allow different format to be sent to server
  dateFormat: SERVER_FORMAT, // this gets sent to the server
  // defaultDate: dateTime,
  enableTime: true,
  // maxDate,
  // minDate,
  formatDate: (date, formatString, locale) => {
    if (formatString === SERVER_FORMAT) {
      // Formats a date into a string in the format util.ex parse/1 expects.
      return format(date, "yyyy-MM-dd HH:mm aa");
    }

    // if not being sent to the server, use localized format
    return i18nDate(date, locale);
  },
  // wrap: true // works with adjacent icon
}

(function () {
  window.storybook = {
    Hooks
  };
})();