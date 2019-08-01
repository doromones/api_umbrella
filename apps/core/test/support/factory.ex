defmodule Core.Factory do
  use ExMachina.Ecto, repo: Core.Repo

  use Core.UserFactory
  use Core.OAuthFactory

end
