defmodule Robot do
  defstruct ~w(position direction)a

  def move(robot = %Robot{}, "L") do
    %{robot | direction: Direction.turn_left(robot.direction)}
  end

  def move(robot = %Robot{}, "R") do
    %{robot | direction: Direction.turn_right(robot.direction)}
  end

  def move(robot = %Robot{}, "A") do
    %{robot | position: Position.move(robot.position, robot.direction)}
  end

  def move(robot, [single_instruction]) do
    move(robot, single_instruction)
  end

  def move(robot, [first_instruction | more_instructions]) do
    move(Robot.move(robot, first_instruction), more_instructions)
  end

  def move(_, _) do
    {:error, "invalid instruction"}
  end
end
