defmodule Direction do
  defstruct ~w(value)a

  def build(direction = :west), do: build_safe(direction)
  def build(direction = :east), do: build_safe(direction)
  def build(direction = :south), do: build_safe(direction)
  def build(direction = :north), do: build_safe(direction)

  def build(_), do: {:error, "invalid direction"}

  def turn_left(direction = %Direction{value: :north}), do: %{direction | value: :west}
  def turn_left(direction = %Direction{value: :west}), do: %{direction | value: :south}
  def turn_left(direction = %Direction{value: :south}), do: %{direction | value: :east}
  def turn_left(direction = %Direction{value: :east}), do: %{direction | value: :north}

  def turn_right(direction = %Direction{value: :north}), do: %{direction | value: :east}
  def turn_right(direction = %Direction{value: :west}), do: %{direction | value: :north}
  def turn_right(direction = %Direction{value: :south}), do: %{direction | value: :west}
  def turn_right(direction = %Direction{value: :east}), do: %{direction | value: :south}

  defp build_safe(direction), do: {:ok, %Direction{value: direction}}
end
