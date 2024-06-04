defmodule ChatApp.MixProject do
  use Mix.Project

  def project do
    [
      app: :chat_app,
      version: "0.1.0",
      elixir: "~> 1.16",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {ChatApp.Application, []},
      extra_applications: [:ranch, :cowboy, :n2o, :syn, :nitro]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
    defp deps do
      [
        {:cowboy, "~> 2.8.0"},
        {:ex_doc, "~> 0.29.0", only: :dev},
        {:syn, "~> 2.1.1"},
        {:n2o, github: "synrc/n2o"},
        {:nitro, github: "synrc/nitro"}
      ]
    end
end
