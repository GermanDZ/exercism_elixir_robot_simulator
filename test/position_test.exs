defmodule PositionTest do
  use ExUnit.Case

  describe "creation" do
    test "build/1 returns {:ok, position} for {-1, -1}" do
      assert {:ok, %Position{x: -1, y: -1}} = Position.build({-1, -1})
    end

    test "build/1 returns {:ok, position} for {0, 0}" do
      assert {:ok, %Position{x: 0, y: 0}} = Position.build({0, 0})
    end

    test "build/1 returns {:ok, position} for {1, 1}" do
      assert {:ok, %Position{x: 1, y: 1}} = Position.build({1, 1})
    end

    test "build/1 returns {:error, 'invalid position'} elsewhere" do
      assert {:error, "invalid position"} = Position.build(:no_dir)
      assert {:error, "invalid position"} = Position.build({:center, 0})
      assert {:error, "invalid position"} = Position.build("1, 2")
      assert {:error, "invalid position"} = Position.build({0, :top})
      assert {:error, "invalid position"} = Position.build({nil, nil})
    end
  end

  describe "moving" do
    test "to north" do
      {:ok, position} = Position.build({0, 0})
      {:ok, direction} = Direction.build(:north)

      assert %Position{x: 0, y: 1} == Position.move(position, direction)
    end

    test "to east" do
      {:ok, position} = Position.build({3, -3})
      {:ok, direction} = Direction.build(:east)

      assert %Position{x: 4, y: -3} == Position.move(position, direction)
    end

    test "to south" do
      {:ok, position} = Position.build({4, -2})
      {:ok, direction} = Direction.build(:south)

      assert %Position{x: 4, y: -3} == Position.move(position, direction)
    end

    test "to west" do
      {:ok, position} = Position.build({-3, -2})
      {:ok, direction} = Direction.build(:west)

      assert %Position{x: -4, y: -2} == Position.move(position, direction)
    end
  end
end
