defmodule ApiWeb.UserController do
  use ApiWeb, :controller

  alias Core.Accounts
  alias Core.Accounts.User

  action_fallback ApiWeb.FallbackController

  def index(conn, _params) do
    IO.puts "***************************************************************************"
    conn = Plug.Conn.put_private(conn, :ueberauth_request_options, %{
      callback_methods: ["GET"],
      callback_params: nil,
      callback_path: "/auth/facebook/callback",
      callback_url: nil,
      options: [],
      request_path: "/auth/facebook",
      strategy: Ueberauth.Strategy.Facebook,
      strategy_name: :facebook
    })
    access_token = "EAAFoq3aMTTcBADfZCoh5zybOoKUMmLee4yQq9YWYjhkZCPdIc1z76FMIMEW2D7DZBKGOzxzw51yNDOi5UP7ytPhhlu8J4u62nr3jdw4HW3xccA0nNoO6Jr223pV9WZCsQfEvZAoFZCHuO6UXZCVymgxviHoZAbB2oDmt2wmZCX5ZBL7H4R4jdeVcTFa8KwXd9BseBeC3UN4ZAhPw1oY4w0jNYtVEo5q71CERZA8ZD"
    client = Ueberauth.Strategy.Facebook.OAuth.client([token: access_token])
    res = Ueberauth.Strategy.Facebook.fetch_user(conn, client)
    res = Ueberauth.Strategy.Facebook.auth(res)
    IO.puts "res *************************"
    IO.inspect res, limit: :infinity, printable_limit: :infinity, pretty: true
    IO.puts "res *************************"
    IO.puts "***************************************************************************"
    users = Accounts.list_users()
    render(conn, "index.json", users: users)
  end

  def create(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Accounts.create_user(user_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.user_path(conn, :show, user))
      |> render("show.json", user: user)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    render(conn, "show.json", user: user)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Accounts.get_user!(id)

    with {:ok, %User{} = user} <- Accounts.update_user(user, user_params) do
      render(conn, "show.json", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)

    with {:ok, %User{}} <- Accounts.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end
end
