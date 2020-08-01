alias Paper.Repo
alias Paper.CMS.{Permalink, Tag, Comment, Post, Author}

defmodule Seed do
  def get_or_insert_author!(name) do
    Repo.insert!(%Author{name: name, bio: "..."},
      on_conflict: {:replace, [:name]},
      conflict_target: :name,
      returning: true
    )
  end

  def get_or_insert_tag!(name) do
    Repo.insert!(%Tag{name: name},
      on_conflict: {:replace, [:name]},
      conflict_target: :name,
      returning: true
    )
  end
end

authors =
  ~w(Spike Julia Vicious)
  |> Enum.map(&Seed.get_or_insert_author!/1)
  |> IO.inspect()

tags =
  ~w(Elixir Emacs Art)
  |> Enum.map(&Seed.get_or_insert_tag!/1)

if Repo.count(Post) == 0 do
  Enum.each([0, 1, 2], fn id ->
    %Post{
      title: "title of post #{id}...",
      body: "body...",
      permalink: %Permalink{url: "/post-#{id}"},
      tags: tags,
      author: Enum.at(authors, id),
      comments: [
        Comment.changeset(%Comment{}, %{
          nickname: "visitor1",
          email: "visitor1@example.com",
          body: "..."
        }),
        Comment.changeset(%Comment{}, %{
          nickname: "visitor2",
          email: "visitor2@example.com",
          body: "..."
        })
      ]
    }
    |> Repo.insert!()
  end)
end
