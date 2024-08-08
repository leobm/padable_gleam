import gleeunit/should
import padable_gleam.{pad_center, pad_left, pad_right, resolve}
import padable_gleam/list_padable

pub fn pad_left_test() {
  list_padable.with(["a", "b", "c"])
  |> pad_left(5, "_")
  |> resolve
  |> should.equal(["_", "_", "a", "b", "c"])

  list_padable.with(["a", "b", "c"])
  |> pad_left(0, "_")
  |> resolve
  |> should.equal(["a", "b", "c"])
}

pub fn pad_right_test() {
  list_padable.with(["a", "b", "c"])
  |> pad_right(5, "_")
  |> resolve
  |> should.equal(["a", "b", "c", "_", "_"])

  list_padable.with(["a", "b", "c"])
  |> pad_right(0, "_")
  |> resolve
  |> should.equal(["a", "b", "c"])
}

pub fn pad_center_test() {
  list_padable.with(["a", "b", "c"])
  |> pad_center(9, "_")
  |> resolve
  |> should.equal(["_", "_", "_", "a", "b", "c", "_", "_", "_"])

  list_padable.with(["a", "b", "c"])
  |> pad_center(0, "_")
  |> resolve
  |> should.equal(["a", "b", "c"])
}
