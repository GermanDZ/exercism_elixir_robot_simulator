defmodule Position do
  defstruct ~w(x y)a

  def build({x, y}) when is_integer(x) and is_integer(y), do: build_safe(x, y)

  def build(_), do: {:error, "invalid position"}

  def move(position, %Direction{value: :north}), do: %{position | y: position.y + 1}
  def move(position, %Direction{value: :east}), do: %{position | x: position.x + 1}
  def move(position, %Direction{value: :south}), do: %{position | y: position.y - 1}
  def move(position, %Direction{value: :west}), do: %{position | x: position.x - 1}

  defp build_safe(x, y), do: {:ok, %Position{x: x, y: y}}
end
