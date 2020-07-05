# Used by "mix format"
[
  import_deps: [:ecto],
  inputs: ["*.{ex,exs}", "{config,lib,test}/**/*.{ex,exs}", "priv/*/seeds.exs"],
  subdirectories: ["priv/*/migrations"]
]
