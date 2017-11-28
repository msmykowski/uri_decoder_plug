defmodule UriDecoderPlug.Mixfile do
  use Mix.Project

  def project do
    [
      app: :uri_decoder_plug,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
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
      {:credo, "~> 0.8.8", only: [:dev], runtime: false},
      {:excoveralls, "~> 0.7.4", only: [:test], runtime: false},
      {:plug, "~> 1.4 or ~> 1.3.3 or ~> 1.2.4 or ~> 1.1.8 or ~> 1.0.5"}
    ]
  end
end
