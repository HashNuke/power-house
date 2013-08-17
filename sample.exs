defmodule FastFood do


  defmacro on_match(route, name, code) do
    quote do
      defmodule Module.concat(__MODULE__, unquote(name <> "Handler")) do
        IO.puts __MODULE__

        def print_info do
          IO.puts "Akash"
          unquote(code)
        end
      end
    end
  end


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


  defmacro router(code) do
    quote do
      unquote(code)
    end
  end

end


defmodule SampleApp do
  require FastFood

  # FastFood.on_match("/", "Root") do
  #   IO.puts "Hey I'm eating"
  # end

  # FastFood.on_match("/page/:page_id", "Page") do
  #   IO.puts "Hey I'm eating"
  # end

  route_list = FastFood.router do
    [
      FastFood.match("/", "Root") do
        {:view, "index.dtl"}
      end,

      FastFood.match("/page/:page_id", "Page") do
        {:view, "page.dtl"}
      end
    ]
  end

  IO.inspect route_list

  #SampleApp.RootHandler.print_info()
end
