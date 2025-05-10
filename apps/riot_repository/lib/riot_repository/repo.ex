defmodule RiotRepository.Repo do
  use Ecto.Repo,
    otp_app: :riot_repository,
    adapter: Ecto.Adapters.Postgres
end
