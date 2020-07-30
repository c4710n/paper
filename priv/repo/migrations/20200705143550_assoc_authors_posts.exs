defmodule Paper.Repo.Migrations.AssocAuthorsPosts do
  use Ecto.Migration

  def change do
    create table(:authors) do
      add :name, :varchar, null: false
      add :bio, :text

      timestamps()
    end

    create unique_index(:authors, [:name])

    create table(:posts) do
      add :author_id, references(:authors, on_delete: :nilify_all)
      add :title, :varchar, null: false
      add :body, :text, null: false

      timestamps()
    end
  end
end
