type bookFormat =
  | Hardcover
  | Paperback
  | KindleEdition

/*
  The `bookFormat` is a **variant** data type. 
  
  It has 3 fixed constructors separated by `|`. Each of the constructor
  represents a valid value for the type `bookFormat`. A constructor should 
  always be capitalized. The code will fail to compile otherwise.
 */

/*
  Uncomment the block below.
 */
/*
let paperback = Paperback
let kindleEdition = KindleEdition
*/

/*
  The binding can refer to only a single constructor value at any time.
  You cannot have a binding which is both `Paperback` & `KindleEdition`
  simultaneously. Hover over the bindings to see the inferred type.

  You may have also noticed that the type defintion by itself does not 
  generate any JavaScript. The compiler generates JavaScript only when
  you use the constructor values in code. 
  
  A common source of confusion when you are beginning is to confuse
  between a type defintion and values. 
  
  The `type` is for defining your custom data structure type. A value is
  an instance of either a primitive type, or a custom defined type.

  Here `bookFormat` is a variant type. The `paperback` & `kindleEdition`
  are bindings which represents values of this variant type.

  Even though the type is named `bookFormat`, it does not prevent you
  from creating a let-binding with the same name.
 */

/*
  -----------------------------------------------------------------------------
  Exercise 1
  -----------------------------------------------------------------------------
  The binding named `bookFormat` belongs to the variant type `bookFormat`.

  Fix the compilation error to proceed.
  -----------------------------------------------------------------------------
 */

/*
  Uncomment the line below.
 */
// let bookFormat: bookFormat = HardCover

/*
  The `bookFormatToString` function has the following type signature:

    ```
    let bookFormatToString: bookFormat => string
    ```

  You can hover over `bookFormatToString` to see the type signature.
  
  The function does pattern-matching on the constructors of the variant
  data type `bookFormat`. Since there are three fixed constructors, there
  are three cases to be handled in the pattern-matching.

  The string conversion function returns a value of type `string`. So all
  three branches of pattern-matching should return a `string` type value
  on the right-hand side. The code will fail to compile otherwise. Try
  changing one the string values on the right-hand side to an int to
  see the compilation error.

  Say if you remove or comment out one of the branches like `Paperback`,
  the compiler will issue a warning. It will inform you that you forgot
  to handle the `Paperback` case. The compiler helps you eliminate a
  common source of bug in programming - forgetting to handle a case in
  code.

  In real world projects it is considered a good practice to configure
  the compiler to elevate this warning to a compilation error. Warnings
  can be ignored. But you cannot check-in code with a compilation error.
  You most definitely don't want to check-in code which forgets to handle
  a case in pattern-matching.

  The compiler exhaustively checks if you have handled all the cases in
  pattern-matching.
*/

/*
  Uncomment the block below.
 */
/*
let bookFormatToString = format =>
  switch format {
  | Hardcover => "Hardcover"
  | Paperback => "Paperback"
  | KindleEdition => "Kindle Edition"
  }

bookFormatToString(Hardcover) // "Hardcover"
bookFormatToString(Paperback) // "Paperback"
bookFormatToString(KindleEdition) // "Kindle Edition"
*/

/*
  You can write functions which transforms a value from one type to
  another type.

  The `isElectronic` function has the following type signature:

    ```
    let isElectronic: bookFormat => bool
    ```

  If you need to return the identical expression for multiple branches
  you can combine them on the right-hand side. It does not have to be
  repeated multiple times. 
  
  Both the `Hardcover` & `Paperback` branches returns `false`.
 */

/*
  Uncomment the block below.
 */
/*
let isElectronic = format =>
  switch format {
  | Hardcover
  | Paperback => false
  | KindleEdition => true
  }

isElectronic(Hardcover) // false
isElectronic(Paperback) // false
isElectronic(KindleEdition) // true
*/

/*
  The value of exhaustive pattern matching becomes evident when the time comes
  to extend your code. You can go into autopilot mode, and allow the compiler
  to guide you through all the places in code where you need handle the newly
  added case.

  -----------------------------------------------------------------------------
  Exercise 2
  -----------------------------------------------------------------------------
  Add a new constructor `Audible` to `bookFormat`.

  Follow compiler warnings, and handle the case for `Audible`. Repeat until
  there are zero compiler warnings remaining.

  Uncomment the tests below to verify your changes are correct.
  -----------------------------------------------------------------------------
*/

