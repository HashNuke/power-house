# PowerHouse

W.I.P - hence stuff is either broken or not there

### Goal

A basic app for hosting websockets-based games.

### Running this

* Install Erlang and Elixir

        mix deps.get
        mix relex.assemble
        iex -S mix

* Visit http://localhost:8080

* If you change routes, you'll need to run the following in your console.

        :cowboy.set_env(:http,:dispatch, PowerHouse.app_dispatch())

* For any other module changes or new modules, just recompile it using r() or c().

### Usage

* Drop all your static assets in `app/assets`. Say you have `app/assets/sample.png`, it can be accessed on the app at `/assets/sample.png`


### Notes

I don't know how to deploy using erlang releases yet. I was informed that Elixir doesn't yet have deployment/release mechanisms built in the `mix` tool. Rumour is that it's coming in v1.0. But this works for me now.
