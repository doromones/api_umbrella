defmodule Auth.Repo.Migrations.CreateSchemaAuth do
  use Ecto.Migration

  def up do
    execute "create schema auth;"
  end

  def down do
    execute "drop schema auth CASCADE;"
  end
end
