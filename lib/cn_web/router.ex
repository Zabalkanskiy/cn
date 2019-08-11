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
   # post "/create", PageController, :create
    get "/users/:id", UserController, :show
    post "/users", UserController, :create
    get "/user/:id/:friend", UserController, :friend
    get "/people/new", PeopleController, :new
    post "/create", PeopleController, :create
  end

  # Other scopes may use custom stacks.
  # scope "/api", CnWeb do
  #   pipe_through :api
  # end
end
