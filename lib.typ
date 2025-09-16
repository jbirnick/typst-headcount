#let reset-counter(counter, levels: 1) = it => {
  if it.level <= levels { counter.update((0,)) }
  it
}

#let normalize-length(array, length, pad-zeros) = {
  if array.len() > length {
    array.slice(0, length)
  } else {
    if pad-zeros {
      array + (length - array.len()) * (0,)
    } else {
      array
    }
  }
}

#let dependent-numbering(style, levels: 1, pad-zeros: true) = n => {
  numbering(
    style,
    ..normalize-length(counter(heading).get(), levels, pad-zeros),
    n,
  )
}
