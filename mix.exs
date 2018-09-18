defmodule Prime.MixProject do
  use Mix.Project

  def project do
    [
      app: :prime,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:schism, git: "https://github.com/tmbb/schism"},
      {:benchee, "~> 0.13"},
      {:nimble_parsec, "~> 0.4"}
    ]
  end
end
