defmodule Paper.CMS.Permalink do
  use Ecto.Schema

  alias Paper.CMS.Post

  schema "permalinks" do
    belongs_to :post, Post
    field :url, :string

    timestamps()
  end
end
