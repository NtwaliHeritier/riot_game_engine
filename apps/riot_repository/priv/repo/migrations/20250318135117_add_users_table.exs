defmodule RiotRepository.Repo.Migrations.AddUsersTable do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :first_name, :string
      add :last_name, :string
      add :age, :integer
      add :gender, :string
      add :account_id, references(:accounts, on_delete: :delete_all)

      timestamps()
    end
  end
end
