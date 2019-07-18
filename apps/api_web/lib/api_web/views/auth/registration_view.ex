defmodule ApiWeb.Auth.RegistrationView do
  use ApiWeb, :view
  alias ApiWeb.UserView

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end
end
