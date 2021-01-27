let lightRed = x => `\u001b[91m${x}\u001b[39m`

let lightGreen = x => `\u001b[92m${x}\u001b[39m`

let assertEqual = (~expected, ~actual, ~msg) =>
  if expected == actual {
    Js.log(lightGreen("PASS: ") ++ msg)
  } else {
    Js.log(lightRed("FAIL: ") ++ msg)
    Js.log("~~~~~~~~~")
    Js.log("Expected: ")
    Js.log("---------")
    Js.log(expected)
    Js.log("")
    Js.log("Received: ")
    Js.log("---------")
    Js.log(actual)
    Js.log("~~~~~~~~~")
  }
