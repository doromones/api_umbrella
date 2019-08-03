defmodule ApiWeb.Auth.OAuthController do
  use ApiWeb, :controller
  plug Ueberauth

  alias Core.Accounts
  alias Core.Accounts.User

  def callback(
        %{
          assigns: %{
            ueberauth_auth: auth
          }
        } = conn,
        _params
      ) do
    auth
    |> inspect(pretty: true)
    |> :logger.debug

    user_params = %{
      token: auth.credentials.token,
      first_name: auth.info.first_name,
      last_name: auth.info.last_name,
      email: auth.info.email,
      provider: auth.provider,
      uid: auth.uid
    }

    user = Accounts.get_user_by_oauth(user_params.provider, user_params.uid)
    user =
      if user do
        user
      else
        {:ok, %User{} = user} = Accounts.create_user(user_params);
        user
      end

    conn
    |> put_status(:created)
    |> put_resp_header("location", Routes.user_path(conn, :show, user))
    |> render("callback.json", %{user: user})
  end
end
