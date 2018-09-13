defmodule PrimeTest do
  use ExUnit.Case
  doctest Prime

  test "that we are generating correct primes" do
    x = Prime.generate(1..7919) |> MapSet.new
    y = Prime.first_1000_primes |> MapSet.new
    assert MapSet.difference(x, y) == MapSet.new([])
  end
end
