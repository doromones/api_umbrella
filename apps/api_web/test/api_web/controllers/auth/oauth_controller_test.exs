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
      facebook_auth = params_for(:oauth_facebook)
      conn = conn
             |> assign(:ueberauth_auth, facebook_auth)
             |> get("/auth/facebook/callback")

      IO.inspect(json_response(conn, 201))

      email = facebook_auth.info.email
      assert %{"email" => email} = json_response(conn, 201)["data"]
    end
  end
end
