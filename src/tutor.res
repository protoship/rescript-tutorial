/*
  Section 1: Bindings
 */

let hello: string = "Hello, World!"

/*
  This is known as a let-binding. It has the following form:

      let <binding-name>: <type> = <expression>

  The ReScript compiler will "type check" if the value on the right-hand side 
  matches the expected type. The code will fail to compile if there is a 
  mismatch.

  Other commonly used primitive types are:
    - `int` (32-bit integers), 
    - `float`,
    - `bool` (either `true` or `false`).

  -----------------------------------------------------------------------------
  Exercise 1 (easy)
  -----------------------------------------------------------------------------
  Change the type of `hello` to one of the other primitive types. 
  
  This will result in a compilation error because of type mismatch. Inspect 
  the compiler error message.
  
  Once you have understood the error message fix it by changing the annotated 
  type of `hello` back to `string`.
  -----------------------------------------------------------------------------

  Did you try changing the annotated type to either `int` or `float` in the
  exercise above?
  
  The compiler error message includes a contextual recommendation. It points
  you to a library function which can be used to convert a `string` to either
  `int` or `float` types.

  Did you misspell `string` as `sting` or `stirgn`?

  The compiler contains a rudimentary spell-checker which then provides you
  with a hint.

  Compiler errors do not have to scary, cryptic or difficult to understand.
  Fortunately this is a thing of the past, and most new languages and
  compiler authors understand the importance of better error messages. It
  definitely improves the developer experience.
 */

let goodbye = "Goodbye!"

/*
  You do not have to manually annotate the type for a binding. The ReScript
  compiler is able to infer the type correctly in most situations. This is
  the __type inference__ feature at work.

  If you are using a recommended editor with the rescript plugin you'll be
  able to hove over the binding to see the automatically inferred type.
  
  You'll see that the type of the binding `goodbye` is of `string`.

  -----------------------------------------------------------------------------
  Exercise 2 (easy)
  -----------------------------------------------------------------------------
  Change the type of `goodbye` to one of the other primitive types by adding
  a manual type annotation. 
  
  a) Hover over the `binding`. Is the type displayed the same as the manually
  annotated one?

  b) Hover over the red squiggly or wavy line under the value on the
  right-hands side. You can see the compilation error summarized by the
  plugin.

  Fix the compilation error by removing the manual annotation.
  -----------------------------------------------------------------------------

  The type of `goodbye` depends on the value on the right-hand side of the
  let-binding.
 */

let runningTotal = 1 * 1
// let runningTotal = 2 * 2
// let runningTotal = 3 * 3

/*
  -----------------------------------------------------------------------------
  Exercise 3 (easy)
  -----------------------------------------------------------------------------
  Uncomment the two bindings with the same name `runningTotal`. You will see 
  the compiler warning you about an unused variable. Modify the expression on
  the right-hand side to add the previous value of `runningTotal` to it. Doing
  this uses the binding and the compiler will not warn about an unused
  variable.
  -----------------------------------------------------------------------------

  The variables in ReScript are *immutable* by default. Once declared you
  cannot change its value through assignment.

  But you can *shadow* an existing binding by declaring it again.

  This may feel overly restrictive when you are used to programming in other
  languges where a variable is *mutable* by default. But what you are often
  trying to express are the intermediate steps of a computation.

  When you add the previous `runningTotal` value to get a new *immutable*
  value for `runningTotal`, you are representing the intermediate steps
  required to reach the final value of `runningTotal`. 
  
  The example above is trivial, but *immutable* by default prevents various
  latent bugs in your code. In other languages writing *immutable* code
  you incur a performance penalty. The ReScript compiler is able to perform
  smart optimizations under the hood, that the generated JavaScript code
  will not incur any performance penalty.

  ReScript is not a *pure* language like Haskell/Elm/PureScript. Even though
  *immutable* is the default, there is a different syntax for mutable
  expressions. You will learn more about that later in this tutorial.
 */

let sumOfInts = 1 + 2 + 3 + 4
let sumOfFloats = 1. +. 2.2 +. 3.14
let joinedStrings = "Hello, " ++ "World" ++ "!"

