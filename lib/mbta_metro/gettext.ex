defmodule MbtaMetro.Gettext do
  use Gettext.Backend,
    otp_app: :mbta_metro,
    default_locale: :en,
    locales: ["en", "es", "zh-CN", "zh-TW", "pt-BR", "ht", "fr", "vi"],
    priv: "priv/gettext"
end
