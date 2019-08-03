defmodule Core.Repo.Migrations.AddOAuthFieldsForUser do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :provider, :string
      add :uid, :string
      add :name, :string
      add :nickname, :string
      add :image, :string
    end
  end
end