/*
  Uncomment the block below. It contains test code for exercise 2.
 */
/*
SimpleTest.assertEqual(
  ~expected="Audible",
  ~actual=bookFormatToString(Audible),
  ~msg="[exercise 2] convert Audible constructor to string value",
)
SimpleTest.assertEqual(
  ~expected=true,
  ~actual=isElectronic(Audible),
  ~msg="[exercise 2] Audible is an electronic format",
)
*/

/*
  -----------------------------------------------------------------------------
  Exercise 3
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
  Uncomment the block below. It contains test code for exercise 3.
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

/*
  -----------------------------------------------------------------------------
  Exercise 4
  -----------------------------------------------------------------------------
  In a turn based game the moves rotate between three palyers in the 
  following order:

    A -> B -> C -> A -> B -> C

  Implement the function which returns the next player in the chain when
  given the current player,

    `let nextMoveAfter: player => player`
  -----------------------------------------------------------------------------
*/

/*
  Uncomment the block below. It contains test code for exercise 4.
 */

/*
let nextMoveAfter = current => current

let playerToString = player =>
  switch player {
  | PlayerA => "Player A"
  | PlayerB => "Player B"
  | PlayerC => "Player C"
  }

SimpleTest.assertEqual(
  ~expected=playerToString(PlayerB),
  ~actual=playerToString(nextMoveAfter(PlayerA)),
  ~msg="[exercise 4] A -> B",
)
SimpleTest.assertEqual(
  ~expected=playerToString(PlayerC),
  ~actual=playerToString(nextMoveAfter(PlayerB)),
  ~msg="[exercise 4] B -> C",
)
SimpleTest.assertEqual(
  ~expected=playerToString(PlayerA),
  ~actual=playerToString(nextMoveAfter(PlayerC)),
  ~msg="[exercise 4] C -> A",
)
 */

type user =
  | Anonymous
  | Guest(int)
  | LoggedInUser(int, string)
  | Moderator(int, string)

/*
  The variant type `user` has constructors with additional arguments.

  The value `Guest(100)` is a valid value belonging to the `user` variant
  type defined by the constructor `Guest(int)`. The types match.

  But a value like `Guest` or `Guest("Sam")` are illegal. They do not match
  the type of the arguments in the constructor.

  Additional values can be added to a constructor separated by a comma.

  The `LoggedInUser(int, string)` has two arguments. The first argument is
  of type `int` and the second argument is of type `string`.

  The `userDescription` function takes a value of the variant type `user`
  and returns a `string` description. The pattern-matching on the left-hand
  side binds the constructor arguments to names. The bindings are available
  for use in expressions on the right-hand side.

  The first argument `LoggedInUser(int, string)` and `Moderator(int, string)`
  are both `int` type values. It is bound to the name `karma`. This represents
  the karma (or points) accumulated by a user through their contributions.

  The `Guest(int)` constructor also has a `int` type value, but it has a
  different meaning in this context. The `int` value here represents some
  random number assigned to guest users.

  You can use the variant type to model data structures with disjoint values.
  The individual values can be also contextualized through additional 
  arguments in the constructor.

  In this example we are able to represent an anonymous user, guest users,
  logged in users, and moderators. They all belong to the same type `user`.
  There is no opportunity for you to get confused between values belonging
  to different constructors.
 */

/*
  Uncomment the block below.
 */

/*
let userDescription = user =>
  switch user {
  | Anonymous => "Anonymous"
  | Guest(guestId) => `Guest#${Belt.Int.toString(guestId)}`
  | LoggedInUser(karma, displayName) => `${displayName}, ${Belt.Int.toString(karma)} points`
  | Moderator(karma, displayName) => `(mod) ${displayName}, ${Belt.Int.toString(karma)} points`
  }

userDescription(Anonymous) // "Anonymous"
userDescription(Guest(42)) // "Guest#42"
userDescription(LoggedInUser(2010, "Robin Milner")) // "Robin Milner, 2010 points"
userDescription(Moderator(1992, "Grace Hopper")) // "(mod) Grace Hopper, 1992 points"
 */

