defmodule Paper.Repo.Migrations.AssocPostsTags do
  use Ecto.Migration

  def change do
    create table("tags") do
      add :name, :string, null: false

      timestamps()
    end

    create table("posts_tags", primary_key: false) do
      add :post_id, references("posts"), null: false
      add :tag_id, references("tags"), null: false
    end

    create unique_index("posts_tags", [:post_id, :tag_id])
    create index("posts_tags", [:post_id])
    create index("posts_tags", [:tag_id])
  end
end
