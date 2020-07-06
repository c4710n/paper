defmodule Paper.Repo.Migrations.AssocAuthorsPosts do
  use Ecto.Migration

  def change do
    create table("authors") do
      add :name, :string, null: false
      add :bio, :string, null: false

      timestamps()
    end

    alter table("posts") do
      add :author_id, references("authors"), null: false
    end

    create unique_index("authors", [:name])
  end
end
