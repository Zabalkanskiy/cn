defmodule CnWeb.SessionControllerTest do
  use CnWeb.ConnCase

    @valid_create_params %{
    nickname: "test",
    name: "test",
    email: "test@test.com",
    password: "test",
    password_confirmation: "test"
  }

  setup do
    conn = build_conn()
    {:ok, user} = Cn.Social.create_login(@valid_create_params)
    {:ok, conn: conn, user: user}
  end

  test "GET /login", %{conn: conn} do
    conn = get conn, "/login"
    assert html_response(conn, 200) =~ "Login"
  end

    test "POST /sessions (with valid data)", %{conn: conn, user: user} do
    #возможно правильнее будет user.nickname   !!!
        conn = post conn, "/sessions", %{ username: user.nickname, password: "test"}
        assert redirected_to(conn) == "/"
        assert Plug.Conn.get_session(conn, :user)
    end

  test "POST /sessions (with invalid data)", %{conn: conn, user: user} do
    conn = post conn, "/sessions", %{ username: user.nickname, password: "fail"}
    assert html_response(conn, 200)
    assert is_nil(Plug.Conn.get_session(conn, :user))
  end

  test "DELETE /sessions", %{conn: conn, user: user} do
    conn = post conn, "/sessions", %{ username: user.nickname, password: "test"}
    assert Plug.Conn.get_session(conn, :user)
    conn = delete conn, "/logout"
    assert is_nil(Plug.Conn.get_session(conn, :user))
  end
end
