# Teapot

Share some tea with friends when they ask for the most ridiculous of paths.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `plug_teapot` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:plug_teapot, "~> 0.1.0"}
  ]
end
```

Add it to your `Plug` pipeline:

```elixir
defmodule MyApp do
  use Plug.Builder

  use PlugTeapot
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/teapot](https://hexdocs.pm/teapot).

