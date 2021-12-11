import Config

config :sample, Sample.Repo,
  database: "sample_repo",
  username: "user",
  password: "pass",
  hostname: "localhost"

config :sample, ecto_repos: [Sample.Repo]
