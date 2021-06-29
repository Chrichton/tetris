defmodule Point do
  @behaviour Behavior

  alias __MODULE__

  @enforce_keys [:x, :y]
  defstruct x: 0, y: 0
  @type t :: %__MODULE__{x: integer, y: integer}

  @spec new(integer, integer) :: Point.t()
  def new(x, y) when is_integer(x) and is_integer(y),
    do: %Point{x: x, y: y}

  def from_tuple({x, y}) when is_integer(x) and is_integer(y),
    do: %Point{x: x, y: y}

  @impl Behavior
  # @spec transpose(Point.t()) :: Point.t()
  def transpose(%Point{} = point), do: Point.new(point.y, point.x)

  @spec reflect_y(Point.t()) :: Point.t()
  def reflect_y(%Point{} = point), do: Point.new(point.x, -point.y)

  @spec rotate_right(Point.t()) :: Point.t()
  def rotate_right(%Point{} = point) do
    point
    |> reflect_y
    |> transpose
  end
end
