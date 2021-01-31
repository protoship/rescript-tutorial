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
  Uncomment the block below.
 */
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

/*
  The list<'a> is single linked-list. It is an immutable data structure.

  Hover over `statewiseMetrics` to see its type. It will be `list<metric>`.  
 */

/*
  Uncomment the line below.
 */
// let statewiseMetrics = list{mh, ka, dl, wb, jh, tn}

/*
  You can prepend a value to to create a new list using the spread
  syntax. This is an immutable operation.
 */

/*
  Uncomment the block below.
 */
/*
let gj = {state: "Gujarat", count: 500}
let statewiseMetrics2 = list{gj, ...statewiseMetrics}
*/

/*
 You can reverse a list like this.
 */

/*
  Uncomment the line below.
 */
// let reversed = statewiseMetrics2->Belt.List.reverse

/*
  -----------------------------------------------------------------------------
  Exercise 8
  -----------------------------------------------------------------------------
  Implement a custom `map` & `filter` function for list values:

    myCustomMap: (list<'a>, 'a => 'b) => list<'b>
    myCustomFilter: (list<'a>, 'a => bool) => list<'a>

  Hint: You can implement `map` & `filter` using `Belt.List.reduce`. 
        
  The function `Belt.List.reduce` has the following type signature:

    ```
    let reduce: (list<'a>, 'b, ('b, 'a) => 'b) => 'b
    ```
  -----------------------------------------------------------------------------
 */

/*
  -----------------------------------------------------------------------------
  Exercise 9
  -----------------------------------------------------------------------------
  Use your custom functions for map, filter to test this pipeline:

    ```
    statewiseMetrics
    ->myCustomFilter(x => x.count > 500)
    ->myCustomMap(({state, count}) => `${state}: ${count->Belt.Int.toString}`)
    ->Belt.List.forEach(Js.log)
    ```
  
  If your implementation is correct you should see the following being
  logged to console,

    Maharasthra: 2342
    Karnataka: 745
    West Bengal: 621
    Tamil Nadu: 770
  -----------------------------------------------------------------------------
 */

/*
  Uncomment the block below.
 */
/*
statewiseMetrics
->myCustomFilter(x => x.count > 500)
->myCustomMap(({state, count}) => `${state}: ${count->Belt.Int.toString}`)
->Belt.List.forEach(Js.log)
*/

/*
  You can also pattern-match on lists.

  A list can be an empty. So exhaustive pattern-matching in lists includes
  at least two cases. The empty list, and the list with at least one value
  in it.

  The second pattern-match uses the list spread syntax,

    ```
    list{head, ...rest}
    ```

  to destructure the first value into `head` and the remaining items into
  the `rest` binding.
 */
/*
  Uncomment the block below.
 */
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

// This list is empty
describeList(list{})

// The first item in this list is: alone and there are other 0 items.
describeList(list{"alone"})

// The first item in this list is: hello and there are other 3 items.
describeList(list{"hello", "world", "good", "bye"})
*/

/*
  -----------------------------------------------------------------------------
  Null References: The Billion Dollar Mistake - Tony Hoare
  -----------------------------------------------------------------------------
  The null reference was invented in 1965 in the Algol W language designed by
  Tony Hoare & Niklaus Wirth. 
  
  Historically this turned out to be a bad idea. The programming languages
  which came later adopted the same design. It led to numerous errors in
  programming, and easily exploitable vulnerabilities in software.
  
  After 40 years since the invention Hoare estimates the problems caused by
  null references would exceed a billion dollars.

  This goes on to also show the difficulty of programming languge design.
  -----------------------------------------------------------------------------

  Earlier it was mentioned that the JS API would raise expcetions when it
  enters invalid states. But the Belt API does not raise any exceptions.

  You cannot know through the type that a function will raise an exception.
  It is something you can know only at runtime. But with experience you
  will notice that certain APIs have to raise an exception. For example
  you want to get an array value at a certain index. The API you design
  would be to get the array, and the index as input and return the value
  at that index.

  The edge case is when you get an invalid index. How should your function
  behave in this situation? Do you return null? Do you raise a runtime
  exception? These are your choices.

  ReScript does not have either `null` or `undefined` values which are
  available in JavaScript.

  But the idea of a value which does not exist is useful thing to express
  in code. It would be even better if this could be captured by the type
  system.

  The solution we have in ReScript is the `option<'a>` type.

    ```
    type option<'a> = None | Some<'a>
    ```

  It is a variant with two constructors. The `None` constructor represents
  idea of nothing, or no value is present. The `Some<'a>` represents a
  value which is available.

  The type signature for the array function to get a value at an index
  can then be encoded in the type like this:

    ```
    let arrayGet: (array<'a>, int) => option<'a>
    ```

  When you see function type signatures which returns an `option<'a>`
  value, it is immediately understood that the API may not always be
  able to return a valid value for all possible inputs.

  This is much better approach than the default of having to raise
  exceptions. It is also not good program design to use exceptions for
  control flow.
*/

