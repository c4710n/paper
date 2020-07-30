defmodule Paper.CMS.Post do
  use Ecto.Schema
  import Ecto.Changeset
  alias Paper.CMS.Author
  alias Paper.CMS.Permalink
  alias Paper.CMS.Comment
  alias Paper.CMS.Tag

  schema "posts" do
    belongs_to :author, Author
    has_one :permalink, Permalink
    has_many :comments, Comment
    many_to_many :tags, Tag, join_through: "posts_tags"

    field :title, :string
    field :body, :string

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :body])
    |> validate_required([:title, :body])
    |> validate_length(:title, min: 3, max: 50)
  end
end
