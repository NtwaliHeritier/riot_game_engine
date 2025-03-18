defmodule RiotRepository.Repo.Migrations.AddAccountsTable do
  use Ecto.Migration

  def change do
    create table(:accounts) do
      add :email, :string, null: false
      add :hash_password, :string, null: false

      timestamps()
    end

    create unique_index(:accounts, [:email])
  end
end
