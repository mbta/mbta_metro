defmodule MbtaMetro.Components.Button do
  @moduledoc false

  use Phoenix.Component
  use CVA.Component

  attr :class, :string, default: ""
  attr :rest, :global, include: ["popovertarget"]

  slot :inner_block, required: true

  variant :variant,
          [
            primary: "mbta-button mbta-button-primary",
            secondary: "mbta-button mbta-button-secondary"
          ],
          default: :primary

  variant :size,
          [
            default: "",
            small: "mbta-button-small"
          ],
          default: :default

  @doc """
  A button draws attention to important actions, such as submitting a form, taking a next step, or altering information on a page.

  # Guidance

  ## When to use the button component

  - **Important actions.** Use buttons for the most important actions you want users to take on your site, such as `Download`, `Sign up`, or `Log out`.

  ## When to consider something else

  - **Linking between a site's pages.** Use regular links instead.
  
  ## Usability guidance

  Buttons are available in variants to match their importance and context. To show importance, there `primary`, `secondary`, and `tertiary` button variants. To match context, there are `default` and `small` sizes.

  - **Use `primary` buttons for the most important action on the page or block.** For example, `Continue` or `Sign up`. Avoid using more than 1 `primary` button in a group of related actions, and ideally avoid using more than 1 `primary` per page. Think of `primary` buttons as similar to headings.
  - **Use `secondary` buttons for the secondary action on the page or block.** For example `Cancel` or `Previous` on a form or `Close` in a modal that also has other buttons. Avoid using more than 1 `secondary` button in a group of related actions.
  - **Use `tertiary` buttons sparingly when there are already primary and secondary actions.** For example, you might use `tertiary` buttons to add and remove items in a list, inside a modal or form that already has a `Save` and `Cancel` button.
  - **Use the `small` size only when the `default` size is too large for the context.** Do not use the `small` size as an indicator of importance. For example, use the `small` size for a group of actions that apply to a single row in a list of items.
  - **Icons can help people identify the consequence of an action.** However, the label should be clear on its own, and avoid icon-only buttons without labels.
  """
  def button(assigns) do
    ~H"""
    <button class={"#{@cva_class} #{@class}"} {@rest}>
      {render_slot(@inner_block)}
    </button>
    """
  end
end
