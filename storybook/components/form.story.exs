defmodule Storybook.Components.FormInputs do
  use PhoenixStorybook.Story, :component

  alias MbtaMetro.Components.Input

  def function, do: &Input.input/1

  def variations do
    [
      checkbox(),
      password(),
      radio(),
      select(),
      text(),
      textarea()
    ]
  end

  def checkbox do
    %Variation{
      id: :checkbox,
      description: "Checkbox",
      attributes: %{
        errors: [],
        id: Faker.Lorem.word(),
        name: Faker.Lorem.word(),
        type: "checkbox",
        value: "true"
      },
      slots: ["Label"],
      note: """
      A pre-set option that can be set to true or false.

      ### When to use

      * **Asking for consent or providing a way to opt out.** For example: "I have read and agree to the Privacy Policy."

      * **Asking for a simple a yes or no.** For example: "Prefer accessible routes"

      ### When to consider something else

      * **There's more than one possible response.** In that case, use a checkbox group, radio group, select, or text input.
      """
    }
  end

  def password do
    %Variation{
      id: :password,
      description: "Password",
      attributes: %{
        required: true,
        errors: ["This field is required"],
        id: Faker.Lorem.word(),
        name: Faker.Lorem.word(),
        type: "password",
        value: nil
      },
      slots: ["Label"],
      note: """
      A text input field of `type` `password` where the text entered is masked with bullets.

      ### When to use

      * **Use sparingly when there is a risk of typed text exposing sensitive private information** to passers-by such as passwords, social security numbers, and PIN numbers.

      ### Usability guidance

      * **Add a "Show password" checkbox if possible.** Provide an option to show the text entered, particularly if requiring confirmation.
      """
    }
  end

  def radio do
    %Variation{
      id: :radio,
      description: "Radio",
      attributes: %{
        errors: [],
        id: Faker.Lorem.word(),
        name: Faker.Lorem.word(),
        type: "radio",
        value: "true"
      },
      slots: ["Label"],
      note: """
      A pre-set option that can be set to true or false, and not unset. **Do not use this single component.** Instead, use the `type` of `checkbox` for simple yes/no questions, or `input_group` component to present multiple options.
      """
    }
  end

  def select do
    options = [
      One: "one",
      Two: "two",
      Three: "three",
      Four: "four",
      Five: "five",
      Six: "six",
      Seven: "seven",
      Eight: "eight"
    ]

    %Variation{
      id: :select,
      description: "Select",
      attributes: %{
        errors: [],
        id: Faker.Lorem.word(),
        name: Faker.Lorem.word(),
        options: options,
        type: "select",
        value: "two"
      },
      slots: ["Label"],
      note: """
      Allows users to choose one option from a list of pre-set options.

      ### When to use

      * **Use sparingly.** Use the select component only when a user needs to choose from over 7 to under 15 possible options and you have limited space to display the options.

      ### When to consider something else

      * **Fewer than seven options.** Use radio buttons instead.

      * **Site navigation.** Use navigation components instead.
      """
    }
  end

  def text do
    %Variation{
      id: :text,
      description: "Text",
      attributes: %{
        errors: ["Something went wrong", "Stop trying"],
        id: Faker.Lorem.word(),
        name: Faker.Lorem.word(),
        type: "text",
        value: nil
      },
      slots: ["Label"],
      note: """
      Allows users to enter any combination of letters, numbers, or symbols.

      ### When to use

      * **Unpredictable or freeform responses.** If you can't predict a user's answer to a prompt.

      * **Pasted content.** If you want to support the user pasting from another source.

      ### When to consider something else

      * **Predetermined or small set of possible responses.** Use predefined options in a `radio`, `checkbox`, or `select` instead.
      """
    }
  end

  def textarea do
    %Variation{
      id: :textarea,
      description: "Textarea",
      attributes: %{
        errors: [],
        id: Faker.Lorem.word(),
        name: Faker.Lorem.word(),
        type: "textarea",
        value: Faker.Lorem.sentence(5)
      },
      slots: ["Label"],
      note: """
      Multiline text input when prompts require a longer or narrative response from users.

      ### When to use

      * **Expected response to a prompt is longer than 30-40 characters.** If the expected response is longer than a `text` input on mobile, consider using `textarea` instead.
      """
    }
  end
end
