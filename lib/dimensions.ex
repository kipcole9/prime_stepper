defmodule Dimensions do
  import Schism

  def parse(s) do
    parse_profile(s)
  end

  schism "parse dimensions" do
    dogma "regex" do
      def parse_profile(string) do
        string =
          string
          |> String.trim_trailing(<<0>>)
          |> String.trim()

        ~r/^([0-9\.]+) x ([0-9\.]+)/i
        |> Regex.run(string, capture: :all_but_first)
        |> Enum.map(&String.to_float/1)
      end
    end

    heresy "nimble_parsec" do
      import NimbleParsec
      float =
        ascii_string([?0..?9], min: 1)
        |> times(min: 1)
        |> ascii_string([?.], min: 1)
        |> ascii_string([?0..?9], min: 1)
        |> reduce({Enum, :join, []})

      whitespace = optional(ascii_string([0x20, 0], min: 1))

      x = ascii_char([?x])

      defparsec :profile,
        float
        |> ignore(whitespace)
        |> ignore(x)
        |> ignore(whitespace)
        |> concat(float)
        |> ignore(whitespace)

      def parse_profile(s) do
        {:ok, [x, y], _, _, _, _} = profile(s)
        [String.to_float(x), String.to_float(y)]
      end
    end
  end
end