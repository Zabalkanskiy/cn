defmodule CnWeb.PeopleController do
  use CnWeb, :controller
  alias Cn.Social

 # def index(conn, _params) do
  #  render(conn, "index.html")
 # end
  def new(conn, _) do
      people = Social.new_people
      render conn, "new_people.html", people: people
  end

  def create(conn, %{"people"=> people_params}) do
      with {:ok, _people} <- Social.create_people_in_base(people_params)do
    conn
    |> put_flash(:info, "People created successfully")
    |> redirect(to: Routes.page_path(conn, :index))
      else
        _ ->
      conn
      |> put_flash(:error, "People Not Created")
      |> redirect(to: Routes.page_path(conn, :index))
     end
  end
end
