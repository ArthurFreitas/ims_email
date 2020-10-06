defmodule ImsEmailWeb.EmailControllerTest do
  use ExUnit.Case, async: false
  use ImsEmailWeb.ConnCase
  import Mock
  alias ImsEmail.Mail.MailHelper

  @email "teste@skyhub.com.br"
  @report "header1,header2\n\rfoo,bar"
  @email_request_params %{"email" => @email, "report" => @report}

  describe "send" do
    test_with_mock "calls MailHelper", %{conn: conn},
      MailHelper, [], [send_report: fn(_email, _report) -> :ok end] do

      conn = post(conn, Routes.email_path(conn, :send), @email_request_params)

      assert conn.status == 200
      assert_called(MailHelper.send_report(@email, @report))
    end
  end
end
