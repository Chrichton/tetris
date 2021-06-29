defmodule PointTest do
  use ExUnit.Case

  alias Point

  test "rotate_right" do
    Point.new(0, 0)
    assert Point.rotate_right(Point.new(0, 0)) == Point.new(0, 0)
  end
end
