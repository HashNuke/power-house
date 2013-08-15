# PowerHouse

W.I.P - hence stuff is either broken or not there

### Goal

A basic app for hosting websockets-based games.

### Running this

* Install Erlang and Elixir


* Clone this repo, get dependencies and compile application

        git clone https://github.com/HashNuke/power-house.git power-house
        cd power-house
        mix deps.get
        mix relex.assemble
        iex -S mix

* Visit `http://localhost:8080`

* If you change routes, you'll need to run the following in your console.

        r(PowerHouse) && PowerHouse.reload_routes()

* For any other module changes or new modules, recompile it using `r(YourModule)` or `c("path/to/module.ex")` in the `iex` console itself.

### Usage

* Drop all your static assets in `app/assets`. Say you have `app/assets/sample.png`, it can be accessed on the app at `/assets/sample.png`


### Notes

I don't know how to deploy using erlang releases yet. I was informed that Elixir doesn't yet have deployment/release mechanisms built in the `mix` tool. Rumour is that it's coming in v1.0. But this works for me now.
