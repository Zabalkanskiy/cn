defmodule CnWeb.PageController do
  use CnWeb, :controller
  alias Cn.Social


  def index(conn, _params) do
    render(conn, "index.html")
  end

  def new(conn, _params) do
    user = Social.new_login
    render( conn , "new_user.html", user: user)
  end
end
