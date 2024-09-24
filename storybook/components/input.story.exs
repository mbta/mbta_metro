defmodule Storybook.Components.InputGroup do
  use PhoenixStorybook.Story, :component

  alias MbtaMetro.Components.Input

  def function, do: &Input.input/1

  def variations do
    [
      checkbox(),
      select(),
      password(),
      radio(),
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
        label: "Label",
        name: Faker.Lorem.word(),
        type: "checkbox",
        value: "true"
      }
    }
  end

  def password do
    %Variation{
      id: :password,
      description: "Password",
      attributes: %{
        errors: [],
        id: Faker.Lorem.word(),
        label: "Label",
        name: Faker.Lorem.word(),
        type: "password",
        value: nil
      }
    }
  end

  def radio do
    %Variation{
      id: :radio,
      description: "Radio",
      attributes: %{
        errors: [],
        id: Faker.Lorem.word(),
        label: "Label",
        name: Faker.Lorem.word(),
        type: "radio",
        value: "true"
      }
    }
  end

  def select do
    options = [
      "One": "one",
      "Two": "two",
      "Three": "three"
    ]

    %Variation{
      id: :select,
      description: "Select",
      attributes: %{
        errors: [],
        id: Faker.Lorem.word(),
        label: "Label",
        name: Faker.Lorem.word(),
        options: options,
        type: "select",
        value: "two"
      }
    }
  end

  def text do
    %Variation{
      id: :text,
      description: "Text",
      attributes: %{
        errors: [],
        id: Faker.Lorem.word(),
        label: "Label",
        name: Faker.Lorem.word(),
        type: "text",
        value: nil
      }
    }
  end

  def textarea do
    %Variation{
      id: :textarea,
      description: "Textarea",
      attributes: %{
        errors: [],
        id: Faker.Lorem.word(),
        label: "Label",
        name: Faker.Lorem.word(),
        type: "textarea",
        value: Faker.Lorem.sentence(5)
      }
    }
  end
end
