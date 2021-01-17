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

// exercise
// exercise: variants with tagged data
// self-referential data structures
// recursive functions over these types
// exercise: self-referential

/*
  -----------------------------------------------------------------------------
  TODO :-
  -----------------------------------------------------------------------------
  Conversation w/Jasim regarding writing assigments,

  Give a writing assigment where they have to search and learn about a concept
  by finding good quality online references. The writing has to explain the
  concept in a tutorial fashion. It should also include the references they
  used for writing. References like wikipedia/medium set a low bar and will
  not be accepted. They should rather link to the original source.

  This encourages independent learning, and solidifying their understanding
  of concepts through writing. Afterall writing is thinking!

  Ideas :-
  1) Immutability vs Mutability
  2) Pure vs Impure

  Decision :-
  Writing is a skill which is necessary but difficult to learn. Good writing
  is translating good thinking to paper. This requires significant time
  and effort. When considering budgeting time for improving writing skills
  vs. using that time for improving programming skills - the latter wins.
  The desired outcome of this course is to push the the newbie programmer
  to an intermediate programmer. This comes through deliberate practice
  and putting in more hours.
  -----------------------------------------------------------------------------


  Newcomers / beginners to programming often can get their code working
  through writing code which is highly imperative and structured. This
  code will work, and in the small (under 500 SLOC) is straight forward
  to read and understand. But they lack the abstractions or design
  thinking necessary to scale the small program into a larger program
  10x times its initial size. There are low hanging fruits in programming
  in the small which can immediately improve the quality of the program
  written by beginners.

  These are few common patterns we witnessed in code written by beginner
  programmers:

    * functions without arguments, or return types
    * interleaving I/O with computation
    * using exceptions as control flow
  
  These are just the few we observed from reviewing code for a small
  CRUD programming task. 

  Intermediate/Experienced programmers have trouble picking up Typed-FP
  because of the following reasons (subjective):

    * Immutability by default (instead of mutability)
    * Chaining function as a pipeline for transforming data
    * Confused about parametric polymorphism
    * Not reading the compiler error messages
    * Not having a good mental model of how types are inferred
    * Not using types as a tool for shaping data
    * etc.

  --- immutability start ---
  In many mainstream programming languages you can modify the value
  in the `greeting` variable. It would look like this:
  
  ```
  greeting = "Goodbye!"
  ```
  
  The `greeting` variable is __mutable__. So you can change the
  contents referenced by this variable any number of times in
  the code that you author.

  This is not valid syntax in ReScript. The `greeting` variable
  is __immutable__. It's value cannot be changed.

  If you are used to the mutable style of programming, it will take
  some adjusting to where the default is immutable values. This is
  standard fare for functional programming languages, and has its
  benefits.

  When variables are mutable you have to write more guard clauses
  in your code to assert and raise exceptions when invalid states
  are entered during computation. This is known as enforcing
  invariants in your code. In the presence of mutability reasoning
  about state is lot more difficult, and it creates more opportunities
  for bugs in the code.

  With immutability as the default it becomes easier to reason
  about the state because its constrained in how it can be changed.
  As a consequence it requires less code to enforce your invariants.
  The reason being that the compiler does this for you.

  --- immutability end ---

  At first glance it may not be obvious how you can write any useful
  programs in this language without mutation...
*/

// let greeting: string = "Goodbye!"
/*
  This binding `greeting` __shadows__ the earlier binding with the
  same name.  
  
  If you look at the JavaScript generated by the ReScript compiler
  in `tutor.bs.js` the value of the variable greeting is the same
  as the shadowed value above. The previous value of the binding
  is nowhere to be seen in the generated JavaScript. The compiler
  was smart enough to optimize it away.

  ```
  // Generated code in `tutor.bs.js`
  var greeting = "Goodbye!";
  ```

  Ex.2
  Fix the compiler warning regarding unused value `greeting`. This
  is a useful warning from the compiler informing us about bindings
  which are not being used anywhere.

  Modify the above binding to produce have tthe string

  In line no.11 change `greeting` to `_greeting`
  To fix this warning you can prefix an underscore to the name of 
  the binding on line no. 11. Change `greeting` to `_greeting`.


 */

/*

let firewood: string = `শিমুল কাঠই হোক বা বকুল কাঠই হোক, আগুনের চেহারাটা একই`
Js.log(firewood)

https://wiki.c2.com/?TenWordLine

1. Building blocks
  - Primitives: int, float, char, string, bool
  - type inference
  - Bindings
    - are immutable by default
    - shadowing
    - mutation 
    (leave a reference to this language feature as you progress through the tutorial)
    - block scope
2. Defining a new type (Shape of data)
  - Constructor only
  - Constructor with tagged data
  - Constructor with type variable
  - Recursive / self-referential types
3. Pattern matching
  - exhaustive pattern matching
  - functions which consume types
  - functions which produce types
4. Functions
  - currying, partial application
  - uncurried functions
  - recursive functions
    - auxillary function
  - uncurried function
  - anonymous
5. Labeled Arguments in Functions
  - labelling arugments when similar type values passed as arguments
  - optional labeled arguments
  - punning

  Key ideas:
  - runtime check vs compile time guarantees
*/

/*

https://www.hillelwayne.com/post/learning-a-language/?utm_source=hillelwayne&utm_medium=email

Progressive cheat sheets
https://www.hillelwayne.com/post/cheatsheets/?utm_source=hillelwayne&utm_medium=email

Building blocks
- integer
- bool
  - Are there more integers than bools?
- what is a type?
  - name for a collection of values
- define a new type
  type seasoning = Salt | Pepper
  - What is the type of Salt?
  - What is the type of Pepper?
- define a new type with constructor arguments
  type num = Zero | OneMoreThan(num)
  - Is Zero a num?
  - Is OneMoreThan(Zero) a num?
  - What is the type of OneMoreThan(OneMoreThan(Zero))?
  - How many vlues of num are possible?
- define a new type with type variable
  type openFacedSandwich('a) =
    | Bread('a)
    | Slice(openFacedSandwich('a))
    - What is Bread(0)?
    - What is Bread(true)?
    - How are they both the same types? They are not
    - A shape that represents many different types
    - Does that mean we can derive as many as types as 
      we want from the shape?
    - openFacedSandwich(int)
    - openFacedSandwich(bool)
    - openFacedSandwich(num)
      Bread((OneMoreThan(Zero)))      -> openFacedSandwich(num)
      Bread(Bread(OneMoreThan(Zero))) -> openFacedSandwich(openFacedSandwich(num))

  Moral
  -----
  1. Use type to describe types.
  2. When a type contains a lot of values, the type definition refers to itself.
  3. Use type variables with type to define shapes


  Pattern-matching
  Moral
  -----
  * The number and order of patterns in the defintion of a function should match
  that of the definition of the consumed data type
  * Functions that produces values of a data type must use the associated
  constructors to build data of that type

  Record
  Tuples

  Functions are people too
    let identity = x => x
    identity: 'a => 'a

    let trueMaker = x => true
    trueMaker: 'a => bool

  Moral
  -----
  Some functions consume values of arrow type; some produces
  values of arrow type
  Replace stars by arrows to reduce the number of values
  consumed and to increase the generality of the function defined.
  Some functions produce exceptions instead of values; some
  don't produce anything. Handle raised exceptions carefully.
  
  Modules, Functors
  Moral
  -----
  Real programs consist of many components. Specify the dependencies
  among these components using signatures and functors
 */
