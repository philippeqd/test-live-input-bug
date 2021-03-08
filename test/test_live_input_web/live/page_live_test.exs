defmodule TestLiveInputWeb.PageLiveTest do
  use TestLiveInputWeb.ConnCase

  import Phoenix.LiveViewTest

  test "disconnected and connected render", %{conn: conn} do
    {:ok, page_live, disconnected_html} = live(conn, "/")
    assert disconnected_html =~ "Welcome to Phoenix!"
    assert render(page_live) =~ "Welcome to Phoenix!"
  end

  test "upload", %{conn: conn} do
    {:ok, view, _html} = live(conn, "/")

    assert file_input(view, "#logo-upload", :photo, [
             %{
               name: "test.jpg",
               content: File.read!("test/static/images/test.jpg"),
               type: "image/jpeg"
             }
           ])
           |> render_upload("test.jpg") =~
             "<progress max=\"100\" value=\"100\""
  end
end
