defmodule PowerGenWeb.PageController do
  use PowerGenWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
