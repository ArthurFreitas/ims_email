defmodule ImsEmail.Mail.MailHelper do
  alias ImsEmail.Mail.{MailBuilder, MailSender}

  def send_report(_email, "") do
    {:error, "report is empty"}
  end
  def send_report(email, report) do
    report_email = MailBuilder.report_email(email, report)
    MailSender.send(report_email)
  end
end
