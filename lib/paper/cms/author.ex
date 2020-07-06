defmodule Paper.CMS.Author do
  use Ecto.Schema

  alias Paper.CMS.Post

  schema "authors" do
    field :name, :string
    field :bio, :string
    has_many :posts, Post

    timestamps()
  end
end
