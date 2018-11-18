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
end
