defmodule RobotSimulator do
  @doc """
  Create a Robot Simulator given an initial direction and position.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec create(direction :: atom, position :: {integer, integer}) :: any
  def create(direction \\ :north, position \\ {0, 0}) do
    with {:ok, direction} <- Direction.build(direction),
         {:ok, position} <- Position.build(position) do
      %Robot{direction: direction, position: position}
    else
      err -> err
    end
  end

  def simulate(robot, [first_instruction]) do
    Robot.move(robot, first_instruction)
  end

  def simulate(robot, [first_instruction | more_instructions]) do
    simulate(Robot.move(robot, first_instruction), more_instructions)
  end

  @doc """
  Simulate the robot's movement given a string of instructions.

  Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)
  """
  @spec simulate(robot :: any, instructions :: String.t()) :: any
  def simulate(robot, instructions) do
    simulate(robot, String.codepoints(instructions))
  end

  @doc """
  Return the robot's direction.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec direction(robot :: any) :: atom
  def direction(robot) do
    robot.direction.value
  end

  @doc """
  Return the robot's position.
  """
  @spec position(robot :: any) :: {integer, integer}
  def position(robot) do
    {robot.position.x, robot.position.y}
  end
end
