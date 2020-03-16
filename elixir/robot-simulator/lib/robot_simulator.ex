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

    is_valid? =
      String.codepoints(instructions)
      |> Enum.all?(fn x -> x in valid end)
  end

  defp move("L", robot) do
    cond do
      robot.direction == :north ->
        %{robot | direction: :west}

      robot.direction == :east ->
        %{robot | direction: :north}

      robot.direction == :south ->
        %{robot | direction: :east}

      robot.direction == :west ->
        %{robot | direction: :south}
    end
  end

  defp move("R", robot) do
    cond do
      robot.direction == :north ->
        %{robot | direction: :east}

      robot.direction == :east ->
        %{robot | direction: :south}

      robot.direction == :south ->
        %{robot | direction: :west}

      robot.direction == :west ->
        %{robot | direction: :north}
    end
  end

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
