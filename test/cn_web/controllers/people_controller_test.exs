defmodule CnWeb.PeopleControllerTest  do
  use CnWeb.ConnCase

  @validate_params %{"name"=> "Alex", "surname"=> "Ivanov", "sex"=> true, "country"=> "USA", "about"=> "test", "city"=>"New York"}
 test "GET /people/new", %{conn: conn} do
     conn = get(conn, "/people/new")
     assert html_response(conn, 200) =~ "New People"
  end

  test "POST /people/create", %{conn: conn} do

   conn = post conn, "/people/create", %{"user"=> @validate_params}
   assert redirected_to(conn) =~"/"
  end

  test "GET /people/new without a logged in user", %{conn: conn} do
     conn = get(conn, "/people/new")
     assert redirected_to(conn) == "/"
      assert get_flash(conn, :error) == "You must be logged in to do that!"
  end

  test "POST /people/create (with valid data, without logged in login)", %{conn: conn} do
  # Может не сработать смотри в кортержи
        conn = post(conn, "/people/create", %{"people" =>%{"name"=> "Alex", "surname"=> "Ivanov", "sex"=> true, "country"=> "USA", "about"=> "test", "city"=>"New York"}})
        assert redirected_to(conn) == "/"
        assert get_flash(conn, :error) == "You must be logged in to do that!"
  end
end
