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

      with %{
             "data" =>
             %{
               "email" => email,
             }
           } <- json_response(conn, 201) do
        assert email == facebook_auth.info.email
      else
        _ -> assert false
      end
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

      with %{
             "data" =>
             %{
               "id" => id,
               "email" => email,
               "inserted_at" => inserted_at,
               "updated_at" => updated_at
             }
           } <- json_response(conn, 201) do
        assert id == user.id
        assert email == user.email
        assert inserted_at == NaiveDateTime.to_iso8601(user.inserted_at)
        assert updated_at == NaiveDateTime.to_iso8601(user.updated_at)
      else
        _ -> assert false
      end
    end
  end
end
