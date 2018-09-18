defmodule Secret do
  def handshake(number) when is_integer(number) do
    handshake(<< number :: size(5) >>)
  end

  @code ["jump", "close your eyes", "double blink", "wink"]
  def handshake(<< reverse :: size(1), jump :: size(1), close :: size(1), double :: size(1), wink :: size(1) >>) do
    shake =
      [jump, close, double, wink]
      |> Enum.zip(@code)
      |> Enum.reduce([], fn
          {0, _}, acc -> acc
          {1, item}, acc -> [item | acc]
        end)

    # Since Enum.reduce/2 returns the list in reverse order,
    # we only reverse if the reverse bit is not set :-)
    if reverse == 1, do: shake, else: Enum.reverse(shake)
  end
end