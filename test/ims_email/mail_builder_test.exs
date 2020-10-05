defmodule ImsEmail.Mail.MailBuilderTest do
  use ExUnit.Case, async: false
  alias ImsEmail.Mail.MailBuilder

  @to_email "teste@skyhub.com.br"
  @report "header1,header2\n\rfoo,bar"

  describe "report_email" do
    test "builds a report email with the given args" do
      email = MailBuilder.report_email(@to_email, @report)

      assert email.from == "no-reply@ims.com"
      assert email.to == @to_email
      assert email.subject == "Product Report"
      assert hd(email.attachments).filename == "product_report.csv"
      assert hd(email.attachments).data == @report
    end
  end
end
