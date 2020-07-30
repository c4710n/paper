defmodule Paper.CMS do
  alias Paper.Repo
  alias Paper.CMS.Author
  alias Paper.CMS.Post
  alias Paper.CMS.Comment
  alias Paper.CMS.Permalink
  alias Paper.CMS.Tag

  @doc false
  def list_authors do
    Repo.all(Author)
  end

  @doc false
  def get_author!(id), do: Repo.get!(Author, id)

  @doc false
  def create_author(attrs \\ %{}) do
    %Author{}
    |> Author.changeset(attrs)
    |> Repo.insert()
  end

  @doc false
  def update_author(%Author{} = author, attrs) do
    author
    |> Author.changeset(attrs)
    |> Repo.update()
  end

  @doc false
  def delete_author(%Author{} = author) do
    Repo.delete(author)
  end

  @doc false
  def change_author(%Author{} = author, attrs \\ %{}) do
    Author.changeset(author, attrs)
  end
end
