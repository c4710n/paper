defmodule PaperTest do
  use ExUnit.Case
  doctest Paper

  test "greets the world" do
    assert Paper.hello() == :world
  end
end
