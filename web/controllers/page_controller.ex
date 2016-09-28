defmodule EmberPhoenixScaffold.PageController do
  use EmberPhoenixScaffold.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
