defmodule Ttodo.MixProject do
  use Mix.Project

  def project do
    [
      app: :ttodo,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      escript: escript(),
      language: :elixir,
    ]
  end

  def escript do
    [main_module: Ttodo]
  end

  def application do
    [
      extra_applications: [:logger, :timex]
    ]
  end

  defp deps do
    [
      {:poison, "~> 3.1"},
      {:elixir_uuid, "~> 1.2"},
      {:timex, "~> 3.1"},
      {:tzdata, "== 0.1.8", override: true},  # temp hack as tzdata issue with escript. https://github.com/bitwalker/timex/issues/86
      {:mox, "~> 0.5", only: :test},
      {:credo, "~> 1.0.0", only: [:dev, :test], runtime: false},
    ]
  end
end
