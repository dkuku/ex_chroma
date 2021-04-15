defmodule ExChromaTest do
  use ExUnit.Case, async: true

  alias ExChroma
  describe "Testing HEX2RGB color conversions" do
    test "parse simple #rrggbb HEX colors" do
      
      assert ExChroma.hex2rgb("#000000") ==  {0,0,0,1}
      #,"#ffffff","#ff0000","#00ff00","#0000ff","#ffff00","#00ffff","#ff00ff"],

    end
  end
end
