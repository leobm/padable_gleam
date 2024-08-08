import gleeunit/should
import padable_gleam.{pad_center, resolve}
import padable_gleam/string_padable

pub fn basic_test() {
  string_padable.with("Hello")
  |> pad_center(13, "X")
  |> resolve
  |> should.equal("XXXXHelloXXXX")
}
