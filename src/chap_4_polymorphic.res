type pair<'a> = ('a, 'a)

/*
  This type defines a pair of values both of which are of the same type.
  The `'a` is known as a type parameter or type variable. This means you
  can substitute `'a` with any type to create a `pair<'a>` type for that
  value.

  The type `pair<int>` represents a pair of `int` values.
  The type `pair<float>` represents a par of `float` values.

  You can have more than one type variable separated by a comma. For
  example,

    ```
    type triple<'a, 'b> = ('a, 'b, 'a)
    ```

  The `triple<'a, 'b>` is tuple with three values. The first and third
  values belong to type `'a` and the middle value must belong to the
  type `'b`.

  The type `triple<int, float>` is one of the many possible concrete 
  manifestation of this type.

  Both `pair<'a>` and `triple<'a, 'b>` are generic or polymorphic types.
  The concrete type is substituted only when you create a value belonging
  to this type.

  This is also know as **parametric polymorphism**.

  Since the types are parametrized by type variables.
 */

/*
  Uncomment the block below.
 */
/*
let center: pair<int> = (960, 540)
let leroy: pair<string> = ("Xavier", "Leroy")
let coords: pair<float> = (101.5, 42.3)
 */

/*
  Next let us look at functions which operates on polymorphic or generic
  types. The implementation of such a function cannot know anything about
  concrete types like `int`, `string`, etc.
 */

/*
  Uncomment the block below.
 */
/*
let firstInPair = ((first, _): pair<'a>) => first
let secondInPair = ((_, second): pair<'a>) => second
 */

/*
  The same function impelmentation can be reused for `pair<int>`, 
  `pair<string>` & `pair<float>`.

  This is possible because the implemenation of `firstInPair` &
  `secondInPair` does not know anything about those concrete types like
  `int`, `string` or `float`. So you may confidently use it with any type 
  and it will work.
 */

/*
firstInPair(center) // 960
secondInPair(center) // 540

firstInPair(leroy) // Xavier
secondInPair(leroy) // Leroy

firstInPair(coords) // 101.5
secondInPair(coords) // 42.3
*/

/*
  Arrays are a polymorphic type data structure with the type `array<'a>`.
  The implication of this type is that all the values in an array must
  belong to the same type.

  This may not be something you explicitly consider in dynamic languages.
  Almost always you need the guarantee that values in the array have the
  same data structure or are the same type. Mixing and matching values
  of different types in an array are a source of bugs. 
  
  For example you may be expecting float values in an array within a 
  function. Every once in a while this results in a runtime error because
  you also get string values as input. 
  
  There is no explicit notion of types in dynamic langauges. But the code
  which reads those values have an implict notion of the type of the value
  or rather its data structure.

  You can still write robust code in dynamic languages by making explicit
  the type or data structure values. You will not get a compiler to type
  check your code, but it is still better writing code where the types
  are implicit.
 */

/*
  Uncomment the block below.
 */
/*
let languagesAndAuthors: array<pair<string>> = [
  ("Java", "James Gosling"),
  ("C", "Dennis Ritchie"),
  ("Python", "Guido van Rossum"),
  ("PHP", "Rasmus Lerdorf"),
  ("Perl", "Larry Wall"),
  ("JavaScript", "Brendan Eich"),
  ("Ruby", "Yukihiro Matsumoto"),
  ("Lisp", "John McCarthy"),
  ("Pascal", "Niklaus Wirth"),
]
*/

/*
  Above you have an array of `pair<string>`. And `pair<string>` is a
  tuples `string`.
 */

/*
  Uncomment the line below.
 */
// let arrayLength = Js.Array.length(languagesAndAuthors)

/*
  ReScript array compiles to a JavaScript array. So the JavaScript array
  functions are available for use in ReScript.

  The JS API begins with the `Js` module namespace. You will learn about
  modules at the very end. For the time being you can think of them as
  namespaces.

  The `Js.Array` module contains the functions which you can use with
  array values.

  The `Js.Array.length` function has the type:

    ```
    let length: array<'a> => int
    ```
  
  It returns the number of elements in the array.
 */

