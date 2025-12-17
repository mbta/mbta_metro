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
      slots: ["Label"]
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
      slots: ["Label"]
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
      slots: ["Label"]
    }
  end

  def select do
    options = [
      One: "one",
      Two: "two",
      Three: "three"
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
      slots: ["Label"]
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
      slots: ["Label"]
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
      slots: ["Label"]
    }
  end
end
