defmodule Paper.CMS.Permalink do
  use Ecto.Schema
  import Ecto.Changeset
  alias Paper.Repo
  alias Paper.CMS.Post

  schema "permalinks" do
    belongs_to :post, Post
    field :url, :string

    timestamps()
  end

  @doc false
  def changeset(permalink, attrs) do
    permalink
    |> cast(attrs, [:url])
    |> validate_required(:url)
    |> unsafe_validate_unique(:url, Repo)
    |> unique_constraint(:url)
  end
end
