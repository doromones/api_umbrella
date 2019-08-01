defmodule ApiWeb.Router do
  use ApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ApiWeb do
    pipe_through :api

    resources "/users", UserController, except: [:new, :edit]

    scope "/auth", Auth do

      post "/registrations", RegistrationController, :create

      get "/:provider", OAuthController, :request
      get "/:provider/callback", OAuthController, :callback
    end
  end
end
