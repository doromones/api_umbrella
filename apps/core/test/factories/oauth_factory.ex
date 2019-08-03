defmodule Core.OAuthFactory do
  defmacro __using__(_opts) do
    quote do

      alias Ueberauth.Auth.Info
      alias Ueberauth.Auth.Credentials
      alias Ueberauth.Auth.Extra

      def oauth_facebook_factory do
        user = params_for(:user)
        %{
          credentials: %{
            token: sequence(:token, &"1111111111111111#{&1}")
          },
          extra: %{

          },
          info: %{
            email: user.email,
            name: user.name,
            first_name: sequence(:first_name, &"first_name-#{&1}"),
            last_name: sequence(:last_name, &"last_name-#{&1}"),
            nickname: user.nickname,
            image: user.image
          },
          provider: user.provider,
          strategy: Ueberauth.Strategy.Facebook,
          uid: user.uid
        }
      end
    end
  end
end