/*
  In the expressions above are adding together multiple integers, floats
  strings. Depending on the type of the values you can guess what the
  final value will be when the expression is evaluated.

  You will notice that in ReScript you use a different operator, when the
  type of the value changes. 
  
  To add integer values you use the `+` operator.
  To add float values you use the `+.` operator.
  To add string values you use the `++` operator.

  In object-oriented languages you will have experience writing
  expressions like:
  
    `1 + 2` 
    
  and 
  
    `"deep work" + " and " + "deliberate practice"`
  
  expecting them to just work. Those languages have support for a kind
  of polymorphism known as *ad-hoc polymorphism*. The operator `+` is
  polymorphic function which can be applied to arguments of different
  types. 
  
  Some of these languages may also allow you to overload the `+` 
  operator for your own custom types. You can use the same
  name with different types. They can act in totally different ways
  which is decided at compilation time, and it depends on the context -
  which is the types of the values being applied to that polymorphic
  function.

  Ad-hoc polymorphism is not a feature of the ReScript/OCaml type
  system.  

  The ReScript compiler can therefore recognize when the programmer
  makes a mistake in code. If you intended to add float type values
  but supplied an integer, you have to explicitly cast the integer
  to a float. This type of syntax may feel awkward when you get
  started, but without it you'll encounter subtle bugs which are
  difficult to track down.

  In the long run, these tiny details add up and have a compounding
  effect in writing programs which are safe - because once the code
  compiles the type checker guarantees that a class of errors simply
  do not exist in your code.  

  -----------------------------------------------------------------------------
  Exercise 4 (easy)
  -----------------------------------------------------------------------------
  Attempt mixing up the operators and the value types in the above bindings.
  For example, change an integer value to a float like this `1` -> `1.`. Try
  every combination you can.

  See if you can slip one past the ReScript type checker!

  Move on when you have convinced yourself that the ReScript compiler has got
  your back :)
  -----------------------------------------------------------------------------

  **Note regarding exercise 4**

  The ReScript compiler error messages will include hints on the `Belt`
  library functions like:
  
  - Belt.Float.toInt,
  - Belt.Int.toFloat,
  - Belt.Float.toString,
  - Belt.Int.toString to name a few...

  You can use these functions to explicitly convert a value from one type
  to another. But before you can use them in code, we need to learn a few
  other concepts. This will be covered later in the tutorial, and you will
  revisit these functions.
 */

let bookName = "Deep Work"
let tagline = "Rules for Focused Success in a Distracted World"

let book2 = {
  let bookName = "Real World OCaml"
  let tagline = "Functional programming for the masses"

  bookName ++ ": " ++ tagline
}

let book = bookName ++ ": " ++ tagline

/*
  A new block scope can be created by putting code within curly braces `{}`.

  The two bindings within `book2` shadow the bindings with the same name
  outside the block scope.

  What is the value of `book2`?

  The last expression within the block scope is evaluated and implicitly 
  returned. 
  
  In ReScript there is no explicit `return` keyword. It is always
  the final expression.

  -----------------------------------------------------------------------------
  Exercise 5 (easy)
  -----------------------------------------------------------------------------
  Try to answer for yourself:

  a) What is the value of `book`?
  b) What is the value of `book2`?
  c) When you remove the shadowed bindings inside the block scope what is the
  new value of `book2`?

  Hint: You can verify your answer by looking up `book` & `book2` in the 
  JavaScript generated by the ReScript compiler. It has the same filename
  as this file with the extension `.bs.js`
  -----------------------------------------------------------------------------
 */

let two = 2
// let sum2 = sum + three
// let sum = one + two
let one = 1
let three = 3

/*
  -----------------------------------------------------------------------------
  Exercise 6 (easy)
  -----------------------------------------------------------------------------
  Uncomment the bindings `sum` & `sum2`. 
  
  You'll spot the following compiler error: 
  
    **The value sum can't be found**

  Reorder the bindings to fix the compilation error.
  -----------------------------------------------------------------------------

  You may have guessed the nature of the problem in the code above.

  A let-binding cannot be used in an expression before it has been declared.

  So the order of bindings matters within a ReScript source file. It follows
  a top-bottom order.

  This makes it increasingly predictable when reading ReScript programs. You
  can always expect the binding to have been declared somewhere above before
  it is used in an expression.
 */

/*
  Section 2: Variants

  * Define a custom type
  * Construct values
  * transform 

  Pitfalls:
  * Confusing binding and type name

  Notes:
  * Types
 */

