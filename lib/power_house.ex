defmodule PowerHouse do
  use Application.Behaviour

  def app_dispatch do
    :cowboy_router.compile([
      {:_,
        [
          {"/", PowerHouse.RootHandler, []},
          {"/games/:game_id", PowerHouse.GameHandler, []}
        ]
      }
    ])
  end

  def start(_type, _args) do
    {:ok, _} = :cowboy.start_http(
      :http,
      100,
      [port: 8080],
      [env: [
          dispatch: app_dispatch()
        ]
      ]
    )

    PowerHouse.Supervisor.start_link
  end


  def code_change(_oldVersion, oldState, _extra) do
    IO.puts "Changing state..."

    :cowboy.set_env(
      :http,
      :dispatch,
      PowerHouse.app_dispatch()
      )

    {:ok, oldState}
  end
end
