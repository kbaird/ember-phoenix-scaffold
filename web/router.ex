defmodule EmberPhoenixScaffold.Router do
  use EmberPhoenixScaffold.Web, :router

  alias EmberPhoenixScaffold.TodoController

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
    resources "/todos", TodoController, except: [:new, :edit]
  end

  scope "/", EmberPhoenixScaffold do
    pipe_through :browser # Use the default browser stack
    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", EmberPhoenixScaffold do
  #   pipe_through :api
  # end
end
