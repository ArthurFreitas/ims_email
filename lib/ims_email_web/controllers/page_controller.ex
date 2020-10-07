defmodule ImsEmailWeb.PageController do
  use ImsEmailWeb, :controller

  def sentry_check(_conn, _params) do
    raise "Hello from email service"
  end
end
