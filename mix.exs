defmodule UriDecoderPlug.Mixfile do
  use Mix.Project

  def project do
    [
      app: :uri_decoder_plug,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps(),
      description: description(),
      package: package(),
      name: "uri_decoder_plug"
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
      {:ex_doc, "~> 0.18.1", only: [:dev], runtime: false},
      {:plug, "~> 1.4 or ~> 1.3.3 or ~> 1.2.4 or ~> 1.1.8 or ~> 1.0.5"}
    ]
  end

  defp description() do
    "A plug for percent-decoding incoming request paths and updating the connection object appropriately"
  end

  defp package() do
    [
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      maintainers: ["Michael Smykowski"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/msmykowski/uri_decoder_plug"}
    ]
  end
end
