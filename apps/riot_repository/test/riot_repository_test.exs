defmodule RiotRepositoryTest do
  use ExUnit.Case
  doctest RiotRepository

  test "greets the world" do
    assert RiotRepository.hello() == :world
  end
end
