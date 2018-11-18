defmodule PositionTest do
  use ExUnit.Case

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
