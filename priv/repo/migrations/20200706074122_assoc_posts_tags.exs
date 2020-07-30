defmodule Paper.Repo.Migrations.AssocPostsTags do
  use Ecto.Migration

  def change do
    create table(:tags) do
      add :name, :varchar, null: false

      timestamps()
    end

    create unique_index(:tags, [:name])

    create table(:posts_tags, primary_key: false) do
      add :post_id, references(:posts, on_delete: :delete_all), null: false
      add :tag_id, references(:tags, on_delete: :delete_all), null: false
    end

    create unique_index(:posts_tags, [:post_id, :tag_id])
    create index(:posts_tags, [:post_id])
    create index(:posts_tags, [:tag_id])
  end
end
