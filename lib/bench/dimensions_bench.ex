defmodule Dimensions.Bench do
  def run do
    Benchee.run(%{
      "regex" => {
        fn _input -> Dimensions.parse_profile "23.34 x 34.54" end,
        before_scenario: fn _input ->
          Schism.convert %{"parse dimensions" => "regex"}
        end
      },

      "nimble_parsec" => {
        fn _input -> Dimensions.parse_profile "23.34 x 34.54" end,
        before_scenario: fn _input ->
          Schism.convert %{"parse dimensions" => "nimble_parsec"}
        end
      }
    })
  end
end