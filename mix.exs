defmodule Ttodo.MixProject do
  use Mix.Project

  def project do
    [
      app: :ttodo,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
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
      {:mox, "~> 0.5", only: :test},
    ]
  end
end
