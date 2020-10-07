defmodule ImsEmailWeb.EmailController do
  use ImsEmailWeb, :controller

  alias ImsEmail.Mail.MailHelper

  def send(conn, %{"email" => email, "report" => report}) do
    case MailHelper.send_report(email,report) do
      :ok ->
        json(conn, "")
      {:error, reason} ->
        Sentry.capture_message("report_email_failed", extra: %{reason: reason})
        conn
        |> put_status(:bad_request)
        |> json(%{reason: reason})
    end
  end
end
