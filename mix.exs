defmodule PlugTeapot.MixProject do
  use Mix.Project

  def project do
    [
      app: :plug_teapot,
      version: "0.1.1",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: "418s for bots",
      package: package()
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
      {:plug, "~> 1.8"},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end

  defp package do
    [
      description: "A plug that detects unwanted requests and returns some tea!",
      licenses: ["MPL-2.0"],
      links: %{"GitHub" => "https://github.com/jc00ke/plug_teapot"}
    ]
  end
end
