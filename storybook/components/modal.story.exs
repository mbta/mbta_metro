defmodule Storybook.Components.Modal do
  @moduledoc false

  use PhoenixStorybook.Story, :page

  import MbtaMetro.Components.Modal

  def render(assigns) do
    ~H"""
    <div>
      <.modal_trigger modal_id="foo">
        Click here to open the modal.
      </.modal_trigger>
      <.modal id="foo">
        <p>This is a modal. It can contain anything!</p>
        <p>{Faker.Lorem.paragraph()}</p>
      </.modal>

      <.modal_trigger modal_id="foo2">
        Bigger example
      </.modal_trigger>
      <.modal id="foo2">
        <p>{Faker.Lorem.paragraph()}</p>
        <p>{Faker.Lorem.paragraph()}</p>
        <p>{Faker.Lorem.paragraph()}</p>
        <p>{Faker.Lorem.paragraph()}</p>
        <p>{Faker.Lorem.paragraph()}</p>
        <p>{Faker.Lorem.paragraph()}</p>
        <p>{Faker.Lorem.paragraph()}</p>
        <p>{Faker.Lorem.paragraph()}</p>
        <p>{Faker.Lorem.paragraph()}</p>
        <p>{Faker.Lorem.paragraph()}</p>
        <p>{Faker.Lorem.paragraph()}</p>
        <p>{Faker.Lorem.paragraph()}</p>
        <p>{Faker.Lorem.paragraph()}</p>
      </.modal>
    </div>
    """
  end
end