type formInput =
  | Text(string) // name
  | Number(string, int, int) // name, min, max
  | Email(string)
  | Submit

/*
  -----------------------------------------------------------------------------
  Exercise 5
  -----------------------------------------------------------------------------
  Generate the HTML string for a given form input in the below formats.

  Text("first_name")    => <input type="text" name="first_name" />
  Number("age", 18, 25) => <input type="number" name="age" min=18 max=25 />
  Email("work_email")   => <input type="email" name="work_email" />
  Submit                => <input type="submit" />

  Implement the function `formInputToHTML`:

    ```
    let formInputToHTML: formInput => string
    ```
  -----------------------------------------------------------------------------
*/

/*
  Uncomment the block below. It contains test code for exercise 5.
 */
/*
let formInputToHTML = formInput => `<input type="submit" />`

SimpleTest.assertEqual(
  ~expected=`<input type="text" name="first_name" />`,
  ~actual=formInputToHTML(Text("first_name")),
  ~msg="[exercise 5] text input for entering first name",
)
SimpleTest.assertEqual(
  ~expected=`<input type="number" name="tickets" min=0 max=5/>`,
  ~actual=formInputToHTML(Number("tickets", 0, 5)),
  ~msg="[exercise 5] input for buying upto 5 tickets",
)
SimpleTest.assertEqual(
  ~expected=`<input type="email" name="work_email" />`,
  ~actual=formInputToHTML(Email("work_email")),
  ~msg="[exercise 5] email input for entering work email",
)
SimpleTest.assertEqual(
  ~expected=`<input type="submit" />`,
  ~actual=formInputToHTML(Submit),
  ~msg="[exercise 5] a submit button",
)
 */

/*
  The **tuple** is a immutable data structure. It can contain different 
  types of values.

  You can create a tuple value without having to define a type for it.
 */

/*
  Uncomment the line below.
 */
// let numberFormInput = ("age-limit", 18, 25)

/*
  The inferred type of numberFormInput is `(string, int, int)`. Hover
  over `numberFormInput` binding to see the type.

  You can **destructure* a tuple value into separate bindings using
  pattern matching syntax in the let binding. Hover over the individual
  bindings below to see the types for `name`, `min` & `max`.
 */

/*
  Uncomment the block below.
 */
/*
let (name, min, max) = ("age-limit", 18, 25)
let ageLimit = (name, min, max)
*/

/*
  Since tuples are immutable, you cannot use mutation to update a tuple
  value.

  You can destructure a tuple, and use the individual values to create
  a new tuple.

  This is the essence of immutability. No mutation. You construct a 
  new value from an existing value. There is no in-place update which
  is possible on immutable values.
 */

/*
  Uncomment the block below.
 */
/*
let budget = ("price-range", 500, 1500)
let (label, low, high) = budget
let budget2 = (label, low - 100, high + 1000)
*/

/*
  Just like any other value, you can pass a tuple as an argument to a
  function.
 */

/*
  Uncomment the block below.
 */
/*
let toNumberFormHTML = input => {
  let (name, min, max) = input
  `<input type="number" name="${name}" min="${Belt.Int.toString(min)}" max="${Belt.Int.toString(
    max,
  )}"`
}
*/

/*
  Alternatively you can destructure the tuple in place in the arguments 
  of the function itself.

  **Caution**

  The destructured tuple has parenthesis around it:
  
     `... = ( (name, min, max) ) => ...`
  
  The type signature of the function `toNumberFormHTML` is:

    ```
    ( (string, int, int) ) => string
    ```
  
  This means the function takes a tuple with 3 values as input and 
  produces a `string` type value as output.

  It is easy to confuse this with a type signature like:

    ```
    (string, int, int) => string
    ```

  The above signature means the functions take 3 separate arguments
  of type `string`, `int` & `int` and then produces a `string` type
  value as output.

  Do not forget the paranthesis when destructuring tuples in function
  arguments.
 */

/*
  Uncomment the block below.
 */
