defmodule Core.OAuthFactory do
  defmacro __using__(_opts) do
    quote do

      alias Ueberauth.Auth.Info
      alias Ueberauth.Auth.Credentials
      alias Ueberauth.Auth.Extra

      def oauth_facebook_factory do
        %{
          credentials: %Credentials{
            token: sequence(:token, &"1111111111111111#{&1}")
          },
          extra: %Extra{

          },
          info: %Info{
            email: sequence(:email, &"email-#{&1}@example.com"),
            first_name: sequence(:first_name, &"first_name-#{&1}"),
            last_name: sequence(:last_name, &"last_name-#{&1}")
          },
          provider: :facebook,
          strategy: Ueberauth.Strategy.Facebook,
          uid: sequence(:uid, &"111111111#{&1}")
        }
      end
    end
  end
end
