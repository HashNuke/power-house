defmodule PowerHouse.GameHandler do
  def init(_transport, req, []) do
    {:ok, req, nil}
  end

  def handle(req, state) do
    {game_id, req} = :cowboy_req.binding(:game_id, req)
    content = "This is a page for game_id: #{game_id}"

    {:ok, req} = :cowboy_req.reply(
      200,
      [{<<"content-type">>, <<"text/html">>}],
      content,
      req
    )

    {:ok, req, state}
  end

  def terminate(_reason, _req, _state), do: :ok
end
