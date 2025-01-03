defmodule MbtaMetro.Components.Input do
  @moduledoc false

  use Phoenix.Component

  import MbtaMetro.Components.Feedback

  defp input_base_classes do
    "border border-cobalt-30 bg-white focus:ring-4 ring-offset-0 ring-cobalt-60 checked:bg-cobalt-30 disabled:opacity-50 disabled:bg-charcoal-20"
  end

  defp input_error_classes do
    "border border-solid border-firebrick-70 focus:border-firebrick-40"
  end

  @doc """
  Renders an input with label and error messages.

  A `Phoenix.HTML.FormField` may be passed as argument,
  which is used to retrieve the input name, id, and values.
  Otherwise all attributes may be passed explicitly.

  ## Types

  This function accepts all HTML input types, considering that:

    * You may also set `type="select"` to render a `<select>` tag

    * `type="checkbox"` is used exclusively to render boolean values

    * For live file uploads, see `Phoenix.Component.live_file_input/1`

  See https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input
  for more information. Unsupported types, such as hidden and radio,
  are best written directly in your templates.

  ## Examples

      <.input field={@form[:email]} type="email" />
      <.input name="my-input" errors={["oh no!"]} />
  """
  attr :id, :any, default: nil
  attr :name, :any
  attr :label, :string, default: nil
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
    |> assign(:label, assigns.label || assigns.value)
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
    <.label for={@id} style="height: var(--minimum-tap-target-size)">
      <input type="hidden" name={@name} value="false" disabled={@rest[:disabled]} />
      <input
        type="checkbox"
        id={@id}
        name={@name}
        value="true"
        checked={@checked}
        class={[
          "shrink-0 mr-sm rounded w-5 h-5",
          input_base_classes(),
          @class
        ]}
        {@rest}
      />
      <%= @label %>
    </.label>
    """
  end

  def input(%{type: "checkbox-button"} = assigns) do
    assigns =
      assigns
      |> assign_new(:checked, fn ->
        Phoenix.HTML.Form.normalize_value("checkbox", assigns[:value])
      end)

    ~H"""
    <.label for={@id} class="px-md">
      <input type="hidden" name={@name} value="false" disabled={@rest[:disabled]} />
      <input
        type="checkbox"
        id={@id}
        name={@name}
        value="true"
        checked={@checked}
        class={[
          "shrink-0 mr-sm rounded w-6 h-6 sr-only",
          input_base_classes(),
          @class
        ]}
        {@rest}
      />
      <span class="w-full text-center">
        <%= @label %>
      </span>
    </.label>
    """
  end

  def input(%{type: "radio"} = assigns) do
    assigns = assigns |> assign_new(:checked, fn -> false end)

    ~H"""
    <.label for={@id} style="height: var(--minimum-tap-target-size)">
      <input
        type="radio"
        id={@id}
        name={@name}
        value={@value}
        checked={@checked}
        class={[
          "shrink-0 mr-sm rounded-full w-5 h-5",
          input_base_classes(),
          @class
        ]}
        {@rest}
      />
      <%= @label %>
    </.label>
    """
  end

  def input(%{type: "radio-button"} = assigns) do
    assigns = assigns |> assign_new(:checked, fn -> false end)

    ~H"""
    <.label for={@id} class="px-md">
      <input
        type="radio"
        id={@id}
        name={@name}
        value={@value}
        checked={@checked}
        class={[
          "shrink-0 mr-sm rounded-full w-6 h-6 sr-only",
          input_base_classes(),
          @class
        ]}
        {@rest}
      />
      <span class="w-full text-center">
        <%= @label %>
      </span>
    </.label>
    """
  end

  def input(%{type: "select"} = assigns) do
    ~H"""
    <div>
      <.label :if={@label} for={@id} class="font-bold"><%= @label %></.label>
      <select
        id={@id}
        name={@name}
        class={[
          "shadow-sm rounded px-md py-sm",
          input_base_classes(),
          @class
        ]}
        multiple={@multiple}
        {@rest}
      >
        <option :if={@prompt} value=""><%= @prompt %></option>
        <%= Phoenix.HTML.Form.options_for_select(@options, @value) %>
      </select>
      <.feedback :for={msg <- @errors} kind={:error}><%= msg %></.feedback>
    </div>
    """
  end

  def input(%{type: "textarea"} = assigns) do
    ~H"""
    <div>
      <.label :if={@label} for={@id} class="font-bold"><%= @label %></.label>
      <textarea
        id={@id}
        name={@name}
        class={[
          "min-h-[6rem] rounded px-md py-sm",
          input_base_classes(),
          @errors != [] && input_error_classes(),
          @class
        ]}
        {@rest}
      ><%= Phoenix.HTML.Form.normalize_value("textarea", @value) %></textarea>
      <.feedback :for={msg <- @errors} kind={:error}><%= msg %></.feedback>
    </div>
    """
  end

  # All other inputs text, datetime-local, url, password, etc. are handled here...
  def input(assigns) do
    ~H"""
    <div>
      <.label :if={@label} for={@id} class="font-bold"><%= @label %></.label>
      <input
        type={@type}
        name={@name}
        id={@id}
        value={Phoenix.HTML.Form.normalize_value(@type, @value)}
        class={[
          "rounded px-md py-sm",
          input_base_classes(),
          @errors != [] && input_error_classes(),
          @class
        ]}
        {@rest}
      />
      <.feedback :for={msg <- @errors} kind={:error}><%= msg %></.feedback>
    </div>
    """
  end

  defp format_changeset_errors(errors) do
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
    <label
      for={@for}
      class={"cursor-pointer w-full m-0 py-sm inline-flex items-center #{@class}"}
      {@rest}
    >
      <%= render_slot(@inner_block) %>
    </label>
    """
  end
end
