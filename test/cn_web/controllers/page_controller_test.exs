defmodule CnWeb.PageControllerTest do
  use CnWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Wlecomne to social Network"
  end
  test "Get /new", %{conn: conn} do
		conn = get conn, "/new"
    	assert html_response(conn, 200)
	end
  test "GET /new", %{conn: conn} do
		conn = get conn, "/new"
		response = html_response(conn, 200)
		assert response =~ "New User"
		assert conn.assigns.user.__struct__ == Ecto.Changeset
		assert response =~ "action=\"/users\" method=\"post\""
  	end
end
