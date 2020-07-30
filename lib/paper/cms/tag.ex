defmodule Paper.CMS.Tag do
  use Ecto.Schema
  import Ecto.Changeset
  alias Paper.Repo
  alias Paper.CMS.Post

  schema "tags" do
    many_to_many :posts, Post, join_through: "posts_tags"
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(tag, attrs) do
    tag
    |> cast(attrs, [:name])
    |> validate_required([:name])
    |> validate_length(:name, min: 3, max: 50)
    |> unsafe_validate_unique(:name, Repo)
    |> unique_constraint(:name)
  end
end
