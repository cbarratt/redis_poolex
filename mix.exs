defmodule RedisPoolex.Mixfile do
  use Mix.Project

  def project do
    [app: :redis_poolex,
     version: "0.0.6",
     elixir: "~> 1.2",
     description: description(),
     package: package(),
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [
      applications: [:logger],
      mod: {RedisPoolex, []}
    ]
  end

  defp description do
    """
    Redis connection pool using poolboy and exredis libraries
    """
  end

  defp package do
    [# These are the default files included in the package
      files: ["lib", "mix.exs", "README*"],
      maintainers: ["Alexandr Korsak"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/oivoodoo/redis_poolex",
        "Docs" => "http://hexdocs.pm/redis_poolex/"
      }
    ]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:poolboy, ">= 1.5.1"},
      {:exredis, ">= 0.2.5", github: 'artemeff/exredis', ref: "00d0de97bc12b3f9712198b7a08efb5c0eb9436a"},
      {:earmark, "~> 0.1", only: :dev},
      {:ex_doc, "~> 0.11", only: :dev}
    ]
  end
end
