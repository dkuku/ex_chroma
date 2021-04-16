defmodule ExChroma do
  @moduledoc """
  Documentation for `ExChroma`.

  """

  @doc """
  iex()> ExChroma.rgb2hex({50, 50, 50, 1})
  "323232"
  iex()> ExChroma.rgb2hex({50, 50, 50, 0.5})
  "32323280"
  """
  def rgb2hex({r, g, b, a}) when a == 1 or a == 1.0 do
    Base.encode16(<<r>>) <> Base.encode16(<<g>>) <> Base.encode16(<<b>>)
  end

  def rgb2hex({r, g, b, a}) do
    Base.encode16(<<r>>) <>
      Base.encode16(<<g>>) <> Base.encode16(<<b>>) <> Base.encode16(<<round(a * 255)>>)
  end

  @doc """
  Colors are stored in a tuple as
  {R, G, B, A}
  allowed types are:

  iex()> ExChroma.hex2rgb("#ABC")
  {170, 187, 204, 1}
  iex()> ExChroma.hex2rgb("#ABCD")
  {170, 187, 204, 0.87}
  iex()> ExChroma.hex2rgb("#ABCDEF")
  {171, 205, 239, 1}
  iex()> ExChroma.hex2rgb("#ABCDEF12")
  {171, 205, 239, 0.07}
  iex()> ExChroma.hex2rgb("123") 
  {17, 34, 51, 1}
  iex()> ExChroma.hex2rgb("1234")
  {17, 34, 51, 0.27}
  iex()> ExChroma.hex2rgb("123456")
  {18, 52, 86, 1}
  iex()> ExChroma.hex2rgb("12345678")
  {18, 52, 86, 0.47}
  """

  def hex2rgb("#" <> hex_code), do: hex2rgb(hex_code)

  def hex2rgb(<<r::binary-size(1), g::binary-size(1), b::binary-size(1)>>) do
    {hex_to_int(r <> r), hex_to_int(g <> g), hex_to_int(b <> b), 1}
  end

  def hex2rgb(<<r::binary-size(1), g::binary-size(1), b::binary-size(1), a::binary-size(1)>>) do
    {hex_to_int(r <> r), hex_to_int(g <> g), hex_to_int(b <> b), hex_to_alpha(a <> a)}
  end

  def hex2rgb(<<r::binary-size(2), g::binary-size(2), b::binary-size(2)>>) do
    {hex_to_int(r), hex_to_int(g), hex_to_int(b), 1}
  end

  def hex2rgb(<<r::binary-size(2), g::binary-size(2), b::binary-size(2), a::binary-size(2)>>) do
    {hex_to_int(r), hex_to_int(g), hex_to_int(b), hex_to_alpha(a)}
  end

  defp hex_to_int(hex) do
    hex |> String.upcase() |> Base.decode16!() |> :binary.decode_unsigned()
  end

  defp hex_to_alpha(hex) do
    (hex_to_int(hex) / 255) |> Float.round(2)
  end
end
