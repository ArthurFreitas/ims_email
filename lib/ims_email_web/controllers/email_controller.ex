defmodule ImsEmailWeb.EmailController do
  use ImsEmailWeb, :controller

  alias ImsEmail.Mail.MailHelper

  def send(conn, %{"email" => email, "report" => report}) do
    MailHelper.send_report(email,report)
    json(conn, "")
  end
end
