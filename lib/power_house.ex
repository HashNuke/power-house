defmodule PowerHouse do
  use Application.Behaviour


  def app_dispatch do
    assets_dir = Path.join [Path.dirname(:code.which(__MODULE__)), "..", "app", "assets"]

    :cowboy_router.compile([
      {:_,
        [
          {"/", PowerHouse.RootHandler, []},
          {"/websocket", PowerHouse.WebsocketHandler, []},
          {
            "/assets/[...]", :cowboy_static, [
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
      [env: [dispatch: app_dispatch()] ]
    )


    compile_templates()
    PowerHouse.Supervisor.start_link
  end


  # templates functions are available as :app_views.index(variables)
  def compile_templates do
    :erlydtl.compile_dir('app/views', :app_views)
  end


  def reload_routes do
    :cowboy.set_env(:http,:dispatch, PowerHouse.app_dispatch())
  end


  def code_change(_oldVersion, oldState, _extra) do
    IO.puts "Changing state..."

    compile_templates()
    reload_routes()
    {:ok, oldState}
  end
end
