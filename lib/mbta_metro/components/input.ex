defmodule MbtaMetro.Components.Input do
  @moduledoc false

  use Phoenix.Component

  import MbtaMetro.Components.Feedback

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
    |> assign(
      :label,
      assigns.label ||
        Phoenix.Naming.humanize(assigns.value)
    )
    |> assign(:errors, errors)
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
    <div class="flex">
      <input type="hidden" name={@name} value="false" disabled={@rest[:disabled]} />
      <input
        type="checkbox"
        id={@id}
        name={@name}
        value="true"
        checked={@checked}
        class={[
          "shrink-0 mt-1 mr-3 border-silver-400 rounded text-blue-600 focus:border-blue-300 checked:border-blue-500 disabled:opacity-50 disabled:pointer-events-none",
          @class
        ]}
        {@rest}
      />
      <.label for={@id}><%= @label %></.label>
    </div>
    """
  end

  def input(%{type: "radio"} = assigns) do
    assigns = assigns |> assign_new(:checked, fn -> false end)

    ~H"""
    <div class="flex">
      <input
        type="radio"
        id={@id}
        name={@name}
        value={@value}
        checked={@checked}
        class={[
          "shrink-0 mt-1 mr-3 border-silver-400 rounded-full text-blue-600 focus:border-blue-300 checked:border-blue-500 disabled:opacity-50 disabled:pointer-events-none",
          @class
        ]}
        {@rest}
      />
      <.label for={@id}><%= @label %></.label>
    </div>
    """
  end

  def input(%{type: "select"} = assigns) do
    ~H"""
    <div>
      <.label for={@id}><%= @label %></.label>
      <select
        id={@id}
        name={@name}
        class="mt-2 block w-full rounded-md border border-silver-400 bg-white shadow-sm focus:border-blue-500 focus:ring-0 sm:text-sm"
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
      <.label for={@id}><%= @label %></.label>
      <textarea
        id={@id}
        name={@name}
        class={[
          "mt-2 block w-full rounded text-silver-900 focus:ring-0 sm:text-sm sm:leading-6 min-h-[6rem]",
          @errors == [] && "border-silver-400 focus:border-blue-500",
          @errors != [] && "border-red-400 focus:border-red-500"
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
      <.label for={@id}><%= @label %></.label>
      <input
        type={@type}
        name={@name}
        id={@id}
        value={Phoenix.HTML.Form.normalize_value(@type, @value)}
        class={[
          "mt-2 block w-full rounded text-silver-900 focus:ring-0 sm:text-sm sm:leading-6",
          @errors == [] && "border-silver-400 focus:border-blue-500",
          @errors != [] && "border-red-400 focus:border-red-500"
        ]}
        {@rest}
      />
      <.feedback :for={msg <- @errors} kind={:error}><%= msg %></.feedback>
    </div>
    """
  end

  @doc """
  Renders a label.
  """
  attr :for, :string, default: nil
  slot :inner_block, required: true

  def label(assigns) do
    ~H"""
    <label for={@for} class="block text-sm font-inter-semibold leading-6 text-silver-800">
      <%= render_slot(@inner_block) %>
    </label>
    """
  end

  attr :type, :string, values: ~W(checkbox radio)

  attr :field, Phoenix.HTML.FormField,
    required: true,
    doc: "a form field struct retrieved from the form, for example: @form[:color]"

  attr :rest, :global

  slot :input_item, doc: "Items to render as a list" do
    attr :id, :string
    attr :label, :string, doc: "The label displayed. The value will be used as default."
    attr :value, :any, required: true, doc: "The value assumed then the item is checked"
    attr :checked, :boolean
  end

  def input_group(assigns) do
    ~H"""
    <ul class="m-0 p-0 flex flex-col sm:flex-row list-none">
      <li
        :for={item <- @input_item}
        class={[
          "border border-solid border-slate-200",
          "has-[:checked]:bg-slate-100 has-[:checked]:border-slate-700",
          "first:max-sm:rounded-t-lg last:max-sm:rounded-b-lg",
          "sm:first:rounded-l-lg sm:last:rounded-r-lg"
        ]}
      >
        <.input
          id={item.id}
          type={@type}
          field={@field}
          label={item[:label]}
          value={item.value}
          checked={item[:checked]}
          multiple={if(@type == "checkbox", do: "true")}
          {@rest}
        />
      </li>
    </ul>
    """
  end

  @doc """
  Renders a simple fieldset for grouping radio and checkbox inputs.
  """
  attr :legend, :string, required: true, doc: "A concise label for the fieldset."

  slot :inner_block,
    required: true,
    doc: "The fieldset content, containing multiple options for a radio input or checkbox input."

  def fieldset(assigns) do
    ~H"""
    <fieldset class="my-3 w-full">
      <legend class="font-semifold text-slate-600 text-sm"><%= @legend %></legend>
      <%= render_slot(@inner_block) %>
    </fieldset>
    """
  end
end
