defmodule Position do
  defstruct ~w(x y)a

  def build({x, y}) when is_integer(x) and is_integer(y), do: build_safe(x, y)

  def build(_), do: {:error, "invalid position"}

  defp build_safe(x, y), do: {:ok, %Position{x: x, y: y}}
end
