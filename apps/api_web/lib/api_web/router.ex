defmodule ApiWeb.Router do
  use ApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ApiWeb do
    pipe_through :api

    resources "/users", UserController, except: [:new, :edit]

    # Auth
    post("/auth/registrations", Auth.RegistrationController, :create)
  end
end
