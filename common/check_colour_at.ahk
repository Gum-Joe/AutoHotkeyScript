; Checks if colour at a certain pixel is x

; Relative function
checkColourAt(x, y, col) {
  PixelGetColor colour, X, Y
  if (colour = col) {
    Return true
  } else {
    Return false
  }
}