defmodule CnWeb.UserControllerTest  do
  use CnWeb.ConnCase

  @validate_params %{"name" => "test", "nickname" => "test", "email" => "test@test.com", "password"=> "test", "password_confirmation" => "test"}

  test "GET /users/new", %{conn: conn} do
    conn = get conn, "/users/new"
    assert html_response(conn, 200)
  end

  test "POST /users", %{conn: conn} do
    conn = post conn, "/users", %{"user"=> @validate_params}
    assert redirected_to(conn) =~"/"
  end

  test "GET /users/:id", %{conn: conn} do
  with {:ok, user} <- Cn.Social.create_login(@validate_params) do
      conn = get conn, "users/#{user.id}"
      assert html_response(conn, 200) =~user.nickname
    else
      {:error, _} -> assert false
    end

  end
end