type bookFormat =
  | Hardcover
  | Paperback
  | KindleEdition
// | Audible

// let bookFormat: bookFormat = HardCover

/*
  -----------------------------------------------------------------------------
  Exercise 1 (easy)
  -----------------------------------------------------------------------------
  Uncomment the `bookFormat` binding. Fix the compilation error.  
  -----------------------------------------------------------------------------
 */

// let bookFormatToString = (x: bookFormat): string =>
let bookFormatToString = format =>
  switch format {
  | Hardcover => "Hardcover"
  | Paperback => "Paperback"
  | KindleEdition => "Kindle Edition"
  // | Audible => "Audible"
  }
/*
  TODO: explain function syntax with annotation for input arguments and
  the returned value

  TODO: introduction to pattern matching syntax on variants
  case analysis is exhaustive

  TODO: introduction to reading function type signatures 
        bookFormat => string
*/

bookFormatToString(Hardcover) == "Hardcover"
bookFormatToString(Paperback)
let bookFormat2 = bookFormatToString(KindleEdition)
/*
  TODO: explain function call-site / application

  TODO: hover for types
 */

let isElectronic = format =>
  switch format {
  | Hardcover
  | Paperback => false
  | KindleEdition => true
  // | Audible => true
  }

isElectronic(Hardcover)
isElectronic(KindleEdition)

/*
 Case analysis is exhaustive

  -----------------------------------------------------------------------------
  Exercise 2 (easy)
  -----------------------------------------------------------------------------
  Add a new constructor `Audible` for audio books from Audible.

  Follow compiler warnings, and handle the case for Audible. You'll need to
  fix the code in two functions for all the warnings to go away.
  -----------------------------------------------------------------------------

  TODO: Make exhaustive case analysis a compiler error (instead of warning)?


  -----------------------------------------------------------------------------
  Exercise 3 (easy)
  -----------------------------------------------------------------------------
  a) Create a variant type `codeEditor` with the constructors
    - VSCode
    - RubyMine
    - XCode

  b) Add the function with the type signature:

      `let madeBy: codeEditor => string`

    Match the constructors to "Microsoft", "Jetbrain" & "Apple"
  -----------------------------------------------------------------------------
*/

type player =
  | PlayerA
  | PlayerB
  | PlayerC

let nextMoveBy = current =>
  switch current {
  | PlayerA => PlayerB
  | PlayerB => PlayerC
  | PlayerC => PlayerA
  }

let firstMove = PlayerA
let secondMove = nextMoveBy(firstMove)
let thirdMove = nextMoveBy(secondMove)
/*
  -----------------------------------------------------------------------------
  Exercise 4 (easy)
  -----------------------------------------------------------------------------
  In a turn based game the moves rotate between three palyers in the 
  following order:

    A -> B -> C -> A -> B -> C

  Implement the function which returns the next player in the chain when
  given the current player,

    `let nextMoveBy: player => player`
  -----------------------------------------------------------------------------
*/

// Variant with constructor arguments

type user =
  | Anonymous
  | Guest(int)
  | LoggedInUser(int, string)
  | Moderator(int, string)

let displayName = user =>
  switch user {
  | Anonymous => "Anonymous"
  | Guest(guestId) => `Guest#${Belt.Int.toString(guestId)}`
  | LoggedInUser(karma, username)
  | Moderator(karma, username) =>
    `${username}, ${Belt.Int.toString(karma)} points`
  }

let anonymous = displayName(Anonymous)
let guest42 = displayName(Guest(42))
let milner1934 = displayName(LoggedInUser(2010, "Robin Milner"))
let grace1906 = displayName(Moderator(1992, "Grace Hopper"))

// --

type formInput =
  | Text(string) // name
  | Number(string, int, int) // name, min, max
  | Email(string)
  | Submit

let formInputToHTML = x =>
  switch x {
  | Text(name) => `<input type="text" name="${name}" />`
  | Number(name, min, max) =>
    `<input type="number" name="${name}" min="${Belt.Int.toString(min)} max="${Belt.Int.toString(
      max,
    )}"/>`
  | Email(name) => `<input type="email" name="${name}" />`
  | Submit => `<input type="submit" />`
  }

let nameInput = formInputToHTML(Text("name"))
let ageInput = formInputToHTML(Number("age", 18, 25))
let emailInput = formInputToHTML(Email("email"))
let submit = formInputToHTML(Submit)

