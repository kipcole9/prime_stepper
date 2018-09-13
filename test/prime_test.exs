defmodule PrimeTest do
  use ExUnit.Case
  doctest Prime

  test "that we are generating correct primes on dogma" do
    x = Prime.generate(1..7919) |> MapSet.new
    y = Prime.first_1000_primes |> MapSet.new
    assert MapSet.difference(x, y) == MapSet.new([])
  end

  test "that we are generating correct primes on brute force" do
    Schism.convert(%{"prime check" => "brute force"})
    x = Prime.generate(1..7919) |> MapSet.new
    y = Prime.first_1000_primes |> MapSet.new
    assert MapSet.difference(x, y) == MapSet.new([])
  end

  test "that we are generating correct primes on brute force below sqrt(n)" do
    Schism.convert(%{"prime check" => "brute force below sqrt(n)"})
    x = Prime.generate(1..7919) |> MapSet.new
    y = Prime.first_1000_primes |> MapSet.new
    assert MapSet.difference(x, y) == MapSet.new([])
  end

  test "that we are generating correct primes on code wars" do
    Schism.convert(%{"prime check" => "code wars"})
    x = Prime.generate(1..7919) |> MapSet.new
    y = Prime.first_1000_primes |> MapSet.new
    assert MapSet.difference(x, y) == MapSet.new([])
  end

  test "that we are generating correct primes on wikipedia" do
    Schism.convert(%{"prime check" => "wikipedia"})
    x = Prime.generate(1..7919) |> MapSet.new
    y = Prime.first_1000_primes |> MapSet.new
    assert MapSet.difference(x, y) == MapSet.new([])
  end

end
