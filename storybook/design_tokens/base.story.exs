defmodule Storybook.DesignTokens.Base do
  use PhoenixStorybook.Story, :page

  import MbtaMetro.DocComponents

  def doc,
    do:
      "Design tokens are the smallest building blocks of any design system. Using design tokens to design and build components helps reduce cognitive load for both designers and developers. By intentionally limiting choices for colors, typography, borders, and spacing to ones that harmonize, the result is faster design and development time, and a more consistent interface."

  def render(assigns) do
    assigns = assign(assigns, :tokens, MbtaMetro.Tokens.base_values())

    ~H"""
    <section
      :for={
        k <-
          ~w(border-radius border-width spacing line-height transition-duration font-size font-family)
      }
      key={k}
    >
      <h2>{k}</h2>
      <.notes type={k} />
      <.tokens_list tokens={Map.get(@tokens, k)} />
    </section>
    """
  end

  defp notes(%{type: "border-radius"} = assigns) do
    ~H"""
    <ul class="list-disc pl-lg">
      <li>
        <.code>border-radius/DEFAULT</.code>
        should be used in most circumstances for buttons, cards, etc.
      </li>
      <li>
        Use other sizes sparingly in more editorial contexts such as call-outs that are large where default rounding looks out of proportion. Always consider mobile breakpoints when using larger border radii.
      </li>
    </ul>
    """
  end

  defp notes(%{type: "border-width"} = assigns) do
    ~H"""
    <ul class="list-disc pl-lg">
      <li>
        <.code>border-width/DEFAULT</.code>
        should be used in most circumstances for inputs, secondary buttons, etc.
      </li>
      <li>
        Use thicker or thinner widths sparingly, in very specific circumstances where context requires it.
      </li>
      <li>
        Do not use border thickness to denote focus on an element. Use a component's focus property to add a second border or box-shadow with the Semantic focus color.
      </li>
    </ul>
    """
  end

  defp notes(%{type: "spacing"} = assigns) do
    ~H"""
    <.notes_list>
      <li>
        Spacing variables are meant to work hand-in-hand with
        <.code>line-height</.code>
        to create a de-facto baseline grid based on increments of <.code>4px</.code>.
      </li>
      <li>
        Where possible, aim for elements and their padding and margin to add up to increments of the
        <.code>line-height/DEFAULT</.code>
        of <.code>24px</.code>.
      </li>
      <li>
        There are both semantic spacing variables, such as
        <.code>sm</.code>
        and <.code>md</.code>, and numbered spacing variables, such as
        <.code>2</.code>
        or <.code>4</.code>. Both are supported.
      </li>
      <li>Numbered spacing variables are inspired by Tailwind's numbered spacing variables.</li>
    </.notes_list>
    """
  end

  defp notes(%{type: "line-height"} = assigns) do
    ~H"""
    <.notes_list>
      <li>
        <.code>line-height</.code>
        and
        <.code>font-size</.code>
        variables are meant to be used together.
      </li>
      <li>
        For instance, use
        <.code>line-height/DEFAULT</.code>
        with
        <.code>font-size/DEFAULT</.code>
        and use
        <.code>line-height/sm</.code>
        with
        <.code>font-size/sm</.code>
      </li>
    </.notes_list>
    """
  end

  defp notes(%{type: "transition-duration"} = assigns) do
    ~H"""
    <.notes_list>
      <li>
        Use the default transition-duration for all CSS transitions unless there's a very specific aesthetic or accessibility need for a longer or shorter duration.
      </li>
    </.notes_list>
    """
  end

  defp notes(%{type: "font-size"} = assigns) do
    ~H"""
    <.notes_list>
      <li>
        Use
        <.code>font-size/DEFAULT</.code>
        for body text in most circumstances, paired with
        <.code>line-height/DEFAULT</.code>
      </li>
      <li>
        In cases where compactness is needed, or there is subsidiary information to default size text, you may use
        <.code>font-size/sm</.code>
        paired with
        <.code>line-height/sm</.code>
      </li>
      <li>
        Larger font sizes correspond to heading sizes:
        <.notes_list>
          <li>
            H1:
            <.code>font-size/2xl</.code>
          </li>
          <li>
            H2:
            <.code>font-size/xl</.code>
          </li>
          <li>
            H3:
            <.code>font-size/lg</.code>
          </li>
        </.notes_list>
      </li>
    </.notes_list>
    """
  end

  defp notes(%{type: "font-family"} = assigns) do
    ~H"""
    <.notes_list>
      <li>These tokens provide font stacks that align with the MBTA Web Design Standards</li>
      <li>
        Use
        <.code>font-family/base</.code>
        for all body text.
      </li>
      <li>
        Use
        <.code>font-family/heading</.code>
        for all headings.
      </li>
      <li>
        Do not directly use the
        <.code>font-family/inter</.code>
        or
        <.code>font-family/helvetica</.code>
        tokens, preferring the semantic aliases above.
      </li>
    </.notes_list>
    """
  end

  defp notes(assigns), do: ~H""

  defp notes_list(assigns) do
    ~H"""
    <ul class="list-disc pl-lg mb-lg">
      {render_slot(@inner_block)}
    </ul>
    """
  end
end
