defmodule Behavior do
  alias Point
  alias Shape

  @callback rotate_right(Point.t() | Shape.t()) :: Point.t() | Shape.t()
  @callback rotate_left(Point.t() | Shape.t()) :: Point.t() | Shape.t()
end
