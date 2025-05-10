defmodule RiotRepository.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias RiotRepository.Accounts.Account

  schema "users" do
    field(:first_name, :string)
    field(:last_name, :string)
    field(:age, :integer)
    field(:gender, :string)

    belongs_to(:account, Account)

    timestamps()
  end

  @valid_attrs [:first_name, :last_name, :age, :gender, :account_id]

  def changeset(user \\ %__MODULE__{}, attrs) do
    user
    |> cast(attrs, @valid_attrs)
  end
end
