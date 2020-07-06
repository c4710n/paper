defmodule Paper.Repo.Migrations.AssocPostsComments do
  use Ecto.Migration

  def change do
    create table("comments") do
      add :post_id, references("posts"), null: false
      add :nickname, :string, null: false
      add :email, :string, null: false
      add :body, :text, null: false

      timestamps()
    end
  end
end
