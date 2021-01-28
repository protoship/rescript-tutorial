/*
  The (if/else-if/.../else) syntax is a "control flow" construct familiar
  to you. Here it is an **expression**. 

  Depending on the branch which evaluates true, a value is returned and
  it has an associated type inferred by the compiler, or you may have
  manually annotated the type yourself. The types of the values returned
  from any branch should always match.

  This is consistent with what you learned earlier when declaring immutable
  bindings. A binding cannot be both `int` and `string` at the same time.
  So therefore the if/else expression can only return a value belonging
  to a single type.

  You will see a compiler error if you try returning a `string` value
  in one branch and a `float` value in another branch. The type checker
  will catch this and inform you that the types do not match. 
 */

/*
  Uncomment the block below.
 */
/*
let downvotes = 10
let upvotes = 5
let cssClassName = if upvotes < downvotes {
  "Comment Comment-hidden"
} else {
  "Comment"
}
*/

/*
  -----------------------------------------------------------------------------
  Exercise 1
  -----------------------------------------------------------------------------
  Calculate the discount applicable to shopping cart total amount using the
  following rules:

  1. When the total is either 500 or above:
     - a flat 10% discount.
  2. When the total is either 200 or above, but below 500:
    - add 25 to,
    - a 5% discount on the amount greater than 200
  -----------------------------------------------------------------------------
 */

/*
  Uncomment the block below for completing exercise 1.
 */
/*
let cartTotal = 220
let discount = 0
SimpleTest.assertEqual(
  ~expected=26,
  ~actual=discount,
  ~msg="[exercise 1] Calculate discount for total amount of shopping cart",
)
*/

/*
  The code above is not reusable. You need functions for creating reusable
  units of computation. By rewriting the above as a function you can now
  compute the discount for any value of total. Here is an example:

    ```
    let fullname = (firstName, lastName) => 
      firstName ++ " " ++ lastName
    ```

  Just like regular value bindings, you can also manually annotate
  the types of each input argument and the output value.

    ```
    //                                     output type
    //                                       ||||||
    //                                       vvvvvv  
    let fullname = (fn: string, ln: string): string =>
      fn ++ " " ++ ln
    ```

  Manual annotation is often unnecessary. The compiler is capable of
  automatically inferring the correct type from your implementation. 
  But when there comes a time when you need to manually annotate the 
  type, you use the above syntax.

  If you need to lookup the documentation of a library function you
  will see **type signatures** being used everywhere. The type signature
  for the `fullname` function looks like:

    ```
    let fullname: (string, string) => string
    ```

  From this you can infer that the function `fullname` accepts two
  input arguments. Both of them are of the `string` type. It returns
  a value of the `string` type. You can pretty much infer the behavior
  of `fullname` without seeing the actual implementation.

  Types are therefore a useful form of documentation. It will not go
  stale unlike other pieces of documentation. How can it? It is taken
  directly from the implementation. If the implementation types change,
  the type signature will also change.

  How do you call or apply this function?

    ```
    let turing = fullname("Alan", "Turing") // "Alan Turing"

    // Not assigned to any binding
    fullname("Barbara", "Liskov") // "Barbara Liskov"
    ```

  The implementation of `fullname` is simple. There is just a single
  expression to evaluate. If you need multiple expressions in your
  function body, you can create a new block scope with curly braces.
  Like this:

    ```
    let nameToInitials = (firstName, lastName) => {
      let firstNameInitials = Js.String.get(firstName, 0)
      let lastNameInitials = Js.String.get(lastName, 0)

      firstNameInitials ++ ". " ++ lastNameInitials ++ ". "
    }
    ```
  
  There is no explicit `return` keyword. The value from evaluating
  the final expression is returned to the caller.

    ```
    let curry = nameToInitials("Haskell", "Curry") // "H. C."

    // Not assigned to any binding
    nameToInitials("Alonzo", "Church") // "A. C."
    ```
 */

/*
  -----------------------------------------------------------------------------
  Exercise 2
  -----------------------------------------------------------------------------
  The discount implementation is the same as exercise 1.

  Put your implementation within the body of `calculateDiscount` to pass the
  tests.
  -----------------------------------------------------------------------------
 */
/*
  Uncomment the block below.
 */
/*
let calculateDiscount = (total: int): int => {
  total // tests are failing
}
SimpleTest.assertEqual(
  ~expected=0,
  ~actual=calculateDiscount(199),
  ~msg="[exercise 2] Calculate discount for 199",
)
SimpleTest.assertEqual(
  ~expected=25,
  ~actual=calculateDiscount(200),
  ~msg="[exercise 2] Calculate discount for 200",
)
SimpleTest.assertEqual(
  ~expected=39,
  ~actual=calculateDiscount(499),
  ~msg="[exercise 2] Calculate discount for 499",
)
SimpleTest.assertEqual(
  ~expected=50,
  ~actual=calculateDiscount(500),
  ~msg="[exercise 2] Calculate discount for 500",
)
*/

