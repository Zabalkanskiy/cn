defmodule CnWeb.Router do
  use CnWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", CnWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/new", PageController, :new
    get "/user/:id", UserController, :index
    get "/user/:id/:friend", UserController, :friend
  end

  # Other scopes may use custom stacks.
  # scope "/api", CnWeb do
  #   pipe_through :api
  # end
end
