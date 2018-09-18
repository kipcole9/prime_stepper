defmodule Factor do
  @doc """
  Get prime factors of an integer
  """
  def prime(n), do: prime(n, 2, [])

  def prime(n, _p, acc) when n == 1, do: group_factors(acc)
  def prime(n, p, acc) when rem(n, p) == 0, do: prime(div(n, p), p, [p | acc])
  def prime(n, p, acc), do: prime(n, next_prime(p), acc)

  def next_prime(n) when n < 2, do: 2
  def next_prime(2), do: 3
  def next_prime(n) do
    if Prime.is_prime?(n + 1), do: n + 1, else: next_prime(n + 1)
  end

  def group_factors(factors) do
    Enum.group_by(factors, fn x -> x end)
    |> Enum.map(fn
      {p, [p]} -> "(#{inspect p})"
      {p, l} -> "(#{inspect p}**#{inspect length(l)})"
    end)
    |> Enum.join
  end
end