/* --- BEGIN 

  - partial application
  - passing function as arugments

// ---

// partial application example
// helper for partial application
let wrapTagAroundText = (tagName: string, text: string): string => {
  `<${tagName}>${text}</${tagName}>`
}
// long form
let makeHeading1 = (text: string): string => wrapTagAroundText("h1", text)
// long form without type annotation
let makeHeading2 = text => wrapTagAroundText("h2", text)

// short form this is also correct
// but the one above is better for readability
// types are the same
let makeHeading3 = wrapTagAroundText("h2")
let makeParagraph = wrapTagAroundText("p")

// call sites, full application
let mainHeading = makeHeading1("This is the title of the document")
let subHeading = makeHeading2("A simple tagline...")
let para1 = makeParagraph("Text content....")
let para2 = makeParagraph("This is the second paragraph...")

// ---

// pass function as argument (indent)
// pretty limited because we would not have introduced arrays by this point
let wrapTagAroundHTML = (tagName: string, indent: string => string, html: string): string =>
  `<${tagName}>\n${indent(" ")}${html}\n</${tagName}>`

// exercise is to write the below callsite
// hint: Use Js.String.repeat with fixed argument 2
let indent = x => Js.String.repeat(2, x)
let makeDiv = wrapTagAroundHTML("div", indent)

let div1 = makeDiv(para1)
let div2 = makeDiv(para2)

// ---

// how do you make wrapTagAroundText & wrapTagAroundHTML better
// for the reader of the code?
// use labelled arguments when possible
// when the types of the function are (string, string) you have
// a designed an API where the user of that code should now either
// remember or go lookup documentation to figure out the correct
// way to use it. If you switch up the argument order , there is
// no compilation error. Because they are the correct types, but
// now you have a logical error.
// It's better to not depend on the position of an argument, and
// instead use named arguments.

let betterWrapTagAroundHTML = (~tag: string, ~indent, ~html) =>
  `<${tag}>\n${indent(" ")}${html}\n</${tag}>`

let makeBetterDiv = betterWrapTagAroundHTML(~tag="div", ~indent)
let div3 = makeBetterDiv(~html=para1)

// labelled arguments are not positional
// all these functions return the same result
// application order does not matter
betterWrapTagAroundHTML(~indent, ~tag="div", ~html=para1)
betterWrapTagAroundHTML(~html=para1, ~indent, ~tag="div")

// anonymous function

betterWrapTagAroundHTML(~indent=x => Js.String.repeat(2, x), ~tag="div", ~html=para1)

 --- END */

// what is going on here?
// indent is a function
// it has type string => string
// string input, string output
// we did not use the named function `indent`
// instead the function body was inlined
// no name, this function has
// anonymous, we then call it
// exact same as indent, except no name
// this is a handy techinque when working with some functions
// like Belt.Array.map/filter etc which you  will encounter
// in parametric polymorphism section

// yet another different way of writing the wrapper function
/*
let altWrapTagAroundHTML = (~depth, ~tag, ~html) => {
  let indent = x => Js.String.repeat(depth, x)
  `<${tag}>\n${indent(" ")}${html}\n</${tag}>`
}
*/

// let's build a function like repeat ourselves
// the string binding is immutable in ReScript
// so no looping and mutating a string reference
// instead we'll do it immutably
// and this requires recursion
/*
let myCharRepeat = (~count: int, ~char: char): string => {
  // convert char to a string
  let s = String.make(1, char)

  let rec aux = (acc, times) => {
    if times < 2 {
      acc
    } else {
      let acc' = acc ++ s
      aux(acc', times - 1)
    }
  }

  aux(s, count)
}
*/

// having to implement recursive functions is an uncommon
// activity when building user interfaces. That being
// said there are legitimate uses for recursion like
// walking the HTML DOM tree structure in the browser,
// building a directory/file tree structure UI component,
// or for that matter any tree UI component.
// similar exercise is `renderHTML` encountered later

// pipeline
// key - string
// value - 'a
// don't talk about the type because we will
// encounter polymorphic parametrism in the span
// of a few examples. Let's elide this detail and
// focus on the pipeline aspect
/*
let cache = Belt.Map.String.empty
let cache1 = Belt.Map.String.set(cache, "key1", "value1")
let cache2 = Belt.Map.String.set(cache1, "key2", "value2")
let cache3 = Belt.Map.String.set(cache2, "key3", "value3")
let cache4 = Belt.Map.String.set(cache3, "key4", "value4")
let cache5 = Belt.Map.String.set(cache4, "key5", "value5")

// there is an easier way to write this without any
// intermediate variables
let anotherCache = Belt.Map.String.empty
anotherCache
->Belt.Map.String.set("key1", "value1")
->Belt.Map.String.set("key2", "value2")
->Belt.Map.String.set("key3", "value3")
->Belt.Map.String.set("key4", "value4")
->Belt.Map.String.set("key5", "value5")

assert (cache->Belt.Map.String.size == anotherCache->Belt.Map.String.size)
*/

// functions which return unit
// side-effects
// functions so far have been pure
// they do not mutate state
// but what if we want to log something
// into the console
// now that is not a pure function
// because it interacts with the real
// world. This could be getting user
// input keyboard, mouse, touch etc
// through browser events, reading a file
// etc. The most common one though is logging
// something to the console. For that you
// can use Js.log which is pretty much
// console.log in javascript. Except
// it can take only a single argument
// but that can be of any type. But that may
// not make sense yet. But it will in the next
// section, how a function can take an argument
// of any type.
// Use Js.log to debug your code
// Js.log("hello there") // would print it
// to console on running this from the command
// line.

// Js.log("This is the penultimate step in this section...")

// there is a primitive type named unit
// what is unit
// represented by the value ()

/*
let whatIsTheNatureOfTheVoid = ()

let aFunctionWhichReturnsNothing = (_: int): unit => {
  // does somethign else here ...
  ()
}

// neither takes any argument
// nor does it return anything
// if it takes no input, then it can only side-effect within
let whatIsThisFunction = () => {
  Js.log("A debug statement....")
  // maybe something else is going on here
  // but there is no contact with the outside world
  () // return nothing
}
*/
