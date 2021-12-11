# Sample

Simple project to understand how [`EctoJob`](https://hexdocs.pm/ecto_job) library works and explore its capabilities.
At work, we discovered that the library wasn't working as we expected it to work and decided to poke around with it and try some things before opening issues and making a pull request to the official repository.

## Setup
We are using [`asdf`](https://asdf-vm.com/) to mananage runtime:

```bash
asdf install
```

Also, there is a Makefile to help you run this project. The following commands will setup the database service, elixir dependencies and run migrations:

```bash
make up
make prepare
```

