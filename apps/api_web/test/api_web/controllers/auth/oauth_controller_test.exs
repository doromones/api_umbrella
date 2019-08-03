defmodule ApiWeb.Auth.OAuthControllerTest do
  use ApiWeb.ConnCase
  import Core.Factory

  setup %{conn: conn} do
    conn = conn
           |> put_req_header("accept", "application/json")

    {:ok, conn: conn}
  end

  describe "create user" do
    test "renders user when data is valid", %{conn: conn} do
      facebook_auth = build(:oauth_facebook)
      conn = conn
             |> assign(:ueberauth_auth, facebook_auth)
             |> get("/auth/facebook/callback")

      email = facebook_auth.info.email
      assert %{"email" => email} = json_response(conn, 201)["data"]
    end

    test "renders errors when user already exists", %{conn: conn} do
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

      response_body = json_response(conn, 201)
      assert response_body["errors"] == nil
      assert %{"id" => id} = response_body["data"]
    end
  end
end
