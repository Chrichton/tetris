defmodule Behavior do
  alias Point
  alias Shape

  @callback transpose(Point.t() | Shape.t()) :: Point.t | Shape.t()
end
