defmodule ExDjango.Mixfile do
  use Mix.Project

  def project do
    [app: :exdjango,
     version: "0.2.0",
     elixir: "~> 1.0",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps,
     description: "An elixir library for working with django",
     package: package]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    case Mix.env do
      :test -> [applications: [:logger, :exredis]]
      _ -> [applications: [:logger]]
    end
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type `mix help deps` for more examples and options
  defp deps do
    [
      {:plug, "~> 1.0.3"},
      {:poison, "~> 1.5.0", optional: true},
      {:comeonin, "~> 1.6", optional: true},
      {:exredis, "~> 0.2.0", optional: true}
    ]
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README.md", "LICENSE"],
      maintainers: ["Nick Sanders"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/nicksanders/exdjango"
      }
    ]
  end
end
