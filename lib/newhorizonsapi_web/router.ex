defmodule NewhorizonsapiWeb.Router do
  use Phoenix.Router

  forward "/api", Absinthe.Plug, schema: NewhorizonsapiWeb.Schema

  pipeline :api do
    plug :accepts, ["json"]
  end
end
