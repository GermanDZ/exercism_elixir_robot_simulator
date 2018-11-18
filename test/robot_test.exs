defmodule RobotTest do
  use ExUnit.Case

  describe "creation" do
    test "position and direction can be initialized" do
      position = {4, -3}
      direction = :west

      robot = %Robot{position: position, direction: direction}

      assert robot.position == position
      assert robot.direction == direction
    end
  end

  describe "moving" do
    test "move/2 for Left rotates from north to west" do
      robot = %Robot{direction: %Direction{value: :north}, position: %Position{x: 0, y: 0}}

      assert :west = Robot.move(robot, "L").direction.value
    end

    test "move/2 for Left rotates from east to north" do
      robot = %Robot{direction: %Direction{value: :east}, position: %Position{x: 0, y: 0}}

      assert :north = Robot.move(robot, "L").direction.value
    end

    test "move/2 for Right rotates from north to east" do
      robot = %Robot{direction: %Direction{value: :north}, position: %Position{x: 0, y: 0}}

      assert :east = Robot.move(robot, "R").direction.value
    end

    test "move/2 for Right rotates from west to north" do
      robot = %Robot{direction: %Direction{value: :west}, position: %Position{x: 0, y: 0}}

      assert :north = Robot.move(robot, "R").direction.value
    end

    test "move/2 for Advance increments y when is going north" do
      robot = %Robot{direction: %Direction{value: :north}, position: %Position{x: 0, y: 0}}

      assert %Position{x: 0, y: 1} = Robot.move(robot, "A").position
    end

    test "move/2 for Advance increments x when is going east" do
      robot = %Robot{direction: %Direction{value: :east}, position: %Position{x: -3, y: 0}}

      assert %Position{x: -2, y: 0} = Robot.move(robot, "A").position
    end

    test "move/2 for Advance decrements y when is going south" do
      robot = %Robot{direction: %Direction{value: :south}, position: %Position{x: 0, y: 5}}

      assert %Position{x: 0, y: 4} = Robot.move(robot, "A").position
    end

    test "move/2 for Advance decrements x when is going west" do
      robot = %Robot{direction: %Direction{value: :west}, position: %Position{x: -3, y: 0}}

      assert %Position{x: -4, y: 0} = Robot.move(robot, "A").position
    end

    test "move/2 for many movements make all movements" do
      robot = %Robot{direction: %Direction{value: :west}, position: %Position{x: -3, y: 0}}

      assert %Position{x: -4, y: -1} = Robot.move(robot, ["A", "L", "A"]).position
    end

    test "move/2 for unknown instructions returns an error" do
      robot = %Robot{}

      assert {:error, "invalid instruction"} = Robot.move(robot, "X")
    end
  end
end
