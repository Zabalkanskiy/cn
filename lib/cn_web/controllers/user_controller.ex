defmodule CnWeb.UserController do
  use CnWeb, :controller
  alias Cn.Social

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def new(conn, _params) do
    render(conn, "new.html")
  end

  def create(conn, %{"user"=> user_params}) do
    with {:ok, login} <- Social.create_login_in_base(user_params)do
			conn
			|> put_flash(:info, "Login created successfully")
			|> redirect(to: Routes.user_path(conn, :show, login))
          else
      {:error, _login} ->
			conn
			|> put_flash(:error, "Login Not Created")
			|> redirect(to: Routes.page_path(conn, :index))
		end
  end
  def show(conn, %{"id" => id} )do
       with {:ok, user} <- Social.get_user(id) do
         render(conn, "show.html", user: user)
         else
          _ ->
        conn
        |> put_flash(:error, "Login Not Found")
        |> redirect(to: Routes.page_path(conn, :index))

       end

  end
end
