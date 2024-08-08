pub type Padable(a, b) {
  Padable(
    source: a,
    // public functions
    pad_left: fn(Padable(a, b), Int, b) -> Padable(a, b),
    pad_right: fn(Padable(a, b), Int, b) -> Padable(a, b),
    pad_center: fn(Padable(a, b), Int, b) -> Padable(a, b),
    resolve: fn(Padable(a, b)) -> a,
    // private functions
    source_length: fn(a) -> Int,
  )
}

pub fn pad_left(padable: Padable(a, b), to: Int, with: b) {
  let Padable(_, pad_left_impl, _, _, _, _) = padable
  pad_left_impl(padable, to, with)
}

pub fn pad_right(padable: Padable(a, b), to: Int, with: b) {
  let Padable(_, _, pad_right_impl, _, _, _) = padable
  pad_right_impl(padable, to, with)
}

pub fn pad_center(padable: Padable(a, b), to: Int, with: b) {
  let Padable(source, pad_left_impl, pad_right_impl, _, _, length) = padable
  padable
  |> pad_left_impl({ length(source) + to } / 2, with)
  |> pad_right_impl(to, with)
}

pub fn resolve(padable: Padable(a, b)) -> a {
  let Padable(_, _, _, _, resolve, _) = padable
  resolve(padable)
}
