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
let languagesAndAuthors = [
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
  Above you have an array of`(string, string)` tuples.
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

/*
  Uncomment the block below.
 */
/*
let tupleToString = ((first, second)) => `${first}: ${second}`

// Using JS API
Js.Array.map(tupleToString, languagesAndAuthors)
*/
/*
  __DO NOT UNCOMMENT. THIS IS NOT CODE.__
  Result: 
    
    [
      "Java: James Gosling",
      "C: Dennis Ritchie",
      "Python: Guido van Rossum",
      "PHP: Rasmus Lerdorf",
      "Perl: Larry Wall",
      "JavaScript: Brendan Eich",
      "Ruby: Yukihiro Matsumoto",
      "Lisp: John McCarthy",
      "Pascal: Niklaus Wirth",
    ]

  __DO NOT UNCOMMENT. THIS IS NOT CODE.__
 */

/*
  You use the `map` to transform an array of values.

    ```
    let map: ('a => 'b, array<'a>) => array<'b>
    ```

  Let us deconstruct the type signature.

  There are two input arguments to the map function.
    1. A function which maps a value of type 'a to type 'b
    2. An array of values of type 'a

  The map function applies the function(1st argument) to each item in the
  input array and returns a new array as output.

  The `languagesAndAuthors` is an array of string tuples. So `'a` is the
  string tuples `(string, string)`. [2nd argument]

  The `tupleToString` function has the following type:

    ```
    let tupleToString: ((string , string)) => string
    ```
  
  The output type is `string`. So `'b` is `string`. [1st argument]

  The output type for the map function is `array<'b>`. By substitution
  we know that the output type will be `array<string>`.

  So we used `map` to transform an array of type `array<(string, string)>`
  to a new array of type `array<string>`.
 */

/*
  Uncomment the block below.
 */
/*
// Using Belt API (The ReScript standard library)
languagesAndAuthors->Belt.Array.map(tupleToString)
*/
/*
  __DO NOT UNCOMMENT. THIS IS NOT CODE.__
  Result: 
    
    [
      "Java: James Gosling",
      "C: Dennis Ritchie",
      "Python: Guido van Rossum",
      "PHP: Rasmus Lerdorf",
      "Perl: Larry Wall",
      "JavaScript: Brendan Eich",
      "Ruby: Yukihiro Matsumoto",
      "Lisp: John McCarthy",
      "Pascal: Niklaus Wirth",
    ]
  __DO NOT UNCOMMENT. THIS IS NOT CODE.__
 */

/*
  Belt is the name of ReScript standard library.

  The argument order is different in the `Belt.Array.map` function
  which allows you to use it with the pipe operator like shown
  above.

  The advantage of using Belt over JavaScript API is that it implemented
  with ReScript ergonomics in mind. But the most important advantage is
  that a Belt function will never throw an exception. You will soon
  encounter in this lesson the specific type & programming techniques 
  which makes this possible.

  Unlike the JavaScript API, the Belt requires a runtime. Meaning there
  is additional JavaScript code which needs to execute. JavaScript APIs
  on the other hand are implemented internally in the browser engine.

  Belt is optimized for performance, so this is not a concern which
  affects most of the code you will write. But when it does you have
  the option of using the JavaScript API.

  Also not every function available in the JavaScript API may be available
  in the Belt library. In this case you do not have a choice but use
  the JS API.
 */

type pl = {language: string, author: string}

/*
  -----------------------------------------------------------------------------
  Exercise 1 
  -----------------------------------------------------------------------------
  Write a function to parse a tuple value like:
  
     `("JavaScript", "Brendan Eich")`

  into a `pl` record type value like:

    `{language: "JavaScript", author: "Brendan Eich"}`

  The type signature of the funtion you need to implement is:

    `let parsePL: ((string, string)) => pl`
  -----------------------------------------------------------------------------
 */

/*
  Uncomment the block below. It contains test code for exercise 1.
 */
/*
SimpleTest.assertEqual(
  ~expected={language: "JavaScript", author: "Brendan Eich"},
  ~actual=parsePL(("JavaScript", "Brendan Eich")),
  ~msg="[exercise 1] parse `pl` record type value from string tuple",
)
*/

/*
  -----------------------------------------------------------------------------
  Exercise 2
  -----------------------------------------------------------------------------
  Transform the array `languagesAndAuthors` into an array which contains
  only the lowercased language values.

  Assign the newly created array to the binding `lowercaseLanguages`.

  Hint: Use `Js.String.toLocaleLowerCase` to convert a string to lowercase.
  -----------------------------------------------------------------------------
 */

/*
  Uncomment the block below. It contains test code for exercise 2.
 */
/*
let lowercaseLanguages = []

SimpleTest.assertEqual(
  ~expected=["java", "c", "python", "php", "perl", "javascript", "ruby", "lisp", "pascal"],
  ~actual=lowercaseLanguages,
  ~msg="[exercise 2] languages in lowercase",
)
*/

/*
  -----------------------------------------------------------------------------
  Exercise 3
  -----------------------------------------------------------------------------
  Transform the values in `names` array into a new array `fullnames` by
  joining the first and last names together.

    ("Jhumpa", "Lahiri") => "Jhumpa Lahiri"
  -----------------------------------------------------------------------------
 */

/*
  Uncomment the block below. It contains test code for exercise 3.
 */
/*
let names = [("Jhumpa", "Lahiri"), ("J. K", "Rowling"), ("Devdutt", "Pattanaik")]
let fullnames = []

SimpleTest.assertEqual(
  ~expected=["Jhumpa Lahiri", "J. K Rowling", "Devdutt Pattanaik"],
  ~actual=fullnames,
  ~msg="[exercise 3] full names",
)
*/

/*
  -----------------------------------------------------------------------------
  Exercise 4
  -----------------------------------------------------------------------------
  Transform the array `languagesAndAuthors` into an array which contains
  only names of the authors.

  Assign the newly created array to the binding `authors`.
  -----------------------------------------------------------------------------
 */

/*
  Uncomment the block below. It contains test code for exercise 4.
 */
/*
let authors = []

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
  ~actual=authors,
  ~msg="[exercise 4] programming language authors",
)
*/

/*
  The `filter` function returns a new array that keeps all the array
  items which satisfies a condition.

    ```
    let filter: ('a => bool, array<'a>) => array<'a>
    ```
  
  The condition to satisfy for keeping an array item is specified by
  the first argument which is a function with the type: `'a => bool`.

  In the below example we check if the first value of the string
  tuple begins with the letter "P". (case-sensitive)

  The underscore is used as a name for destructuring the second
  argument of the tuple. This is because we have no use for the
  second value in the the function. This binding is therefore ignored.

  In contrast when using `map` you could transform an array of values
  from one type to an array of values of a different or even the same
  type.

  In the case of filter both the input and output array values belong
  to the same type.
 */

/*
  Uncomment the block below.
 */
/*
let filtered =
  Js.Array.filter(
    ((language, _)) => Js.String.startsWith("P", language),
    languagesAndAuthors,
  )
*/
/*
  __DO NOT UNCOMMENT. THIS IS NOT CODE.__
  Result: 

    [
      ("Python", "Guido van Rossum"),
      ("PHP", "Rasmus Lerdorf"),
      ("Perl", "Larry Wall"),
      ("Pascal", "Niklaus Wirth"),
    ]
  
  __DO NOT UNCOMMENT. THIS IS NOT CODE.__
*/

/*
  -----------------------------------------------------------------------------
  Exercise 5
  -----------------------------------------------------------------------------
  Create a binding `dynamicLanguages` which contains all the dynamic languages
  in `languagesAndAuthors`. Keep the values which are not present in the
  array binding `compiledLanguages`.

  Hint: Use `Js.Array.includes`

    ```
    Js.Array.includes("PHP", compiledLanguages) // returns false
    Js.Array.includes("Java", compiledLanguages) // returns true
    ```
  -----------------------------------------------------------------------------
 */

/*
let compiledLanguages = ["Java", "C"]
let dynamicLanguages = []

SimpleTest.assertEqual(
  ~expected=["Python", "PHP", "Perl", "JavaScript", "Ruby", "Lisp", "Pascal"],
  ~actual=dynamicLanguages,
  ~msg="[exercise 5] dynamic languages",
)
*/

/*
  The `reduce` function is used when you need to summarize an array of
  values into a single value.

  In the below example we use `reduce` to find the total count from
  an array of statewise counts.
 */

/*
  Uncomment the block below.
 */
/*
type metric = {state: string, count: int}

let mh = {state: "Maharasthra", count: 2342}
let ka = {state: "Karnataka", count: 745}
let dl = {state: "Delhi", count: 385}
let wb = {state: "West Bengal", count: 621}
let jh = {state: "Jharkand", count: 111}
let tn = {state: "Tamil Nadu", count: 770}

let totalCount = Js.Array.reduce((acc, {count}) => {
  acc + count
}, 0, [mh, ka, dl, wb, jh, tn]) // 4974
*/

/*
  The type of `Js.Array.reduce` is:

    ```
    let reduce: (('b, 'a) => 'b, 'b, array<'a>) => 'b
    ```

  Let us deconstruct the arguments one by one.

  This function has three input arguments,
    1. A reducer function
    2. An initial value for the accumulator
    3. The input array

  The output of the function is a single value which has the same type as
  the accumulator.

  In the above function the reducer (type annotated) function is,

    ```
    (acc: 'b, {count}: 'a): 'b => {
      acc + count
    }
    ```
  
  All it does is take destructure the `count` from the `metric` record
  value, and add it to the accumulator.

  The initial value of the accumulator is 0 (`'b`).

  The input has the type array<metric> (`array<'a>`).

  Let us trace the iterative execution:

    index | acc(input)  | {count} | (acc + count) returned 
    ------------------------------------------------------
      [0] |         0   |    2342 |       0 + 2342 = 2342
      [1] |      2342   |     745 |    2342 +  745 = 3087
      [2] |      3087   |     385 |    3087 + 385  = 3472
      [3] |      3472   |     621 |    3472 + 621  = 4093
      [4] |      4093   |     111 |    4093 + 111  = 4204
      [5] |      4204   |     770 |    4204 + 770  = 4974
    ------------------------------------------------------

  At the end of the execution the value in the accumulator is returned.

  The `reduce` function took an `array<metric>` values and aggregated it
  into a `int` value.

  The initial value for an accumulator depends on the type and operation
  being peformed. If you were multiplying the initial value of the
  accumulator should be `1`. If it was `0`, then the result returned
  will also be zero because of multiplication with zero.

  If the accumulator is a string type value, and you were concatenating
  string values, then the initial value could be an empty string.

  The initial value should be considered carefully depending on the type
  of aggregation you want to perform.
 */

/*
  -----------------------------------------------------------------------------
  Exercise 6
  -----------------------------------------------------------------------------
  Use `Js.Array.reduce` to generate table rows HTML string from the array
  `tableRows`.

  The tuple `("Java", "James Gosling")` gets transformed to the following
  HTML:

    <tr>
      <td>Java</td>
      <td>James Gosling</td>
    </tr>

  Notes:-
  
  1. Use 2 spaces for indentation.
  2. Save the result to the `tableRowsHTML` binding.

  Hint: If the tests are not passing even when the output is identical you
  may have a leading/trailing space in your output. Use `Js.String.trim` if
  necessary.

  This exercise can also be completed by using `Js.Array.map` and then joining
  the `array<string>` using `Js.Array.joinWith` function. But instead of that
  try to complete this exercise by using `Js.Array.reduce`.
  -----------------------------------------------------------------------------
 */

/*
  Uncomment the block below.
 */
/*
let tableRows = [("Java", "James Gosling"), ("C", "Dennis Ritchie")]
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
  ~msg="[exercise 6] Use `Js.Array.reduce` to generate table rows HTML",
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
