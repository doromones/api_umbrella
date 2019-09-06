defmodule ApiWeb.Auth.OAuthControllerTest do
  use ApiWeb.ConnCase
  import Core.Factory

  setup %{conn: conn} do
    conn = conn
           |> put_req_header("accept", "application/json")

    {:ok, conn: conn}
  end

  describe "auth" do
    test "when user already exists", %{conn: conn} do
      user = insert(:user)

      facebook_auth =
        build(:oauth_facebook)
        |> put_in([:info, :email], user.email)
        |> put_in([:provider], user.provider)
        |> put_in([:uid], user.uid)

      conn =
        conn
        |> assign(:ueberauth_auth, facebook_auth)
        |> get("/auth/facebook/callback")

      render_user =
        ApiWeb.Auth.OAuthView.render("callback.json", %{user: user})
        |> Jason.encode!
        |> Jason.decode!

      assert json_response(conn, 201) == render_user
    end
  end

  describe "create user" do
    test "renders user when data is valid", %{conn: conn} do
      facebook_auth = build(:oauth_facebook)
      email = facebook_auth[:info][:email]

      conn =
        conn
        |> assign(:ueberauth_auth, facebook_auth)
        |> get("/auth/facebook/callback")

      assert %{
               "data" => %{
                 "email" => ^email
               }
             } = json_response(conn, 201)
    end
  end
end
