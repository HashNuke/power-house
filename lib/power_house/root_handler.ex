defmodule PowerHouse.RootHandler do
  def init(_transport, req, []) do
    {:ok, req, nil}
  end

  def handle(req, state) do
    {:ok, req} = :cowboy_req.reply(200,
      [{<<"content-type">>, <<"text/html">>}],
      "Hello world again!",
      req)

    {:ok, req, state}
  end

  def terminate(_reason, _req, _state), do: :ok
end
