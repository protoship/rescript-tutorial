type t = {
  expr: bool,
  desc: string,
}

let create = ((expr, desc)) => {expr: expr, desc: desc}

let test = t => t.expr

let lightRed = x => j`\u001b[91m$x\u001b[39m`

let lightGreen = x => j`\u001b[92m$x\u001b[39m`

let runAll = xs => {
  let toString = t =>
    "Testing " ++
    t.desc ++
    "... " ++
    switch t.expr {
    | false => lightRed("failed")
    | true => lightGreen("passed")
    }
  let count = Js.Array.length(xs)
  let tests = Js.Array.map(create, xs)
  let failures = tests |> Js.Array.map(test) |> Js.Array.filter(y => !y) |> Js.Array.length
  let descriptions = Js.Array.map(toString, tests)
  Js.log("")
  Js.Array.forEachi((x, i) => Js.log(string_of_int(i + 1) ++ ". " ++ x), descriptions)
  Js.log("")
  if failures == 0 {
    Js.log(lightGreen("All tests passed!"))
  } else {
    Js.log(
      lightRed(string_of_int(failures) ++ " out of " ++ string_of_int(count) ++ " tests failed."),
    )
  }
  Js.log("")
}
