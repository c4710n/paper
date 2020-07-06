defmodule Paper.CMS.Comment do
  use Ecto.Schema

  alias Paper.CMS.Post

  schema "comments" do
    belongs_to :post, Post
    field :nickname, :string
    field :email, :string
    field :body, :string

    timestamps()
  end
end
