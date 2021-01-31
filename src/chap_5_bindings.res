/*
  A programming language no matter how well designed requires real world
  commercial users who are willing to bet on that language and build
  production applications in it.

  To build real world applications the langauge reference manual alone
  is insufficient. You need libraries, frameworks, tooling, documentation,
  tutorials and a good community of developers. 
  
  So a new programming language has a high entry barrier to cross before
  it can reach mass adoption.

  By this time you will be familiar with the workflow where ReScript
  compiles to JavaScript. This is pretty unusual if you are used to thinking
  that a compiler always generates machine code.

  Brendan Eich said, "Always bet on JavaScript". JavaScript is the language
  of the web. It runs on every browser. With the `Node.js` runtime you can
  also run JavaScript on the backend, and use it outside the browser. But
  you cannot ignore JavaScript when building web applications.

  ReScript has really good interop with JavaScript. This makes it possible
  for ReScript to take advantage of the code which is already written for
  JavaScript. 
  
  If a good JavaScript library exists, you can use it in ReScript through
  writing bindings. You've already used the JS API which are bindings to
  the browser Web APIs. When you use `Js.Array.length`, you are infact
  using the `Array.prototype.length` implemented in browsers for JavaScript
  arrays.

  Similar to how types do not generate any compiled JavaScript, a binding
  should also not generate any JavaScript. You do not pay any cost, or
  take an indirection by using a binding. The ReScript compiler is 
  extremely aggressive in generating high quality compiled JavaScript
  code. The code is also human readable. 
  
  There is this expectation that code generators are not good at generating
  human readable code. The ReScript compiler is a counter example to that
  expectation.
 */

/*
  You can drop raw JavaScript code into your ReScript code. This is useful
  when you want to use code written in JavaScript, and immediately try it
  out. 
  
  You can use the `%raw()` 
 */

/*
  Uncomment the block below.
 */
/*
let dateInDdMmYyyy = %raw(
  `
function () {
  const o_date = new Intl.DateTimeFormat();
  const f_date = (m_ca, m_it) => Object({ ...m_ca, [m_it.type]: m_it.value });
  const { day, month, year } = o_date.formatToParts().reduce(f_date, {});
  return day + "/" + month + "/" + year;
}
`
)

dateInDdMmYyyy() // dd/mm/yyyy
*/

/*
  The code below is written in JavaScript.

    ```
    const fs = require('fs');

    fs.readFile('/etc/passwd', (err, data) => {
      if (err) throw err;
      console.log(data);
    });
    ```

  It is an example of using the `fs.readFile` API. This is the `Node.js`
  File System API for asynchronously reading the entire contents of a
  file.

  You can use `bs.module` and the `external` keyword to create a binding.

  In the example the `readFile` accepts two input arguments,
    1. A `string` path value
    2. A `string` encoding value
    3. A callback function with two input arguments
      i. A error object
      ii. A `string` data which contains the contents of the file.

  If reading from the file is successful, then the error object could be
  null or undefined. As you know there is no equivalent in ReScript to
  represent these values. But we have a JS API for null or undefined 
  values - Js.Nullable.t<'a>. 
  
  The type for a JavaScript object is `{..}`. 
  
  By substitution we can therefore give error object the following type:

    `Js.Nullable.t<{..}>`

  The callback function is a side-effect, so it returns `unit`. The entire
  API is a side-effect API, so the final return type is also `unit`.

  Let us see now, how the binding is written.
 */

@bs.module("fs")
external readFile: (string, string, (Js.Nullable.t<{..}>, string) => unit) => unit = "readFile"

/*
  The binding by itself does not generate any JavaScript.

  Now let us use the binding to read the contents of `bsconfig.json`
  available in this project's directory.

  If you run this from the root directory, it will display the happy
  path - the contents of the `bsconfig.json` file. If you run it
  from within the `src/` directory it will display the following
  exception:

    ```
    config file errro:  
      [Error: ENOENT: no such file or directory, open './bsconfig.json'] {
        errno: -2,
        code: 'ENOENT',
        syscall: 'open',
        path: './bsconfig.json'
      }
    ```
 */

/*
  Uncomment the block below.
 */
/*
readFile("./bsconfig.json", "utf8", (error, data) => {
  if !Js.isNullable(error) {
    Js.Console.error2("config file errro: ", error)
  } else {
    Js.log2("[bsconfig.json]", data)
  }
})
*/

/*
  -----------------------------------------------------------------------------
  Exercise 1 
  -----------------------------------------------------------------------------
  Write a binding for the Node.js `fs.readFileSync` API.
  -----------------------------------------------------------------------------
 */

/*
  -----------------------------------------------------------------------------
  Exercise 2
  -----------------------------------------------------------------------------
  Use the binding to read the contents of `./bsconfig.json`.
  -----------------------------------------------------------------------------
 */

/*
  You can bind to global JS values using `bs.val` and `external`.
 */
@bs.val external __dirname: string = "__dirname"

/*
  Uncomment the line below.
 */
// let pathToSomeFile = __dirname ++ "/someFile.txt"

/*
  -----------------------------------------------------------------------------
  Exercise 3
  -----------------------------------------------------------------------------
  Write a binding for `path.resolve`.
  -----------------------------------------------------------------------------
 */

/*
  -----------------------------------------------------------------------------
  Exercise 4
  -----------------------------------------------------------------------------
  Use the `path.resolve` binding to generate the following JavaScript:

    ```
    var Path = require("path");

    var pathToHelloTxt = Path.resolve(__dirname, "hello.txt")
    ```
  -----------------------------------------------------------------------------
 */

/*
  So far we have been dealing with immutable values. Arrays were the only
  mutable type you have worked with so far. Writing correct code becomes
  a much easier task when immutable value transformations are the default.

  But ReScript does not hold you back from imperative programming or using
  mutation when it is absolutely necessary.

  Let us see how you can mutate a let-binding using `ref` values.
 */

/*
  Uncomment the block below.
 */

/*
let counter = ref(0)
let setCounter = (~step) => {
  counter := counter.contents + step
}

setCounter(~step=1) // counter.contents = 1
setCounter(~step=2) // counter.contents = 3
setCounter(~step=3) // counter.contents = 6
setCounter(~step=4) // counter.contents = 10

counter.contents // 10
*/

/*
  The `counter` binding has the type `ref(int)`. Hover over the binding
  to reveal its type.

  The special assignment syntax is used for mutating a contents of a
  binding like,

    `counter := counter.contents + step`

  You can access the value inside of a `ref` like:

    `counter.contents`  
 */
