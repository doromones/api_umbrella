defmodule ApiWeb.Router do
  use ApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :ensure_auth do
    plug Guardian.Plug.EnsureAuthenticated
  end

  pipeline :auth do
    plug ApiWeb.Guardian.Pipeline
  end

  scope "/", ApiWeb do
    pipe_through :api

    scope "/" do
      pipe_through [:auth, :ensure_auth]

      resources "/users", UserController, except: [:new, :edit]
    end

    scope "/auth", Auth do

      post "/registrations", RegistrationController, :create

      get "/:provider", OAuthController, :request
      get "/:provider/callback", OAuthController, :callback
    end
  end
end
