defmodule PlugTeapotTest do
  use ExUnit.Case, async: true
  use Plug.Test

  defmodule TestRouter do
    use Plug.Router
    plug(:match)
    plug(:dispatch)
    use PlugTeapot

    match _ do
      send_resp(conn, 200, "OK")
    end
  end

  @opts TestRouter.init([])

  defp teapot(path) do
    conn =
      :get
      |> conn(path)

    conn = TestRouter.call(conn, @opts)

    assert conn.status == 418, path
    assert conn.resp_body == "I am a teapot"
  end

  test "serves tea to ASHX", do: teapot("/some/page.ashx")
  test "serves tea to ASP", do: teapot("/some/page.asp")
  test "serves tea to ASPX", do: teapot("/some/page.aspx")
  test "serves tea to CFM", do: teapot("/some/page.cfm")
  test "serves tea to cgi-bin", do: teapot("/cgi-bin/page.foo")
  test "serves tea to CGI", do: teapot("/some/page.cgi")
  test "serves tea to /etc/passwd", do: teapot("/.%252e/etc/passwd")
  test "serves tea to exe kiddies", do: teapot("/some/page.exe")
  test "serves tea to INI", do: teapot("/some/page.ini")
  test "serves tea to PHP", do: teapot("/some/page.php")
  test "serves tea to PL", do: teapot("/some/page.pl")
  test "serves tea to script kiddies", do: teapot("/some/page.sh")
  test "serves tea to wp-login", do: teapot("/wp-login/sign/in")
end
