defmodule Paper.CMS.Author do
  use Ecto.Schema
  import Ecto.Changeset
  alias Paper.Repo
  alias Paper.CMS.Post

  schema "authors" do
    field :name, :string
    field :bio, :string
    has_many :posts, Post

    timestamps()
  end

  @doc false
  def changeset(author, attrs) do
    author
    |> cast(attrs, [:name, :bio])
    |> validate_required(:name)
    |> validate_length(:name, min: 3, max: 50)
    |> validate_length(:bio, max: 400)
    |> unsafe_validate_unique(:name, Repo)
    |> unique_constraint(:name)
  end
end
