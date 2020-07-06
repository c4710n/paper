defmodule Paper.Repo do
  use Ecto.Repo,
    otp_app: :paper,
    adapter: Ecto.Adapters.Postgres

  def count(table) do
    aggregate(table, :count, :id)
  end
end
