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

    user_params = %{
      token: auth.credentials.token,
      first_name: auth.info.first_name,
      last_name: auth.info.last_name,
      email: auth.info.email,
      provider: to_string(auth.provider),
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

    {:ok, token, _} = ApiWeb.Guardian.encode_and_sign(user, %{}, token_type: :access)

    conn
    |> redirect(external: "https://server.dev/#token=#{token}")
  end
end
