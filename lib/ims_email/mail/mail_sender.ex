defmodule ImsEmail.Mail.MailSender do
  use Bamboo.Mailer, otp_app: :ims_email

  def send(email) do
    deliver_now(email)
    :ok
  end
end
