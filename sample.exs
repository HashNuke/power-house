defmodule Rinket do

  defmacro match(route, name, code) do
    quote do
      defmodule Module.concat(__MODULE__, unquote(name <> "Handler")) do
        IO.puts __MODULE__

        def print_info do
          IO.puts "Akash"
          unquote(code)
        end
      end

      {unquote(route), Module.concat(__MODULE__, unquote(name <> "Handler"))}
    end
  end


  defmacro routes(code) do
    routes_list = quote do
      unquote(code)
    end

    # define module for cowboy sake
    # start cowboy
    # set cowboy on every request
  end

end


defmodule SampleApp do
  require Rinket

  # Possible return values:
  #   { json: :json_stuff_here}
  #   { text: "plain_text"}
  #   { html: "html_string"}
  #   { html: :app_templates.index() }
  #
  # Options: assets_dir, templates_dir, port

  route_list = Rinket.routes do
    [
      Rinket.match("/", "Root") do
        {:view, "index.dtl"}
      end,

      Rinket.match("/page/:page_id", "Page") do
        {:view, "page.dtl"}
      end
    ]
  end

  IO.inspect route_list

  #SampleApp.RootHandler.print_info()
end


defmodule Man do
  Module.register_attribute __MODULE__, :routes, accumulate: true
  @routes []
  IO.inspect @routes
  @routes 11
  IO.inspect @routes
end
