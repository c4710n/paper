defmodule Paper.CMS.Tag do
  use Ecto.Schema

  alias Paper.CMS.Post

  schema "tags" do
    many_to_many :posts, Post, join_through: "posts_tags"
    field :name, :string

    timestamps()
  end
end
