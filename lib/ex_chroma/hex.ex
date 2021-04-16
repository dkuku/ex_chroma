defmodule ExChroma.Hex do
  @moduledoc """
  # A hex triplet

  A hex triplet is a six-digit, three-byte hexadecimal number used in HTML, CSS, SVG,
  and other computing applications to represent colors.
  The bytes represent the red, green, and blue components of the color.
  One byte represents a number in the range 00 to FF (in hexadecimal notation),
  or 0 to 255 in decimal notation. This represents the least (0) to the most (255)
  intensity of each of the color components. Thus web colors specify colors in
  the 24-bit RGB color scheme. The hex triplet is formed by concatenating three bytes
  in hexadecimal notation, in the following order:

    Byte 1: red value (color type red)
    Byte 2: green value (color type green)
    Byte 3: blue value (color type blue)

  For example, consider the color where the red/green/blue values are decimal numbers:
  red=36, green=104, blue=160 (a grayish-blue color). The decimal numbers 36, 104, and 160
  are equivalent to the hexadecimal numbers 24, 68, and A0 respectively.
  The hex triplet is obtained by concatenating the six hexadecimal digits together,
  2468A0 in this example.

  If any one of the three color values is less than 10 hex (16 decimal),
  it must be represented with a leading zero so that the triplet always has exactly six digits.
  For example, the decimal triplet 4, 8, 16 would be represented by the hex digits 04, 08, 10,
  forming the hex triplet 040810.

  The number of colors that can be represented by this system is 166 or 2563 or 224 = 16,777,216.

  ## Shorthand hexadecimal form
  #
  An abbreviated, three (hexadecimal)-digit form is used.
  Expanding this form to the six-digit form is as simple as doubling each digit:
  09C becomes 0099CC
  """
  @doc """
  iex()> ExChroma.from_rgb({50, 50, 50, 1})
  "323232"
  iex()> ExChroma.from_rgb({50, 50, 50, 0.5})
  "32323280"
  """
  def from_rgb({r, g, b, a}) when a == 1 or a == 1.0 do
    Base.encode16(<<r>>) <> Base.encode16(<<g>>) <> Base.encode16(<<b>>)
  end

  def from_rgb({r, g, b, a}) do
    Base.encode16(<<r>>) <>
      Base.encode16(<<g>>) <> Base.encode16(<<b>>) <> Base.encode16(<<round(a * 255)>>)
  end

  @doc """
  Colors are stored in a tuple as
  {R, G, B, A}
  allowed types are:

  iex()> ExChroma.to_rgb("#ABC")
  {170, 187, 204, 1}
  iex()> ExChroma.to_rgb("#ABCD")
  {170, 187, 204, 0.87}
  iex()> ExChroma.to_rgb("#ABCDEF")
  {171, 205, 239, 1}
  iex()> ExChroma.to_rgb("#ABCDEF12")
  {171, 205, 239, 0.07}
  iex()> ExChroma.to_rgb("123") 
  {17, 34, 51, 1}
  iex()> ExChroma.to_rgb("1234")
  {17, 34, 51, 0.27}
  iex()> ExChroma.to_rgb("123456")
  {18, 52, 86, 1}
  iex()> ExChroma.to_rgb("12345678")
  {18, 52, 86, 0.47}
  """

  def to_rgb("#" <> hex_code), do: to_rgb(hex_code)

  def to_rgb(<<r::binary-size(1), g::binary-size(1), b::binary-size(1)>>) do
    {hex_to_int(r <> r), hex_to_int(g <> g), hex_to_int(b <> b), 1}
  end

  def to_rgb(<<r::binary-size(1), g::binary-size(1), b::binary-size(1), a::binary-size(1)>>) do
    {hex_to_int(r <> r), hex_to_int(g <> g), hex_to_int(b <> b), hex_to_alpha(a <> a)}
  end

  def to_rgb(<<r::binary-size(2), g::binary-size(2), b::binary-size(2)>>) do
    {hex_to_int(r), hex_to_int(g), hex_to_int(b), 1}
  end

  def to_rgb(<<r::binary-size(2), g::binary-size(2), b::binary-size(2), a::binary-size(2)>>) do
    {hex_to_int(r), hex_to_int(g), hex_to_int(b), hex_to_alpha(a)}
  end

  defp hex_to_int(hex) do
    hex |> String.upcase() |> Base.decode16!() |> :binary.decode_unsigned()
  end

  defp hex_to_alpha(hex) do
    (hex_to_int(hex) / 255) |> Float.round(2)
  end
end
