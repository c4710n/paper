import Config

# make Ecto related Mix tasks work as expected.
config :paper,
  ecto_repos: [Paper.Repo]

# add configurations for connecting database.
config :paper, Paper.Repo,
  database: "paper_repo",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"
