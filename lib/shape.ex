defmodule Shape do
  @behaviour Behavior

  @enforce_keys [:points]
  defstruct points: []
  @type t :: %__MODULE__{points: [Point.t()]}

  alias Point

  @impl Behavior
  def transpose(%Shape{} = shape) do
    points = Enum.map(shape.points, &Point.transpose/1)
    %Shape{points: points}
  end

  def reflect_y(%Shape{} = shape) do
    points = Enum.map(shape.points, &Point.reflect_y/1)
    %Shape{points: points}
  end

  def rotate_right(%Shape{} = shape) do
    points = Enum.map(shape.points, &Point.rotate_right/1)
    %Shape{points: points}
  end

  def rotate_left(%Shape{} = shape) do
    points = Enum.map(shape.points, &Point.rotate_left/1)
    %Shape{points: points}
  end

  def shape_l() do
    %Shape{
      points: [
        Point.new(-1, 2),
        Point.new(0, 2),
        Point.new(1, 2),
        Point.new(1, 3)
      ]
    }
  end

  defimpl String.Chars do
    def to_string(%Shape{} = shape) do
      map =
        shape.points
        |> Enum.map(fn point -> {{point.x, point.y}, "■"} end)
        |> Map.new()

      for y <- 4..-4, x <- -4..4 do
        Map.get(map, {x, y}, "□")
      end
      |> Enum.chunk_every(9)
      |> Enum.map(&Enum.join/1)
      |> Enum.join("\n")
    end
  end

  def print(%Shape{} = shape) do
    shape
    |> to_string()
    |> IO.puts()
  end
end
