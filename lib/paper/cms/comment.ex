defmodule Paper.CMS.Comment do
  use Ecto.Schema
  import Ecto.Changeset
  alias Paper.CMS.Post

  schema "comments" do
    belongs_to :post, Post
    field :nickname, :string
    field :email, :string
    field :body, :string

    timestamps()
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:nickname, :email, :body])
    |> validate_required([:nickname, :email, :body])
    |> validate_length(:nickname, min: 3, max: 50)
    |> validate_length(:email, max: 200)
  end
end
