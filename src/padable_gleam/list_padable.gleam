import gleam/list
import padable_gleam.{type Padable, Padable}

pub fn with(target: List(v)) -> Padable(List(v), v) {
  Padable(
    target,
    pad_left: fn(padable, to, with) {
      let Padable(source, pl, pr, pc, r, length_impl) = padable
      let new_times = calculate_times(to, source, length_impl)
      let padded_list = list.append(list.repeat(with, times: new_times), source)
      Padable(padded_list, pl, pr, pc, r, length_impl)
    },
    pad_right: fn(padable, to, with) {
      let Padable(source, pl, pr, pc, r, length_impl) = padable
      let new_times = calculate_times(to, source, length_impl)
      let padded_list = list.append(source, list.repeat(with, times: new_times))
      Padable(padded_list, pl, pr, pc, r, length_impl)
    },
    pad_center: fn(padable, _, _) { padable },
    source_length: fn(source) { list.length(source) },
    resolve: fn(padable) {
      let Padable(resolved, _, _, _, _, _) = padable
      resolved
    },
  )
}

fn calculate_times(to, source, length) {
  let source_length = length(source)
  let times = to - source_length
  case source_length < to {
    True -> times
    False -> 0
  }
}
