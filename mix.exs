defmodule ExChroma.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_chroma,
      version: "0.1.0",
      elixir: "~> 1.0",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: description(),
      package: package(),
      deps: deps(),
      name: "ex_chroma",
      source_url: "https://github.com/dkuku/ex_chroma"
    ]
  end

  def application do
    []
  end

  defp description() do
    """
    ExChroma is a collection of modules that help you perform operations on colors
    It is influenced by chroma.js
    """
  end

  defp package() do
    [
      files: ~w(lib .formatter.exs mix.exs README* CHANGELOG*),
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => "https://github.com/dkuku/ex_chroma"}
    ]
  end

  defp deps do
    [
      {:dialyxir, "~> 1.0", only: [:dev], runtime: false},
      {:credo, "~> 1.5", only: [:dev, :test], runtime: false},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
      #  {:propcheck, "~> 1.3", github: "alfert/propcheck", only: [:dev, :test]},
    ]
  end
end