// tuples
let (name, min, max) = ("age-limit", 18, 25)

// this can also be defined as a type
type numberFormInput = (string, int, int) // name, min, max

let ageLimit: numberFormInput = (name, min, max)
let budget: numberFormInput = ("price-range", 500, 1500)
let ratingFilter = ("rating-3-and-above", 3, 5)

// tuples are immutable
let (label, low, high) = budget
let budget2 = (label, low - 100, high + 1000)

// passing a tuple as an argument into the function

let toNumberFormHTML = (input: numberFormInput) => {
  let (name, min, max) = input
  `<input type="number" name="${name}" min="${Belt.Int.toString(min)}" max="${Belt.Int.toString(
    max,
  )}"`
}

// passing a tuple and destructing in the arguments
let toNumberFormHTML2 = ((name, min, max): numberFormInput) =>
  `<input type="number" name="${name}" min="${Belt.Int.toString(min)}" max="${Belt.Int.toString(
    max,
  )}"`

// tuples are positional
// give names to fields with record types
// records

type project = {
  name: string,
  url: string,
  repositories: int,
  people: int,
}

let atom = {name: "Atom", url: "https://atom.io", repositories: 255, people: 56}
let node = {name: "Node.js", url: "https://nodejs.org", repositories: 182, people: 375}
let rails = {name: "Ruby on Rails", url: "https://rubyonrails.org", repositories: 99, people: 66}

// destructuring record in parameters
let projectLink = ({url, name}) => {
  `<a href="${url}">${name}</a>`
}

projectLink(atom)
projectLink(node)
projectLink(rails)

// record where one of the field types is a variant type

type book = {title: string, tagline: string, format: bookFormat, availableInStock: int}

let codersAtWork = {
  title: "Coders at Work",
  tagline: "Reflections on the Craft of Programming",
  format: Paperback,
  availableInStock: 10,
}

let bookHTML = book => {
  let count = Belt.Int.toString(book.availableInStock)

  `<div>
    <h2>${book.title}: ${book.tagline}</h2>
    <p>${count} new ${bookFormatToString(
    book.format,
  )} avialable in stock</p>
  </div>`
}

bookHTML(codersAtWork)

// variant + record
// simple, not recursive
// does not requires lists/arrays

// composing variants & records
// for a drawing tool where the user can draw
// vector diagrams (excalidraw)
type fontSize =
  | Small
  | Medium
  | Large
  | VeryLarge

type fontFamily =
  | Serif
  | SansSerif
  | Monospace

type simpleShape =
  | Rectangle(int, int, int, int) // x, y, w, h,
  | Line(int, int, int) // x, y, length
  | Text(fontSize, fontFamily, string)

type rectangle = {x: int, y: int, width: int, height: int}
type line = {x: int, y: int, length: int}
type text = {text: string, fontSize: fontSize, fontFamily: fontFamily}

// refactor `simpleShape` to use records
type shape =
  | Rectangle(rectangle)
  | Line(line)
  | Text(text)

// functions for rendering shapes

// rectangle => unit
// explain unit
// what is a side-effect?
// unit is a primitive type
// signalling side-effects through the type system
// explain the underscore prefix
// maybe this should be introduced earlier in the bindings section
let drawRectangle = (_rectangle: rectangle) => {
  // pretend to draw a rectangle at (x, y) which width x height pixels
  ()
}

let drawLine = (_line: line) => {
  // pretend to draw a line at (x, y) with length pixels
  ()
}

let drawText = (_text: text) => {
  // pretend to render text
  ()
}

// construct values
let block1 = Rectangle({x: 100, y: 100, width: 50, height: 50})
let block2 = Rectangle({x: 200, y: 100, width: 50, height: 50})
let block1ToBlock2 = Line({x: 150, y: 125, length: 50})
let textLabel = Text({text: "Connect", fontSize: Medium, fontFamily: Monospace})

// type narrowing - after pattern matching call the draw for shape
// common mistake is to pattern match within the draw function
// point out this anti-pattern
// don't pattern match inside drawRectangle on `shape`
// the `rectangle` constructor argument has already been narrowed
let drawShape = shape =>
  switch shape {
  | Rectangle(rectangle) => drawRectangle(rectangle)
  | Line(line) => drawLine(line)
  | Text(text) => drawText(text)
  }

