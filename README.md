# padable_gleam

Gleam experiment on how to theoretically implement something like an interface or abstract implementation for different types. 

[![Package Version](https://img.shields.io/hexpm/v/padable_gleam)](https://hex.pm/packages/padable_gleam)
[![Hex Docs](https://img.shields.io/badge/hex-docs-ffaff3)](https://hexdocs.pm/padable_gleam/)

```sh
gleam add padable_gleam
```
```gleam
import gleam/io
import padable_gleam.{pad_center, resolve}
import padable_gleam/list_padable
import padable_gleam/string_padable

pub fn main() {
  list_padable.with(["a", "b", "c"])
    |> pad_center(9, "_")
    |> resolve
    |> io.debug

  string_padable.with("Hello")
    |> pad_center(13, "X")
    |> resolve
    |> io.debug
}
```

Further documentation can be found at <https://hexdocs.pm/padable_gleam>.

## Development

```sh
gleam run   # Run the project
gleam test  # Run the tests
```
