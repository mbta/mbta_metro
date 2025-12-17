defmodule MbtaMetro.Components.Input do
  @moduledoc false

  use Gettext, backend: MbtaMetro.Gettext
  use Phoenix.Component

  import MbtaMetro.Components.Feedback

  @doc """
  An input receives input of various types, such as text, radios, checkboxes, passwords, and other controls. It includes a label and can display error messages.

  ## Implementation guidance

  A `Phoenix.HTML.FormField` may be passed as argument,
  which is used to retrieve the input name, id, and values.
  Otherwise all attributes may be passed explicitly.

  ### Types

  This function accepts all HTML input types, considering that:

    * You may also set `type="select"` to render a `<select>` tag

    * `type="textarea"` is used to render a `<textarea>` tag

    * `type="checkbox"` is used exclusively to render boolean values

    * For live file uploads, see `Phoenix.Component.live_file_input/1`

  See https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input
  for more information. Unsupported types, such as hidden and radio,
  are best written directly in your templates.

  ### Examples

      <.input field={@form[:email]} type="email" />
      <.input name="my-input" errors={["oh no!"]} />
  """
  attr :id, :any, default: nil
  attr :name, :any
  slot :inner_block, doc: "The label for this input."
  attr :value, :any

  attr :type, :string,
    default: "text",
    values:
      ~w(checkbox color date datetime-local email file month number password
               range search select tel text textarea time url week radio checkbox_group_item radio_group_item)

  attr :field, Phoenix.HTML.FormField,
    doc: "a form field struct retrieved from the form, for example: @form[:email]"

  attr :errors, :list, default: []
  attr :class, :string, default: ""
  attr :checked, :boolean, doc: "the checked flag for checkbox inputs"
  attr :prompt, :string, default: nil, doc: "the prompt for select inputs"
  attr :options, :list, doc: "the options to pass to Phoenix.HTML.Form.options_for_select/2"
  attr :multiple, :boolean, default: false, doc: "the multiple flag for select inputs"

  attr :rest, :global,
    include: ~w(accept autocomplete capture cols disabled form list max maxlength min minlength
                multiple pattern placeholder readonly required rows size step)

  def input(%{field: %Phoenix.HTML.FormField{} = field} = assigns) do
    errors = if used_input?(field), do: field.errors, else: []

    assigns
    |> assign(field: nil, id: assigns.id || field.id)
    |> assign(:errors, format_changeset_errors(errors))
    |> assign_new(:name, fn -> if assigns.multiple, do: field.name <> "[]", else: field.name end)
    |> assign_new(:value, fn -> field.value end)
    |> input()
  end

  def input(%{type: "checkbox"} = assigns) do
    assigns =
      assigns
      |> assign_new(:checked, fn ->
        Phoenix.HTML.Form.normalize_value("checkbox", assigns[:value])
      end)

    ~H"""
    <.label for={@id}>
      <input type="hidden" name={@name} value="false" disabled={@rest[:disabled]} />
      <input
        type="checkbox"
        id={@id}
        name={@name}
        value="true"
        checked={@checked}
        class={["mbta-input", @class]}
        {@rest}
      />
      {render_slot(@inner_block)}
    </.label>
    """
  end

  def input(%{type: "radio"} = assigns) do
    assigns = assigns |> assign_new(:checked, fn -> false end)

    ~H"""
    <.label for={@id}>
      <input
        type="radio"
        id={@id}
        name={@name}
        value={@value}
        checked={@checked}
        class={["mbta-input", @class]}
        {@rest}
      />
      {render_slot(@inner_block)}
    </.label>
    """
  end

  def input(%{type: "select"} = assigns) do
    ~H"""
    <div>
      <.label :if={@inner_block} for={@id}>
        <strong>{render_slot(@inner_block)}</strong> <.required_label :if={@rest[:required]} />
      </.label>
      <select
        id={@id}
        name={@name}
        class={["mbta-input", @class]}
        multiple={@multiple}
        {@rest}
      >
        <option :if={@prompt} value="">{@prompt}</option>
        {Phoenix.HTML.Form.options_for_select(@options, @value)}
      </select>
      <.feedback :for={msg <- @errors} kind={:error}>{msg}</.feedback>
    </div>
    """
  end

  def input(%{type: "textarea"} = assigns) do
    ~H"""
    <div>
      <.label :if={@inner_block} for={@id}>
        <strong>{render_slot(@inner_block)}</strong> <.required_label :if={@rest[:required]} />
      </.label>
      <textarea
        id={@id}
        name={@name}
        class={[
          "mbta-input",
          @errors != [] && "mbta-input--error",
          @class
        ]}
        rows="3"
        {@rest}
      ><%= Phoenix.HTML.Form.normalize_value("textarea", @value) %></textarea>
      <.feedback :for={msg <- @errors} kind={:error}>{msg}</.feedback>
    </div>
    """
  end

  # All other inputs text, datetime-local, url, password, etc. are handled here...
  def input(assigns) do
    ~H"""
    <div>
      <.label :if={@inner_block} for={@id}>
        <strong>{render_slot(@inner_block)}</strong> <.required_label :if={@rest[:required]} />
      </.label>
      <input
        type={@type}
        name={@name}
        id={@id}
        value={Phoenix.HTML.Form.normalize_value(@type, @value)}
        class={[
          "mbta-input",
          @errors != [] && "mbta-input--error",
          @class
        ]}
        {@rest}
      />
      <.feedback :for={msg <- @errors} kind={:error}>{msg}</.feedback>
    </div>
    """
  end

  def format_changeset_errors(errors) do
    Enum.map(errors, fn
      {msg, _} -> msg
      msg -> msg
    end)
  end

  @doc """
  Renders a label.
  """
  attr :class, :string, default: ""
  attr :for, :string, default: nil
  attr :rest, :global
  slot :inner_block, required: true

  def label(assigns) do
    ~H"""
    <label for={@for} class={"mbta-label #{@class}"} {@rest}>
      {render_slot(@inner_block)}
    </label>
    """
  end

  def required_label(assigns) do
    ~H"""
    <div class="mbta-label--required">{Gettext.gettext(MbtaMetro.Gettext, "Required")}</div>
    """
  end
end