/*
  Section 3: Parametric Polymorphism
 */

// intro to parametric polymorophism
type pair<'a> = ('a, 'a)

// the right-hand can also be a record
// with the fields first, and second
// but a tuple is more convenient because
// we are dealing with this type
// positionally.

type coord2d = pair<int>
let center: coord2d = (960, 540)

type name = pair<string>
let leroy: name = ("Xavier", "Leroy")

type cssDeclaration = pair<string>
let mediumFontSize: cssDeclaration = ("font-size", "16px")

// write generic functions first, and second
// this should be an exercise
let first = ((x, _): pair<'a>) => x
let second = ((_, y): pair<'a>) => y

// call sites
first(center)
first(leroy)
first(mediumFontSize)

second(center)
second(leroy)
second(mediumFontSize)

// using types like lego bricks to compose more complex
// types from simple types
type lineSegment = pair<coord2d>
let lineFromOrigin: lineSegment = ((0, 0), (100, 100))

let lineStart = first(lineFromOrigin)
let (lineStartX, listStartY) = (first(lineStart), second(lineStart))

let lineEnd = second(lineFromOrigin)
let (lineEndX, lineEndY) = (first(lineEnd), second(lineEnd))

// parametric polymorphism enables building container types
// the concrete type is only determined when it is used
// polymorphic on the type variable
// ability to create functions which does not need to know
// what those concrete types are
// the functions are acting on polymorphic types
// because they lack knowledge of the concrete type
// the ability to introduce defects in polymorphic type functions
// is limited. The function simply doesn't know the domain of
// concrete type to contain a domain defect

// The container can only contain values which are defined
// by the type variable. You cannot put a coordinate inside
// a pair<name> or vice versa. The containers are guaranteed
// to contain homogenous data structures. This is often not
// consciously considered or forced in dynamic languages.
// Heteregenous collection of values, are a common source
// of defects. The functions acting on them also leak domain
// information, and adding the number of places code has to
// change when something about the applications domain changes
// We also lose the ability to reason about the functions
// as a black box. In the functions `first` or `second` you
// have this reasoning ability. It does not matter what
// the final concrete type variable will be substituted as
// but you know these functions will always work regardless
// of the domain of those types.

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

type progLangCreator = pair<string>

let progLangCreators: array<progLangCreator> = [
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

let arrayLength = Js.Array.length(progLangCreators)

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
let progLangCreatorToString = ((language, creator): progLangCreator): string =>
  language ++ ": " ++ creator

Js.Array.map(x => x, progLangCreators) // identity
Js.Array.map(progLangCreatorToString, progLangCreators)

// exercise - map progLangCreator tuple to a record type(below)
type programmingLanguage = {name: string, creator: string}
// exercise - array of languages, lowercase string
// exercise - array of creators
// from above record type

// filter - languages that start with the letter p
Js.Array.filter(x => {
  let (language, _) = x
  Js.String.startsWith("P", language)
}, progLangCreators)
// exercise - provide array of compiled languages
// create array of dynamic languages

// demonstrate fold with a simple example
type metric = {state: string, count: int}

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

// reduce / fold
// exercise
//
/*
  Transform the value,

  ("Java", "James Gosling") 

  into the table row html

  <tr>
    <td>Java</td>
    <td>James Gosling</td>
  </tr>

  Reduce/Fold the list of language creators to create a table,

  the table header is,

  <tr>
    <th>Programming Langauge</th>
    <th>Creator</th>
  </tr>


  final output:

  <table>
    <tr>
      <th>Programming Langauge</th>
      <th>Creator</th>
    </tr>
    <tr>
      <td>Java</td>
      <td>James Gosling</td>
    </tr>
    ...
  </table>
*/

// list
// map, filter
// pattern matching
// immutable
// fast prepend
// fast tail
let dailyRecovered: list<metric> = list{mh, ka, dl, wb, jh, tn}

type displayMetric = pair<string>

// TODO
// data first vs data last
let toDisplayMetric = (metric: metric): displayMetric => (
  metric.state,
  Belt.Int.toString(metric.count),
)

let convertedMetrics = Belt.List.map(dailyRecovered, toDisplayMetric)

// recovered over 500 or more
let filteredMetrics = Belt.List.keep(dailyRecovered, ({count}) => count >= 500)

// reduce
let totalRecovered2 = Belt.List.reduce(dailyRecovered, 0, (acc, {count}) => acc + count)

// custom map implementation using reduce
// exercises to implement map & filter
// implementing iter can be done after introducing unit later
let myCustomMap = (xs: list<'a>, f: 'a => 'b): list<'b> =>
  Belt.List.reduce(xs, list{}, (acc, x) => list{f(x), ...acc})->Belt.List.reverse

// pattern matching
let myCustomFilter = (xs, f: 'a => bool): list<'a> => Belt.List.reduce(xs, list{}, (acc, x) =>
    if f(x) {
      list{f(x), ...acc}
    } else {
      acc
    }
  )->Belt.List.reverse

// pattern matching
// case 1: list is empty
// case 2: head, and tail
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

// confusing at first!
// why is the inferred type 'a
// The constructor does not have arguments
// becaues it is the None constructor
// only the Some constructor uses the 'a argument
// so the concrete type is not know here
// type checker infers the principal type
// that means the most general purpose type which is
// applicable here.
let nothing = None
// You can always manually annotate to force a specialized
// type. Often this is not necessary in application code
// because the evaluation context would have enough
// information to infer the type. But if that does not
// happen, then you can fallback to manually annotating
// the type
let nothing2: option<int> = None

let whatNumberAmIThinking = (myNumber: option<int>) =>
  switch myNumber {
  | None => "I'm not thinking of any number!"
  | Some(number) => "My number is: " ++ string_of_int(number)
  }

assert (whatNumberAmIThinking(None) == "I'm not thinking of any number!")
assert (whatNumberAmIThinking(Some(7)) == "My number is: 7")

/*
  Implement the function [safeDivide(~dividend, ~divisor)], which takes two
  ints and returns an int option. It should return None if [divisor = 0], and
  otherwise returns [Some(x)] where [x] is the division result
 */
let safeDivide = (~dividend, ~divisor) => Some(dividend / divisor)

// pattern matching - simple example
let bukowski = Some("If you're going to try, go all the way...")
let printMessage = message =>
  switch message {
  | None => "The message is empty"
  | Some(x) => x
  }

printMessage(bukowski)

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

let mapOption = (f, opt) =>
  switch opt {
  | None => None
  | Some(i) => Some(f(i))
  }

let double = i => 2 * i

let () = assert (mapOption(double, None) == None)

let () = assert (mapOption(double, Some(2)) == Some(4))

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

assert (Belt.Option.map(None, double) == None)
assert (Belt.Option.map(Some(2), double) == Some(4))

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

// with depth debugging
let renderHTML = html => {
  let rec aux = (depth, x) =>
    switch x {
    | Division(children) =>
      // Js.log("Division => " ++ Belt.Int.toString(depth))
      let intermediate = Belt.Array.map(children, aux(depth + 1))
      let innerHTML = Js.Array.joinWith("\n", intermediate)
      `${Js.String.repeat(depth * 2, " ")}<div>\n${innerHTML}\n${Js.String.repeat(
        depth * 2,
        " ",
      )}</div>`
    | Heading(children) =>
      // Js.log("Heading => " ++ Belt.Int.toString(depth))
      let intermediate = Belt.Array.map(children, aux(depth + 1))
      let innerHTML = Js.Array.joinWith("\n", intermediate)
      `${Js.String.repeat(depth * 2, " ")}<h1>\n${innerHTML}\n${Js.String.repeat(
        depth * 2,
        " ",
      )}</h1>`
    | Paragraph(text) =>
      // Js.log("Paragraph => " ++ Belt.Int.toString(depth))
      Js.String.repeat(depth * 2, " ") ++ paragraphToHTML(text)
    | Anchor(href, displayText) =>
      // Js.log("Anchor => " ++ Belt.Int.toString(depth))
      Js.String.repeat(depth * 2, " ") ++ anchorToHTML(href, displayText)
    }

  aux(0, html)
}

Js.log(renderHTML(exampleHTML))

// functional programming
// currying, partial applications
// functions as arguments
// higher order functions
// pipeline -> |>

// side-effects
// Js.log
// bindings, JS interop
// JSON
// Promises
// Belt / Stdlib

// modules
// module interfaces
// module types
