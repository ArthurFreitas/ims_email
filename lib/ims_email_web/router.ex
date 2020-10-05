defmodule ImsEmailWeb.Router do
  use ImsEmailWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ImsEmailWeb do
    pipe_through :api

    post "/send", EmailController, :send
  end

  if Mix.env == :dev do
    forward "/sent_emails", Bamboo.SentEmailViewerPlug
  end
end
