defmodule PlugTeapot do
  @moduledoc """
  A plug for gently telling guests that they may only have tea.

  Detects common extensions and halts the pipeline with a 418.
  """

  alias Plug.Conn
  @behaviour Plug
  import String, only: [contains?: 2, ends_with?: 2]

  def init([]), do: []

  def call(conn, []) do
    cond do
      ends_with?(conn.request_path, ".ashx") ->
        teapot(conn)

      ends_with?(conn.request_path, ".asp") ->
        teapot(conn)

      ends_with?(conn.request_path, ".aspx") ->
        teapot(conn)

      ends_with?(conn.request_path, ".cfm") ->
        teapot(conn)

      contains?(conn.request_path, "cgi-bin") ->
        teapot(conn)

      ends_with?(conn.request_path, ".cgi") ->
        teapot(conn)

      contains?(conn.request_path, "etc/passwd") ->
        teapot(conn)

      ends_with?(conn.request_path, ".exe") ->
        teapot(conn)

      ends_with?(conn.request_path, ".ini") ->
        teapot(conn)

      ends_with?(conn.request_path, ".php") ->
        teapot(conn)

      ends_with?(conn.request_path, ".pl") ->
        teapot(conn)

      ends_with?(conn.request_path, ".sh") ->
        teapot(conn)

      contains?(conn.request_path, "wp-login") ->
        teapot(conn)

      true ->
        conn
    end
  end

  def teapot(conn) do
    conn
    |> Conn.put_resp_content_type("text/plain")
    |> Conn.resp(418, "I am a teapot")
  end
end
