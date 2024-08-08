import gleam/string
import padable_gleam.{type Padable, Padable}

pub fn with(target: String) -> Padable(String, String) {
  Padable(
    target,
    pad_left: fn(padable, to, with) {
      let Padable(source, pl, pr, pc, length_impl, r) = padable
      let padded = string.pad_left(source, to, with)
      Padable(padded, pl, pr, pc, length_impl, r)
    },
    pad_right: fn(padable, to, with) {
      let Padable(source, pl, pr, pc, l, r) = padable
      let padded = string.pad_right(source, to, with)
      Padable(padded, pl, pr, pc, l, r)
    },
    pad_center: fn(padable, _, _) { padable },
    source_length: fn(source) { string.length(source) },
    resolve: fn(padable) {
      let Padable(resolved, _, _, _, _, _) = padable
      resolved
    },
  )
}
