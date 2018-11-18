defmodule Direction do
  defstruct ~w(value)a

  def build(direction = :west), do: build_safe(direction)
  def build(direction = :east), do: build_safe(direction)
  def build(direction = :south), do: build_safe(direction)
  def build(direction = :north), do: build_safe(direction)

  def build(_), do: {:error, "invalid direction"}

  defp build_safe(direction), do: {:ok, %Direction{value: direction}}
end
