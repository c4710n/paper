defmodule Paper.Repo.Migrations.AssocPostsPermalinks do
  use Ecto.Migration

  def change do
    create table("posts") do
      add :title, :string, null: false
      add :body, :text, null: false

      timestamps()
    end

    create table("permalinks") do
      add :post_id, references("posts"), null: false
      add :url, :string, null: false

      timestamps()
    end

    create unique_index("permalinks", [:post_id])
    create unique_index("permalinks", [:url])
  end
end
