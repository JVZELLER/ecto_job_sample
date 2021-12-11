import Config

config :sample, Sample.Repo,
  database: "postgres",
  username: "user",
  password: "pass",
  hostname: "localhost"

config :sample, ecto_repos: [Sample.Repo]

config :logger, level: :info
