defmodule Paper.Repo.Migrations.AssocPostsPermalinks do
  use Ecto.Migration

  def change do
    create table(:permalinks) do
      add :post_id, references(:posts, on_delete: :delete_all), null: false
      add :url, :varchar, null: false

      timestamps()
    end

    create unique_index(:permalinks, [:url])
  end
end
