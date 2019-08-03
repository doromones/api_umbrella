defmodule ApiWeb.Auth.OAuthView do
  use ApiWeb, :view

  alias ApiWeb.UserView

  def render("callback.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end
end
