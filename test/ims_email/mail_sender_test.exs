defmodule ImsEmail.Mail.MailSenderTest do
  use ExUnit.Case
  use Bamboo.Test
  alias ImsEmail.Mail.MailSender

  @dummy_email %Bamboo.Email{
    to: "test@ims.com",
    from: "test@ims.com"
  }

  describe "send" do
    test "sends email now" do
      MailSender.send(@dummy_email)

      assert_delivered_email @dummy_email
    end
  end
end
