defmodule RiotRepository.Accounts.Account do
  use Ecto.Schema
  import Ecto.Changeset

  alias RiotRepository.Accounts.User

  schema "accounts" do
    field(:email, :string)
    field(:hash_password, :string)

    has_one(:user, User)

    timestamps()
  end

  def changeset(account \\ %__MODULE__{}, attrs) do
    account
    |> cast(attrs, [:email, :hash_password])
    |> validate_required([:email, :hash_password])
    |> validate_length(:email, max: 100)
    |> unique_constraint(:email)
    |> put_hash_password()
  end

  defp put_hash_password(
         %Ecto.Changeset{valid?: true, changes: %{hash_password: hash_password}} = changeset
       ) do
    put_change(changeset, :hash_password, Argon2.hash_pwd_salt(hash_password)) |> IO.inspect()
  end

  defp put_hash_password(changeset), do: changeset
end
