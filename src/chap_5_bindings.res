// bindings
// bind to any JS function
// checkout the interop cheatsheet on the documentation site
// the new & better binding syntax - refer Cheng Lou's commit in bs-domgraph
// refer to https://rescript-lang.org/docs/manual/latest/object

// embedding and using raw javascript
// writing bindings to a JavaScript API
// writing bindings for a JavaScript value
// interacting with objects from the JS side
let dateFn = %raw(
  `
function () {
  const o_date = new Intl.DateTimeFormat();
  const f_date = (m_ca, m_it) => Object({ ...m_ca, [m_it.type]: m_it.value });
  const { day, month, year } = o_date.formatToParts().reduce(f_date, {});
  return day + "/" + month + "/" + year;
}
`
)

// Js.log(dateFn())

@bs.module("fs")
external readFile: (string, string, (Js.Nullable.t<{..}>, string) => unit) => unit = "readFile"

readFile("./bsconfig.json", "utf8", (error, _data) => {
  if !Js.isNullable(error) {
    Js.Console.error2("config file errro: ", error)
  }
  // else {
  //   Js.log(data)
  // }
})

/**
  
  %%raw(`let todosTxtFile = path.resolve(__dirname, "todo.txt");`)

 */

@bs.val external __dirname: string = "__dirname"

@bs.module("path")
external resolve: (string, string) => string = "resolve"

// let completedTodos = resolve(__dirname, "done.txt")

//scope JSON.parse
@bs.scope("JSON") @bs.val external parseNames: string => {"names": array<string>} = "parse"

// JS Object
let result = parseNames(`{"names": ["Luke", "Christine"]}`)["names"][0]

type users = {names: array<string>}
@bs.scope("JSON") @bs.val external parseUsers: string => users = "parse"
let name = parseUsers(`{"names": ["Luke", "Christine"]}`).names[1]

// imperative programming
// refs (mutating a let-binding)
/*
  It is sometimes useful to create a single mutable value. We can do this
  using a ref. We can create an int ref containing 0 as follows:
 
  Then we can access the value in the ref using the ^ operator, and
  we can update it using the := operator. So, we could increment our
  ref as follows:
 */

// a counter example
let counter = ref(0)
let setCounter = (~step) => {
  counter := counter.contents + step
}

setCounter(~step=1) // counter.contents = 1
setCounter(~step=2) // counter.contents = 3
setCounter(~step=3) // counter.contents = 6
setCounter(~step=4) // counter.contents = 10
