defmodule ImsEmail.Mail.MailHelper do
  alias ImsEmail.Mail.{MailBuilder, MailSender}

  def send_report(email, report) do
    MailBuilder.report_email(email, report)
    |> MailSender.send
  end
end
