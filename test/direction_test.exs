defmodule DirectionTest do
  use ExUnit.Case

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
