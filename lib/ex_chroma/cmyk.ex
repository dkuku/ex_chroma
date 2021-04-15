defmodule ExChroma.Cmyk do
  @moduledoc """

  """
  @rgb_scale 255
  @cmyk_scale 1.0

  @doc """
  iex()> ExChroma.Cmyk.from_rgb({1, 255, 255, _})
  {1, 0, 0, 0}
  """
  def from_rgb({0, 0, 0, _a} = _black) do
    {0.0, 0.0, 0.0, 1.0}
  end
  def from_rgb({0.0, 0.0, 0.0, _a} = _black) do
    {0.0, 0.0, 0.0, 1.0}
  end

  def from_rgb({r, g, b, _a} = c) do
    # rgb [0,255] -> cmy [0,1]
    c = 1 - r / @rgb_scale
    m = 1 - b / @rgb_scale
    y = 1 - g / @rgb_scale

    # extract out k [0, 1]
    min_cmy = Enum.min([c, m, y])
    c = (c - min_cmy) / (1 - min_cmy)
    m = (m - min_cmy) / (1 - min_cmy)
    y = (y - min_cmy) / (1 - min_cmy)
    k = min_cmy
    {round(c, :cmyk), round(y, :cmyk), round(m, :cmyk),round(k, :cmyk)}
  end

  def to_rgb({c, m, y, k}) do
    r = @rgb_scale * (1.0 - c / @cmyk_scale) * (1.0 - k / @cmyk_scale)
    g = @rgb_scale * (1.0 - m / @cmyk_scale) * (1.0 - k / @cmyk_scale)
    b = @rgb_scale * (1.0 - y / @cmyk_scale) * (1.0 - k / @cmyk_scale)
    {r, g, b, 1.0}
  end

  defp round(num, :cmyk), do: Float.round(num, 2)
end
