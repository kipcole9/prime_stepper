defmodule Prime.Bench do
  @prime 1_000

  def run do
    Benchee.run(%{
      "brute force" => {
        fn _input -> Prime.generate(1..@prime) end,
        # Before running the benchmark, recompile the code according to the dogma
        before_scenario: fn _input ->
          Schism.convert(%{"prime check" => "brute force"})
        end
      },

      "brute force below sqrt(n)" => {
        fn _input -> Prime.generate(1..@prime) end,
        # Before running the benchmark, recompile the code according to the dogma
        before_scenario: fn _input ->
          Schism.convert(%{"prime check" => "brute force below sqrt(n)"})
        end
      },

      "code wars" => {
        fn _input -> Prime.generate(1..@prime) end,
        # Before running the benchmark, recompile the code according to the dogma
        before_scenario: fn _input ->
          Schism.convert(%{"prime check" => "code wars"})
        end
      },

      "wikipedia" => {
        fn _input -> Prime.generate(1..@prime) end,
        # Before running the benchmark, recompile the code according to the dogma
        before_scenario: fn _input ->
          Schism.convert(%{"prime check" => "wikipedia"})
        end
      }
    })
  end
end