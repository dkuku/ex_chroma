defmodule ExChroma.Rgba do
  @typedoc """

  A color tuple with r, g, b in the range 0 - 255 and alpha in range 0.0 - 1.0
  """
  @type t :: {0..255, 0..255, 0..255, number()}

  @doc """

  Parses strings in shape of
  rgba(0,0,0,0)
  rgb(0,0,0,0)

  Examples:
    iex> ExChroma.Rgba.from_rgba("rgb(0,0,0)")
    {0, 0, 0, 1.0}
    iex> ExChroma.Rgba.from_rgba("rgba(0,0,0,0)")
    {0, 0, 0, 0.0}
    iex> ExChroma.Rgba.from_rgba("rgba(128,128,128,0.5)")
    {128, 128, 128, 0.5}
    iex> ExChroma.Rgba.from_rgba("rgb(12,34,56)")
    {12, 34, 56, 1.0}
  """
  def from_rgba("rgb("<>values), do: from_rgba(values)
  def from_rgba("rgba("<>values), do: from_rgba(values)
  def from_rgba(values) do
    values
    |> String.split(",")
    |> Enum.map(fn x -> x |> String.trim() |> Float.parse |> elem(0) end)
    |> case do
      [r, g, b, a] -> {round(r), round(g), round(b), a}
      [r, g, b] -> {round(r), round(g), round(b), 1.0}
      _ -> 
        IO.puts("cannot parse #{values}")
        {:error, :parse_error}
    end
  end
end
