defmodule PowerHouse.RootHandler do
  def init(_transport, req, []) do
    {:ok, req, nil}
  end


  def handle(req, state) do
    body = :app_views.index([greeting: 'Hello World'])
    headers     = [{"content-type", "text/html"}]
    {:ok, req}  = :cowboy_req.reply(200, headers, body, req)

    {:ok, req, state}
  end


  def terminate(_reason, _req, _state), do
    :ok
  end
end
