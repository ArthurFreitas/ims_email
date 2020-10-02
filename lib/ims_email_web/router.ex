defmodule ImsEmailWeb.Router do
  use ImsEmailWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ImsEmailWeb do
    pipe_through :api
  end
end
