defmodule CnWeb.PageController do
  use CnWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
