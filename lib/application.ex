defmodule ChatApp.Application do
  use Application
  use N2O

  def room() do
    case N2O.session(:room) do
      room when room in ['', ""] -> 'one'
      room -> room
    end
  end

  def start(_, _) do
    port = Application.get_env(:n2o, :port, 8002)
    :cowboy.start_clear(:http, [{:port, port}], %{env: %{dispatch: :n2o_cowboy.points()}})
    Supervisor.start_link([], strategy: :one_for_one, name: ChatApp.Supervisor)
  end
end