/*
  Uncomment the block below.
 */
/*
let arrayFirstItem = languagesAndAuthors[0]
let arrayLastItem = languagesAndAuthors[arrayLength - 1]
*/

/*
  You can access the elements in an array by index.

  If you provide a non-existent index, it will result in a runtime
  error. This is not something the compiler can catch for you.

  Since arrays are the same as JavaScript arrays, they are also *mutable*.

  You can change the contents of an array without changing the reference
  or binding to an array value.
 */

let languagesAndAuthors: array<pair<string>> = [
  ("Java", "James Gosling"),
  ("C", "Dennis Ritchie"),
  ("Python", "Guido van Rossum"),
  ("PHP", "Rasmus Lerdorf"),
  ("Perl", "Larry Wall"),
  ("JavaScript", "Brendan Eich"),
  ("Ruby", "Yukihiro Matsumoto"),
  ("Lisp", "John McCarthy"),
  ("Pascal", "Niklaus Wirth"),
]

let pairToString = ((first, second): pair<'a>) => `${first}: ${second}`

// Js API
Js.Array.map(pairToString, languagesAndAuthors)

// Belt
languagesAndAuthors->Belt.Array.map(pairToString)->Js.log

// The most common generic container types you will be familiar
// from other programming languages are arrays. Also look at
// polymorphic functions which transforms an array like -
// map, fold, filter.

// Arrays are implicitly mutable, because ReScript compiles them
// down to JavaScript arrays. It's a shared data type. There is
// no difference in behavior between a JavaScript and ReScript
// array. So there is no immutability. You can change the contents
// of an array without changing it's reference. That is mutation.

// So arrays...

/*

// INVESTIGATE!!!
// The documentations shows that the shared array data
// type compiles down to JavaScript array. But when
// this code compiles to using OCaml arrays. That is
// weird.
let arrayFirstItem = progLangCreators[0]
let arrayLastItem = progLangCreators[arrayLength - 1]

// Let's use Belt now?
// But why are we using Belt when it adds a runtime
// ergonomics
// does not raise exceptions
// but we haven't yet learned about options
// so let's stick to Js.Array itself
// and introduce Belt later

// map
*/

type programmingLanguage = {name: string, creator: string}

/*
  -----------------------------------------------------------------------------
  Exercise 1 
  -----------------------------------------------------------------------------
  Implement the following function which converts the tuple type to a 
  record type,

  let toProgrammingLanguage: progLangCreator => programmingLanguage
  -----------------------------------------------------------------------------
 */

/*
SimpleTest.assertEqual(
  ~expected={name: "Name", creator: "Creator"},
  ~actual=toProgrammingLanguage(("Name", "Creator")),
  ~msg="[exercise 1] convert tuple to record value",
)
*/

/*
  -----------------------------------------------------------------------------
  Exercise 2
  -----------------------------------------------------------------------------
  Generate an array of languages (in lowercase) from `progLangCreators`. The
  language values must be made lowercase.

  You can us the JS API function `Js.String.toLocaleLowerCase` to convert
  a string to lowercase.

    Js.String.toLocaleLowerCase: string => string

  Name the binding `lowercaseLanguages`
  -----------------------------------------------------------------------------
 */

/*
SimpleTest.assertEqual(
  ~expected=["java", "c", "python", "php", "perl", "javascript", "ruby", "lisp", "pascal"],
  ~actual=lowercaseLanguages,
  ~msg="[exercise 2] array of languages in lowercase",
)
*/

/*
  -----------------------------------------------------------------------------
  Exercise 3
  -----------------------------------------------------------------------------
  Use `names` which is pair of first and last names to create `fullnames`
  like shown below:

    ("Jhumpa", "Lahiri") => "Jhumpa Lahiri"
  -----------------------------------------------------------------------------
 */
/*
let names: array<pair<string>> = [
  ("Jhumpa", "Lahiri"),
  ("J. K", "Rowling"),
  ("Devdutt", "Pattanaik"),
]

let fullnames = []

SimpleTest.assertEqual(
  ~expected=["Jhumpa Lahiri", "J. K Rowling", "Devdutt Pattanaik"],
  ~actual=fullnames,
  ~msg="[exercise 3] generate array of full names",
)
*/
/*
  -----------------------------------------------------------------------------
  Exercise 4
  -----------------------------------------------------------------------------
  Generate an array of programming language creators from `progLangCreators`.

  Name the binding `creators`
  -----------------------------------------------------------------------------
 */

/*
SimpleTest.assertEqual(
  ~expected=[
    "James Gosling",
    "Dennis Ritchie",
    "Guido van Rossum",
    "Rasmus Lerdorf",
    "Larry Wall",
    "Brendan Eich",
    "Yukihiro Matsumoto",
    "John McCarthy",
    "Niklaus Wirth",
  ],
  ~actual=creators,
  ~msg="[exercise 4] array of language creators",
)
*/

// filter - languages that start with the letter p
/*
Js.Array.filter(x => {
  let (language, _) = x
  Js.String.startsWith("P", language)
}, progLangCreators)
*/

/*
  -----------------------------------------------------------------------------
  Exercise 5
  -----------------------------------------------------------------------------
  Create a binding `dynamicLanguages` which contains all the dynamic languages
  in `progLangCreators`.!

  You need to filter out any value in `compiledLanguages` provided below.

  You may use `Js.Array.includes`,

    Js.Array.includes("PHP", compiledLanguages) // returns false
    Js.Array.includes("Java", compiledLanguages) // returns true
  -----------------------------------------------------------------------------
 */

/*
let compiledLanguages = ["Java", "C"]


SimpleTest.assertEqual(
  ~expected=["Python", "PHP", "Perl", "JavaScript", "Ruby", "Lisp", "Pascal"],
  ~actual=dynamicLanguages,
  ~msg="[exercise 5] list of dynamic languages",
)
*/

// demonstrate fold with a simple example
type metric = {state: string, count: int}

/*
// daily recovered counts by state
let mh = {state: "Maharasthra", count: 2342}
let ka = {state: "Karnataka", count: 745}
let dl = {state: "Delhi", count: 385}
let wb = {state: "West Bengal", count: 621}
let jh = {state: "Jharkand", count: 111}
let tn = {state: "Tamil Nadu", count: 770}

let totalRecovered = Js.Array.reduce((acc, {count}) => {
  acc + count
}, 0, [mh, ka, dl, wb, jh, tn])
*/

// reduce / fold
// exercise
//
/*
  -----------------------------------------------------------------------------
  Exercise 6
  -----------------------------------------------------------------------------
  Use `Js.Array.reduce` to generate table rows HTML string from the array
  `languagesAndAuthors`.

  The tuple `("Java", "James Gosling")` gets transformed to the following
  HTML:

    <tr>
      <td>Java</td>
      <td>James Gosling</td>
    </tr>

  For indentation use 2 spaces. For this use the `Js.String.repeat` function.

  Save the result of table rows into a binding named: `tableRowsHTML`.

  Use `Js.String.trim` to strip spaces from the beginning or end of a string
  when needed.

  Note: Please do _not_ use `Js.Array.map` and `Js.Array.joinWith` for
  implementing this exercise. 
  -----------------------------------------------------------------------------
 */
/*
let languagesAndAuthors = [("Java", "James Gosling"), ("C", "Dennis Ritchie")]

let tableRowsHTML = ""

let expectedTableHTML = `<tr>
  <td>Java</td>
  <td>James Gosling</td>
</tr>
<tr>
  <td>C</td>
  <td>Dennis Ritchie</td>
</tr>`
SimpleTest.assertEqual(
  ~expected=expectedTableHTML,
  ~actual=tableRowsHTML,
  ~msg="[exercise 6] Use Js.Array.reduce to generate table rows HTML",
)
*/

/*
  -----------------------------------------------------------------------------
  Exercise 7
  -----------------------------------------------------------------------------
  Merge the arrays `books` and `authors` into record values of type `book`.
  Save the result in the binding `mergedBooks`.

  You may need `Belt.List.zip` for this exercise. The `zip` function allows
  you to merge two arrays into an array of tuple values. 
  
  See the example below.

    let xs = [1, 2, 3]
    let ys = [1, 4, 9]
    let zs = Belt.Array.zip(xs, ys) // [(1, 1), (2, 4), (3, 9)]
  -----------------------------------------------------------------------------
 */

type book = {name: string, author: string}
/*
let books = ["Design as Art", "Anathem", "Shogun"]
let authors = ["Bruno Munari", "Neal Stephenson", "James Clavell"]

let mergedBooks = []

let expectedBooks = SimpleTest.assertEqual(
  ~expected=[
    {name: "Design as Art", author: "Bruno Munari"},
    {name: "Anathem", author: "Neal Stephenson"},
    {name: "Shogun", author: "James Clavell"},
  ],
  ~actual=mergedBooks,
  ~msg="[exercise 7] merge two array values into an array of record values",
)
*/
// list
// map, filter
// pattern matching
// immutable
// fast prepend
// fast tail

// --- UNCOMMENT BELOW
// let dailyRecovered: list<metric> = list{mh, ka, dl, wb, jh, tn}

type displayMetric = pair<string>

// TODO
// data first vs data last
/*
let toDisplayMetric = (metric: metric): displayMetric => (
  metric.state,
  Belt.Int.toString(metric.count),
)
*/

/*
let convertedMetrics = Belt.List.map(dailyRecovered, toDisplayMetric)

// iterate
convertedMetrics->Belt.List.forEach(((state, count)) => {
  // comment out to see
  // keep it commented to keep console output tidy for
  // later exercises
  // Js.log("State: " ++ state ++ ", Count: " ++ count)
  // return unit, because we must
  ()
})
*/

// recovered over 500 or more
//let filteredMetrics = Belt.List.keep(dailyRecovered, ({count}) => count >= 500)

// reduce
//let totalRecovered2 = Belt.List.reduce(dailyRecovered, 0, (acc, {count}) => acc + count)

// custom map implementation using reduce
// exercises to implement map & filter & iter
// implementing iter can be done after introducing unit later
/*
  -----------------------------------------------------------------------------
  Exercise 8
  -----------------------------------------------------------------------------
  Implement the following list higher-order functions:

    myCustomMap: (list<'a>, 'a => 'b) => list<'b>
    myCustomFilter: (list<'a>, 'a => bool) => list<'a>
    myCustomForEach: (list<'a>, 'a => unit) => unit

  All three of the above functions can be derived from `reduce`. So use the
  function `Belt.List.reduce` to implement these.
  -----------------------------------------------------------------------------
 */
/*
let myCustomMap = (xs: list<'a>, f: 'a => 'b): list<'b> =>
  Belt.List.reduce(xs, list{}, (acc, x) => list{f(x), ...acc})->Belt.List.reverse

let myCustomForEach = (xs: list<'a>, f: 'a => unit): unit =>
  Belt.List.reduce(xs, (), (_, x) => f(x))

// pattern matching
let myCustomFilter = (xs: list<'a>, f: 'a => bool): list<'a> =>
  Belt.List.reduce(xs, list{}, (acc, x) =>
    if f(x) {
      list{x, ...acc}
    } else {
      acc
    }
  )->Belt.List.reverse
*/

/*
  -----------------------------------------------------------------------------
  Exercise 9
  -----------------------------------------------------------------------------
  Use your custom functions for map, filter & forEach in the following
  data pipeline:

    dailyRecovered
    ->myCustomFilter(x => x.count > 500)
    ->myCustomMap(toDisplayMetric)
    ->myCustomMap(((f, s)) => `${f}: ${s}`)
    ->myCustomForEach(Js.log)

  If your implementation is correct you should see the following being
  logged to console,

    Maharasthra: 2342
    Karnataka: 745
    West Bengal: 621
    Tamil Nadu: 770
  -----------------------------------------------------------------------------
 */

/*
dailyRecovered
->myCustomFilter(x => x.count > 500)
->myCustomMap(toDisplayMetric)
->myCustomMap(((f, s)) => `${f}: ${s}`)
->myCustomForEach(Js.log)
*/

// pattern matching
// case 1: list is empty
// case 2: head, and tail
/*
let describeList = xs =>
  switch xs {
  | list{} => "This list is empty"
  | list{head, ...rest} =>
    "The first item in this list is: " ++
    head ++
    " and there are other " ++
    Belt.Int.toString(Belt.List.length(rest)) ++ " items."
  }

describeList(list{})
describeList(list{"hello", "world", "good", "bye"})
*/

// option
// Tony Hoare had this to say this regarding the invention
// of the null reference in 1965
// "I call it my billion dollar mistake..."
// "This has led to innumerable errors, vulenrabilities,..."
// Ruby uses the special object `nil` to represent and empty
// or default value.
// JavaScript has null & undefined. It is common to get type errors
// like "null is not an object" or "undefined is a not a function"
//
// It is also common to raise an exception when encountering an
// edge case in your code, where there is no result which can
// be returned.
//
// All of these problems has an elegant solution. Use the option
// variant type
//
// type option<'a> = None | Some('a)
//
// It has two constructors.
// None -> there is no value, nothing!
// Some('a) -> there is some value
// it's parametrically polymorphic
// so you can use option to signal the presence or absence of
// value for any type
//
// A concrete example to return the 2nd element in a list
// what are the cases here,
// 1. list could be empty in which case there is no first element
// 2. list could have only a single item
// 3. list could have 2 or more items

/*
let getSecondListItem = xs =>
  switch xs {
  | list{} => None
  | list{_first} => None
  | list{_first, second, ..._rest} => Some(second)
  }

let secondListItem = getSecondListItem(list{})
let secondListItem2 = getSecondListItem(list{1})
let secondListItem3 = getSecondListItem(list{"hello", "world"})
let secondListItem4 = getSecondListItem(list{mh, ka, dl, wb, jh, tn})
*/

// confusing at first!
// why is the inferred type 'a
// The constructor does not have arguments
// becaues it is the None constructor
// only the Some constructor uses the 'a argument
// so the concrete type is not know here
// type checker infers the principal type
// that means the most general purpose type which is
// applicable here.

/* UNCOMMENT BELOW
let nothing = None
 UNCOMMENT ABOVE */

// You can always manually annotate to force a specialized
// type. Often this is not necessary in application code
// because the evaluation context would have enough
// information to infer the type. But if that does not
// happen, then you can fallback to manually annotating
// the type
/*
let nothing2: option<int> = None

let whatNumberAmIThinking = (myNumber: option<int>) =>
  switch myNumber {
  | None => "I'm not thinking of any number!"
  | Some(number) => "My number is: " ++ string_of_int(number)
  }

assert (whatNumberAmIThinking(None) == "I'm not thinking of any number!")
assert (whatNumberAmIThinking(Some(7)) == "My number is: 7")
*/

/*
  -----------------------------------------------------------------------------
  Exercise 10
  -----------------------------------------------------------------------------
  Implement the function [safeDivide(~dividend, ~divisor)], which takes two
  ints and returns an int option. It should return None if [divisor = 0], and
  otherwise returns [Some(x)] where [x] is the division result
  -----------------------------------------------------------------------------
 */
/*
let safeDivide = (~dividend, ~divisor) =>
  if divisor == 0 {
    None
  } else {
    Some(dividend / divisor)
  }

SimpleTest.assertEqual(
  ~expected=Some(9),
  ~actual=safeDivide(~dividend=1, ~divisor=0),
  ~msg="[exercise 8] unsafe divide by zero",
)
*/

// pattern matching - simple example
// Add the whole quote
/*
let bukowski = Some("If you're going to try, go all the way...")
let printMessage = message =>
  switch message {
  | None => "The message is empty"
  | Some(x) => x
  }

printMessage(bukowski)
*/

// Belt combinators
// especially map

// inside a data transformation pipeline when you encounter
// an option value, you'll pattern match on it. After
// applying the function to the value inside `Some(value)`
// like `f(value)`, the computation will move down the
// chain. When the value is a `None` the function `f`
// has no argument to be apply.
// The `printMessage` function above knows how to
// pattern match on the option<'a> type values.
// What would you do if you had to construct a pipline
// where the functions themselves are not aware of
// option values. Rewriting them to pattern match
// on an option type value is painfully unnecessary.

/*
let mapOption = (f, opt) =>
  switch opt {
  | None => None
  | Some(i) => Some(f(i))
  }

let double = i => 2 * i

let () = assert (mapOption(double, None) == None)

let () = assert (mapOption(double, Some(2)) == Some(4))
*/

// The function is not applied or computed when the
// input argument is None. The computation is
// short-circuited. So if you construct a data pipeline
// where functions are being chained, when a None is
// computed anywhere it flows to the end of the
// pipeline without further computation.
// Only `Some(value)` will have function application
// happening down the chain.
//
// This is a forward reference:
// We'll revisit this concept when the pipeline operator
// is introduced.

// We don't need to implement mapOption ourselves
// We can use Belt.Option.map

// assert (Belt.Option.map(None, double) == None)
// assert (Belt.Option.map(Some(2), double) == Some(4))

// self-referential structures
// recursive functions over them
/*
  <div>
    <h1>
      <a href="#hello-world">Jump to here</a>
    </h1>
    <p>Hello, world!</p>
    <a href="mailto:nowhere@mozilla.org">Send email to nowhere</a>
  </div>
*/

// Revisiting variants
// Move it outside exercise (self-contained)
/*
type href = Fragment(string) | MailTo(string)

type rec markup =
  | Division(array<markup>)
  | Heading(array<markup>)
  | Paragraph(string)
  | Anchor(href, string)

let exampleHTML = Division([
  Heading([Anchor(Fragment("hello-world"), "Jump to here")]),
  Paragraph("Hello, world!"),
  Anchor(MailTo("nowhere@mozilla.org"), "Send email to nowhere"),
])

// exercise functions below (difficulty is hard)
let hrefToHTML = href =>
  switch href {
  | Fragment(fragment) => `#${fragment}`
  | MailTo(email) => `mailto:${email}`
  }

let anchorToHTML = (href, displayText) => `<a href=${hrefToHTML(href)}>${displayText}</a>`

let paragraphToHTML = text => `<p>${text}</p>`

let renderHTML = html => {
  let wrapInTag = (~tag, ~innerHTML, ~indent) =>
    `${indent}<${tag}>\n${innerHTML}\n${indent}</${tag}>`

  let rec aux = (depth, x) => {
    let indent = Js.String.repeat(depth * 2, " ")
    let toHTML = (~tag, xs) =>
      wrapInTag(
        ~tag,
        ~innerHTML=xs->Belt.Array.map(aux(depth + 1))->Js.Array.joinWith("\n", _),
        ~indent,
      )

    switch x {
    | Division(children) => children->toHTML(~tag="div")
    | Heading(children) => children->toHTML(~tag="h2")
    | Paragraph(text) => indent ++ paragraphToHTML(text)
    | Anchor(href, displayText) => indent ++ anchorToHTML(href, displayText)
    }
  }

  aux(0, html)
}
*/
