defmodule RobotSimulator do
  @doc """
  Create a Robot Simulator given an initial direction and position.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @directions [:north, :east, :south, :west]

  @spec create(direction :: atom, position :: {integer, integer}) :: any
  def create(direction \\ nil, position \\ nil)
  def create(nil, nil), do: %{direction: :north, position: {0, 0}}

  def create(direction, _)
      when direction not in @directions,
      do: {:error, "invalid direction"}

  def create(_, position)
      when not is_tuple(position)
      when tuple_size(position) != 2
      when not is_number(elem(position, 0))
      when not is_number(elem(position, 1)),
      do: {:error, "invalid position"}

  def create(direction, position) do
    %{direction: direction, position: position}
  end

  @doc """
  Simulate the robot's movement given a string of instructions.

  Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)
  """
  @spec simulate(robot :: any, instructions :: String.t()) :: any
  def simulate(robot, instructions) do
    if is_valid?(instructions) do
      String.codepoints(instructions)
      |> Enum.reduce(robot, &move/2)
    else
      {:error, "invalid instruction"}
    end
  end

  defp is_valid?(instructions) do
    valid = String.codepoints("RLA")

    String.codepoints(instructions)
    |> Enum.all?(fn x -> x in valid end)
  end

  defp move("L", robot = %{direction: :north}), do: %{robot | direction: :west}
  defp move("L", robot = %{direction: :east}), do: %{robot | direction: :north}
  defp move("L", robot = %{direction: :south}), do: %{robot | direction: :east}
  defp move("L", robot = %{direction: :west}), do: %{robot | direction: :south}

  defp move("R", robot = %{direction: :north}), do: %{robot | direction: :east}
  defp move("R", robot = %{direction: :east}), do: %{robot | direction: :south}
  defp move("R", robot = %{direction: :south}), do: %{robot | direction: :west}
  defp move("R", robot = %{direction: :west}), do: %{robot | direction: :north}

  defp move("A", robot) do
    cond do
      robot.direction == :north ->
        {x, y} = robot.position
        %{robot | position: {x, y + 1}}

      robot.direction == :east ->
        {x, y} = robot.position
        %{robot | position: {x + 1, y}}

      robot.direction == :south ->
        {x, y} = robot.position
        %{robot | position: {x, y - 1}}

      robot.direction == :west ->
        {x, y} = robot.position
        %{robot | position: {x - 1, y}}
    end
  end

  @doc """
  Return the robot's direction.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec direction(robot :: any) :: atom
  def direction(robot) do
    robot.direction
  end

  @doc """
  Return the robot's position.
  """
  @spec position(robot :: any) :: {integer, integer}
  def position(robot) do
    robot.position
  end
end
