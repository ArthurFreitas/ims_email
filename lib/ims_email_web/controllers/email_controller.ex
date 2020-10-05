defmodule ImsEmailWeb.EmailController do
  use ImsEmailWeb, :controller

  alias ImsEmail.Mail.MailHelper

  def send(conn, %{"email" => email, "report" => report}) do
    email
    |> MailHelper.send_report(report)

    conn
    |> json("")
  end
end