/*
let toNumberFormHTML2 = ((name, min, max)) =>
  `<input type="number" name="${name}" min="${Belt.Int.toString(min)}" max="${Belt.Int.toString(
    max,
  )}"`
*/

/*
  Tuples values have a fixed order when they are created. Tuples are
  positional.

  There is a recurring concern when it comes to dealing with positional
  values. You end up identifying them by position, rather than by a name.
  This is similar to functions with positional arguments.

  The readability improves when you start labelling the arguments to a
  function. There are less chances of confusing the order of arguments
  or values when they share the same type.

  This brings us to **record** types.

  In a record type we can define the name for the individual fields of
  values.

  Like tuples, record values are also **immutable**.
 */

type project = {
  name: string,
  url: string,
  repositories: int,
  people: int,
}

/*
  Type definitions will not generate any JavaScript code in the compiled
  output.

  Below you will find three bindings whose compiler inferred type belongs
  to the record type `project`. Hover over the bindings to see it.
*/

/*
  Uncomment the block below.
 */
/*
let atom = {name: "Atom", url: "https://atom.io", repositories: 255, people: 56}
let node = {name: "Node.js", url: "https://nodejs.org", repositories: 182, people: 375}
let rails = {name: "Ruby on Rails", url: "https://rubyonrails.org", repositories: 99, people: 66}
 */

/*
  Just like tuples, the record values can be destructured into the field
  names defined by its type.

  You can perform this destructuring in the function argument itself.

  In the function `projectLinkHTML` the fields `url` & `name` belonging
  to the `project` record type are destructured.

  The type signature of the function is:

    ```
    let projectLinkHTML: project => string
    ```
 */

/*
  Uncomment the block below.
 */
/*
let projectLinkHTML = ({url, name}) => {
  `<a href="${url}">${name}</a>`
}

projectLinkHTML(atom) // <a href="https://atom.io">Atom</a>
projectLinkHTML(node) // <a href="https://nodejs.org">Node.js</a>
projectLinkHTML(rails) // <a href="https://rubyonrails.org">Ruby on Rails</a>
*/

/*
  You can also pass the record without destructuring. In this case
  you can access the fields using the dot operator.

    ```
    atom.name           // Atom
    atom.url            // https://atom.io
    atom.repositories   // 255
    atom.people         // 56
    ```
*/

/*
  Uncomment the block below.
 */
/*
let projectLinkHTML2 = project => {
  `<a href="${project.url}">${project.name}</a>`
}
*/

/*
  So far you have learned about the following types,

  - Primitive types
    - int
    - float
    - bool
    - string
    - char
    - unit
  - Custom types defined by you
    - Variants
    - Tuples
    - Records

  When combined together you can construct complex data structures which
  best fit & describe your programs. For example, see the `book` record
  type defined below. The `format` field is not a primitive type. It is
  the `bookFormat` variant which was defined in the beginning.  
 */

type book = {title: string, tagline: string, format: bookFormat, availableInStock: int}

/*
  Uncomment the block below.
 */
/*
let codersAtWork = {
  title: "Coders at Work",
  tagline: "Reflections on the Craft of Programming",
  format: Paperback,
  availableInStock: 10,
}
 */

/*
  -----------------------------------------------------------------------------
  Exercise 6
  -----------------------------------------------------------------------------
  Implement the function: 
  
    let bookToHTML: book => string

  Generate the HTML string for a book like this:

    <div>
      <h2>Coders at Work: Reflections on the Craft of Programming</h2>
      <p>10 new Paperback avialable in stock</p>
    </div>

  Notes:
    1. You will need the `bookFormatToString` function defined earlier.
    2. Use the `Belt.Int.toString` function to convert an `int` to a 
      `string` value.
  -----------------------------------------------------------------------------
*/

/*
  Uncomment the block below. It contains test code for exercise 6.
 */
/*
let bookToHTML = book => ""

let expectedBookHTML = `<div>
    <h2>Coders at Work: Reflections on the Craft of Programming</h2>
    <p>10 new Paperback avialable in stock</p>
</div>`
SimpleTest.assertEqual(
  ~expected=expectedBookHTML,
  ~actual=bookToHTML(codersAtWork),
  ~msg="[exercise 6] book => string (html formatted)",
)
 */

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

/*
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
*/
