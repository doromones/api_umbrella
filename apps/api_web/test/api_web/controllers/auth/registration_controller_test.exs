defmodule ApiWeb.Auth.RegistrationControllerTest do
  use ApiWeb.ConnCase
  import Core.Factory

  setup %{conn: conn} do
    conn = conn
           |> put_req_header("accept", "application/json")

    {:ok, conn: conn}
  end

  describe "create user" do
    test "renders user when data is valid", %{conn: conn} do
      conn = post(conn, Routes.registration_path(conn, :create), user: params_for(:user))
      assert %{"id" => id} = json_response(conn, 201)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.registration_path(conn, :create), user: params_for(:user_bad))
      response_body = json_response(conn, 422)

      assert map_size(response_body["errors"]) == 1
      assert "can't be blank" in response_body["errors"]["email"]
    end

    test "renders errors when user already exists", %{conn: conn} do
      user = insert(:user)

      conn = post(
        conn,
        Routes.registration_path(conn, :create),
        user: %{
          email: user.email
        }
      )

      response_body = json_response(conn, 422)

      assert map_size(response_body["errors"]) == 1
      assert "has already been taken" in response_body["errors"]["email"]
    end
  end
end
