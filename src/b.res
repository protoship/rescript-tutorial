/**
  %%raw(
  `
const fs = require('fs')

fs.readFile('./bsconfig.json', 'utf8' , (err, data) => {
  if (err) {
    console.error(err)
    return
  }
  console.log(data)
})
`
)
 */

@bs.module("fs")
external readFile: (string, string, (Js.Nullable.t<{..}>, string) => unit) => unit = "readFile"

@bs.val external foo: 'a = "foo"

readFile("./bsconfig.json", "utf8", (error, data) => {
  if !Js.isNullable(error) {
    Js.Console.error2("config file errro: ", error)
  } else {
    Js.log(data)
  }
})

/**
  
  %%raw(`let todosTxtFile = path.resolve(__dirname, "todo.txt");`)

 */

@bs.val external __dirname: string = "__dirname"

@bs.module("path")
external resolve: (string, string) => string = "resolve"

let completedTodos = resolve(__dirname, "done.txt")

/**
let ddMmYyyy = () => {
  const o_date = new Intl.DateTimeFormat();
  const f_date = (m_ca, m_it) => Object({ ...m_ca, [m_it.type]: m_it.value });
  const { day, month, year } = o_date.formatToParts().reduce(f_date, {});

  return `${day}/${month}/${year}`;
};
 */