/*
  The `userInputToKey` function takes keyboard input and maps it to
  a set of valid `key`.

    ```
    let userInputToKey: string => option<key>
    ```

  The underscore pattern-match is to ignore any string input we do
  not care about. It is alright to use this with an infinite sequence
  like string values. But using the underscore pattern-match syntax
  with a variant you lose the benefit of exhaustive case-analysis.

  If you have the underscore pattern-match in your function and later
  you add a new case, the compiler will skip this function. And this
  could hide a defect. So do not use it with pattern-matching for
  variants.
*/

/*
  Uncomment the block below.
 */
/*
type key =
  | Up
  | Down
  | Right
  | Left
  | Escape
  | Space

let userInputToKey = keypress =>
  switch keypress {
  | "up" => Some(Up)
  | "down" => Some(Down)
  | "right" => Some(Right)
  | "left" => Some(Left)
  | "escape" => Some(Escape)
  | "space" => Some(Space)
  | _ => None
  }

userInputToKey("1234") // None
userInputToKey("escape") // Some(Escape)
*/

/*
  You can pattern-match an option value like any other variant.

  The `printMessage` takes a message and returns a message or
  returns a default value - "This message is empty"
 */

/*
  Uncomment the block below.
 */
/*
let printMessage = message =>
  switch message {
  | None => "This message is empty"
  | Some(x) => x
  }

let bukowski = `If you’re going to try, go all the way.
Otherwise, don’t even start.
If you're going to try, go all the way.
This could mean losing girlfriends, wives, relatives, jobs and maybe even your mind.
It could mean not eating for three or four days.
It could mean freezing on a park bench.
It could mean jail.
It could mean derision, mockery, isolation.
Isolation is the gift.
All the others are a test of your endurance, of how much you really want to do it.
And, you’ll do it, despite rejection and the worst odds.
And it will be better than anything else you can imagine.
If you’re going to try, go all the way.
There is no other feeling like that.
You will be alone with the gods, and the nights will flame with fire.
DO IT. DO IT. DO IT. All the way
You will ride life straight to perfect laughter. It’s the only good fight there is`

printMessage(Some(bukowski))
printMessage(None)
*/

/*
  Earlier we used `map` for arrays & list values. An input function was iteratively
  applied to each value. The newly minted values are then returned a new array or
  list.

  Similarly we can use `map` for the option type. An option has two possible values.
  Either there is a value: `Some(x)` or there is nothing: `None`.

  When you write a function to operate on an option type value, it is natural to
  pattern match on option. But if you needed the same functionality for a non-option
  value, you would have to rewrite the same function again. Let us see how this
  can be avoided with the following example.

  The `repeatTwice` takes an `option<string>` and returns an `option<string>`. Given
  an `array<option<string>>` values we can use `Belt.Array.map` to create a new
  array where the messages are repeated twice, and the `None` values are left as
  they are.
 */

/*
  Uncomment the block below.
 */
/*
let repeatTwice = x =>
  switch x {
  | Some(text) => Some(Js.String.repeat(2, text))
  | None => None
  }

let messages = [Some("hello"), Some("world"), None, None, Some("goodbye")]

// [Some("hellohello"), Some("worldworld"), None, None, Some("goodbyegoodbye")]
messages->Belt.Array.map(repeatTwice)
*/

/*
  The `repeatTwiceZeroKnowledge` function does not pattern match an option
  value. It is a regular `string => string` function.

  The `Belt.Option.map` function can take this function as input. The `map`
  function invokes the function only when there is `Some(text)` value. The
  function is not invoked for `None` values.

  If you look at the implementation of `repeatTwice` above, this is exactly
  what is written there. The None value passes through without any further
  computation. Only `Some(text)` invokes the repeat function.

  The `Belt.Option.map` takes the value returned by `repeatTwiceZeroKnowledge`
  and wraps it in `Some(returnedValue)`.

    ```
    // Some("hellohello")
    Some("hello")->Belt.Option.map(repeatTwiceZeroKnowledge)

    // None
    None->Belt.Option.map(repeatTwiceZeroKnowledge)
    ```
 */

/*
  Uncomment the block below.
 */
/*
let repeatTwiceZeroKnowledge = text => Js.String.repeat(2, text)

// [Some("hellohello"), Some("worldworld"), None, None, Some("goodbyegoodbye")]
messages->Belt.Array.map(x => x->Belt.Option.map(repeatTwiceZeroKnowledge))
*/
