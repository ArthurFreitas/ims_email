defmodule ImsEmail.Mail.MailBuilder do
  import Bamboo.Email
  def report_email(to_email, report_content) do
    report_attachment = report_content
      |> data_attachment("product_report.csv")

    no_reply_base_email(to_email)
    |> subject("Product Report")
    |> text_body("Attached below is the product report in a .csv format.")
    |> put_attachment(report_attachment)
  end

  defp data_attachment(content, name) do
    %Bamboo.Attachment{
      filename: name,
      data: content
    }
  end

  defp no_reply_base_email(to_email) do
    new_email()
    |> from("no-reply@ims.com")
    |> to(to_email)
  end
end
