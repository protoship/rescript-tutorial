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

/*
  -----------------------------------------------------------------------------
  Exercise 1 (easy)
  -----------------------------------------------------------------------------
  Uncomment the `bookFormat` binding. Fix the compilation error.  
  -----------------------------------------------------------------------------
 */
// let bookFormat: bookFormat = HardCover

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

    Match the constructors to "Microsoft", "JetBrains" & "Apple"
  -----------------------------------------------------------------------------
*/

/*
SimpleTest.assertEqual(
  ~expected="Microsoft",
  ~actual=madeBy(VSCode),
  ~msg="[exercise 3(b)] VSCode is made by ___",
)
SimpleTest.assertEqual(
  ~expected="JetBrains",
  ~actual=madeBy(RubyMine),
  ~msg="[exercise 3(b)] RubyMine is made by ___",
)
SimpleTest.assertEqual(
  ~expected="Apple",
  ~actual=madeBy(XCode),
  ~msg="[exercise 3(b)] XCode is made by ___",
)
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
