Code.append_path "deps/relex/ebin"

defmodule PowerHouse.Mixfile do
  use Mix.Project

  def project do
    [
      app:     :power_house,
      version: "0.0.1",
      elixir:  "~> 0.10.1",
      deps:    deps
    ]
  end

  # Configuration for the OTP application
  def application do
    [
      mod: { PowerHouse, []},
      applications: [:cowboy, :mimetypes]
    ]
  end

  # Returns the list of dependencies in the format:
  # { :foobar, "~> 0.1", git: "https://github.com/elixir-lang/foobar.git" }
  defp deps do
    [
      {:cowboy,    github: "extend/cowboy", tag: "0.8.6"},
      {:mimetypes, github: "spawngrid/mimetypes"},
      {:erlydtl,   github: "evanmiller/erlydtl"},
      {:relex,     github: "yrashk/relex"}
    ]
  end


  if Code.ensure_loaded?(Relex.Release) do
    defmodule Release do
      use Relex.Release

      def name, do: "power_house"
      def version, do: Mix.project[:version]
      def applications, do: [:power_house]
      def lib_dirs, do: ["deps"]
    end
  end

end
