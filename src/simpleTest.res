let lightRed = x => `\u001b[91m${x}\u001b[39m`

let lightGreen = x => `\u001b[92m${x}\u001b[39m`

let assertEqual = (~expected, ~actual, ~msg) =>
  if expected == actual {
    Js.log(lightGreen("PASS: ") ++ msg)
  } else {
    Js.log(lightRed("FAIL: ") ++ msg)
  }
