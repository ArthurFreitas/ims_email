defmodule ImsEmail.Mail.MailHelperTest do
  use ExUnit.Case, async: false
  import Mock
  alias ImsEmail.Mail.{MailHelper, MailBuilder, MailSender}

  @email "teste@skyhub.com.br"
  @report "header1,header2\n\rfoo,bar"

  describe "send report" do
    test "builds and sends a report email" do
      with_mocks([
        { MailBuilder, [], [report_email: fn(_to_email, _report_content) -> :built_email end] },
        { MailSender, [], [send: fn(_email) -> :ok end] }
      ]) do
        MailHelper.send_report(@email, @report)

        assert_called(MailBuilder.report_email(@email, @report))
        assert_called(MailSender.send(:built_email))
      end
    end
  end
end
