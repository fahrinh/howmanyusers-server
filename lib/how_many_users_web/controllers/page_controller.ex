defmodule HowManyUsersWeb.PageController do
  use HowManyUsersWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
