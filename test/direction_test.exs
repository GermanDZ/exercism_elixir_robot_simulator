defmodule DirectionTest do
  use ExUnit.Case

  describe "creation" do
    test "build/1 returns {:ok, direction} for :west" do
      assert {:ok, %Direction{value: :west}} = Direction.build(:west)
    end

    test "build/1 returns {:ok, direction} for :east" do
      assert {:ok, %Direction{value: :west}} = Direction.build(:west)
    end

    test "build/1 returns {:ok, direction} for :south" do
      assert {:ok, %Direction{value: :west}} = Direction.build(:west)
    end

    test "build/1 returns {:ok, direction} for :north" do
      assert {:ok, %Direction{value: :west}} = Direction.build(:west)
    end

    test "build/1 returns {:error, 'invalid direction'} elsewhere" do
      assert {:error, "invalid direction"} = Direction.build(:no_west)
      assert {:error, "invalid direction"} = Direction.build(:center)
      assert {:error, "invalid direction"} = Direction.build("north")
      assert {:error, "invalid direction"} = Direction.build(:n)
      assert {:error, "invalid direction"} = Direction.build(0)
      assert {:error, "invalid direction"} = Direction.build(nil)
    end
  end

  describe "turning left" do
    test "from north" do
      {:ok, direction} = Direction.build(:north)
      assert :west = Direction.turn_left(direction).value
    end

    test "from west" do
      {:ok, direction} = Direction.build(:west)
      assert :south = Direction.turn_left(direction).value
    end

    test "from south" do
      {:ok, direction} = Direction.build(:south)
      assert :east = Direction.turn_left(direction).value
    end

    test "from east" do
      {:ok, direction} = Direction.build(:east)
      assert :north = Direction.turn_left(direction).value
    end
  end

  describe "turning right" do
    test "from north" do
      {:ok, direction} = Direction.build(:north)
      assert :east = Direction.turn_right(direction).value
    end

    test "from west" do
      {:ok, direction} = Direction.build(:west)
      assert :north = Direction.turn_right(direction).value
    end

    test "from south" do
      {:ok, direction} = Direction.build(:south)
      assert :west = Direction.turn_right(direction).value
    end

    test "from east" do
      {:ok, direction} = Direction.build(:east)
      assert :south = Direction.turn_right(direction).value
    end
  end
end
