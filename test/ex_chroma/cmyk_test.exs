defmodule ExChroma.CmykTest do
  use ExUnit.Case, async: true
  doctest ExChroma.Cmyk

  alias ExChroma.Cmyk

  describe "rgb can be converted to cmyk" do
    test "rgb can be converted to cmyk" do
      for {name, rgb, cmyk} <- test_data() do
        assert Cmyk.from_rgb(rgb) == cmyk, name
      end
    end

    test "cmyk can be converted to rgb" do
      for {name, {r, g, b, _a}, cmyk} <- test_data() do
        {r1, g1, b1, _a} = Cmyk.to_rgb(cmyk)
        assert_in_delta r, r1, 2, name
        assert_in_delta g, g1, 2, name
        assert_in_delta b, b1, 2, name
      end
    end

    def test_data() do
      [
        {"Cyan", {0, 255, 255, 1.0}, {1, 0, 0, 0}},
        {"Magenta", {255, 0, 255, 1.0}, {0.0, 1.0, 0.0, 0.0}},
        {"Yellow", {255, 255, 0, 1.0}, {0.0, 0.0, 1.0, 0.0}},
        {"Black", {0, 0, 0, 1.0}, {0.0, 0.0, 0.0, 1.0}},
        {"Red", {255, 0, 0, 1.0}, {0.0, 1.0, 1.0, 0.0}},
        {"Green", {0, 255, 0, 1.0}, {1.0, 0.0, 1.0, 0.0}},
        {"Blue", {0, 0, 255, 1.0}, {1.0, 1.0, 0.0, 0.0}},
        {"White", {255, 255, 255, 1.0}, {0.0, 0.0, 0.0, 0.0}},
        {"Turquoise", {48, 213, 200, 1.0}, {0.77, 0.0, 0.06, 0.16}},
        {"Metallic Gold", {212, 175, 55, 1.0}, {0.0, 0.17, 0.74, 0.17}}
      ]
    end
  end
end
