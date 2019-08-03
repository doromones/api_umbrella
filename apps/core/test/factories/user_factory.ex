defmodule Core.UserFactory do
  defmacro __using__(_opts) do
    quote do

      def user_factory do
        %Core.Accounts.User{
          email: sequence(:email, &"email-#{&1}@example.com"),
          provider: "facebook",
          uid: sequence(:email, &"1111111111111111#{&1}"),
        }
      end

      def user_bad_factory do
        %Core.Accounts.User{
          email: ""
        }
      end
    end
  end
end
