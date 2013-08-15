defmodule PowerHouse do
  use Application.Behaviour


  def app_dispatch do
    assets_dir = Path.join [Path.dirname(:code.which(__MODULE__)), "..", "app", "assets"]

    :cowboy_router.compile([
      {:_,
        [
          {"/", PowerHouse.RootHandler, []},
          {
            "/assets/[...]",
            :cowboy_static,
            [
              directory: assets_dir,
              mimetypes: {Module.function(:mimetypes, :path_to_mimes, 2), :default}
            ]
          },
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


  def reload_routes do
    :cowboy.set_env(:http,:dispatch, PowerHouse.app_dispatch())
  end


  def code_change(_oldVersion, oldState, _extra) do
    IO.puts "Changing state..."
    PowerHouse.reload_routes()
    {:ok, oldState}
  end
end
