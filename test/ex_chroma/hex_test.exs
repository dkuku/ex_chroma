defmodule ExChroma.HexTest do
  use ExUnit.Case, async: true

  alias ExChroma.Hex

  describe "Testing HEX to RGB color conversions" do
    test "parse simple #rrggbb HEX colors" do
      assert Hex.to_rgb("#000000") == {0, 0, 0, 1}
      assert Hex.to_rgb("#ffffff") == {255, 255, 255, 1}
      assert Hex.to_rgb("#ff0000") == {255, 0, 0, 1}
      assert Hex.to_rgb("#00ff00") == {0, 255, 0, 1}
      assert Hex.to_rgb("#0000ff") == {0, 0, 255, 1}
      assert Hex.to_rgb("#ff00ff") == {255, 0, 255, 1}
      assert Hex.to_rgb("#888888") == {136, 136, 136, 1}
    end

    test "parse simple rrggbb HEX colors" do
      assert Hex.to_rgb("000000") == {0, 0, 0, 1}
      assert Hex.to_rgb("ffffff") == {255, 255, 255, 1}
      assert Hex.to_rgb("ff0000") == {255, 0, 0, 1}
      assert Hex.to_rgb("00ff00") == {0, 255, 0, 1}
      assert Hex.to_rgb("0000ff") == {0, 0, 255, 1}
      assert Hex.to_rgb("ff00ff") == {255, 0, 255, 1}
      assert Hex.to_rgb("888888") == {136, 136, 136, 1}
    end

    test "parse simple #rgb HEX colors" do
      assert Hex.to_rgb("#000") == {0, 0, 0, 1}
      assert Hex.to_rgb("#fff") == {255, 255, 255, 1}
      assert Hex.to_rgb("#f00") == {255, 0, 0, 1}
      assert Hex.to_rgb("#0f0") == {0, 255, 0, 1}
      assert Hex.to_rgb("#00f") == {0, 0, 255, 1}
      assert Hex.to_rgb("#f0f") == {255, 0, 255, 1}
      assert Hex.to_rgb("#888") == {136, 136, 136, 1}
    end

    test "parse simple rgb HEX colors" do
      assert Hex.to_rgb("000") == {0, 0, 0, 1}
      assert Hex.to_rgb("fff") == {255, 255, 255, 1}
      assert Hex.to_rgb("f00") == {255, 0, 0, 1}
      assert Hex.to_rgb("0f0") == {0, 255, 0, 1}
      assert Hex.to_rgb("00f") == {0, 0, 255, 1}
      assert Hex.to_rgb("f0f") == {255, 0, 255, 1}
      assert Hex.to_rgb("888") == {136, 136, 136, 1}
    end
  end

  describe "Testing HEX to RGB color conversions with alpha" do
    test "parse simple #rrggbb HEX colors" do
      assert Hex.to_rgb("#00000000") == {0, 0, 0, 0}
      assert Hex.to_rgb("#000000FF") == {0, 0, 0, 1}
      assert Hex.to_rgb("#00000088") == {0, 0, 0, 0.53}
      assert Hex.to_rgb("#ffffff01") == {255, 255, 255, 0.0}
      assert Hex.to_rgb("#ff000002") == {255, 0, 0, 0.01}
      assert Hex.to_rgb("#ff000003") == {255, 0, 0, 0.01}
      assert Hex.to_rgb("#ff000005") == {255, 0, 0, 0.02}
      assert Hex.to_rgb("#00ff00") == {0, 255, 0, 1}
      assert Hex.to_rgb("#0000ff") == {0, 0, 255, 1}
      assert Hex.to_rgb("#ff00ff") == {255, 0, 255, 1}
      assert Hex.to_rgb("#888888") == {136, 136, 136, 1}
      assert Hex.to_rgb("0000ff") == {0, 0, 255, 1}
      assert Hex.to_rgb("#ff00") == {255, 255, 0, 0}
      assert Hex.to_rgb("#8888") == {136, 136, 136, 0.53}
      assert Hex.to_rgb("8888") == {136, 136, 136, 0.53}
    end
  end
end
