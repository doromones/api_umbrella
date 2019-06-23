defmodule Core.AccountsTest do
  use Core.DataCase
  import Core.Factory

  alias Core.Accounts

  describe "users" do
    alias Core.Accounts.User

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(params_for(:user))
        |> Accounts.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      params = params_for(:user)
      assert {:ok, %User{} = user} = Accounts.create_user(params)
      assert user.email == params.email
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(params_for(:user_bad))
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      update_attributes = params_for(:user)
      assert {:ok, %User{} = user} = Accounts.update_user(user, update_attributes)
      assert user.email == update_attributes.email
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, params_for(:user_bad))
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end
end
