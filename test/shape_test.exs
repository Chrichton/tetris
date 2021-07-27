defmodule ShapeTest do
  use ExUnit.Case

  test "rotate_right" do
  end

  test "to_string" do
    expected = """
    □□□□□
    □□□□□
    □■■■□
    □□□■□
    □□□□□\
    """

    assert to_string(Shape.shape_l()) == expected
  end
end
