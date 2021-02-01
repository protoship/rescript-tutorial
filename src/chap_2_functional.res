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
  -----------------------------------------------------------------------------
  Exercise 1
  -----------------------------------------------------------------------------
  Follow these rules to calculate the applicable discount on the shopping cart
  total:

  1. When the total is 500 or above:
  
    * Apply a flat discount of 10%.

    ```
    // Example 1: amount = 500
    discount = 500 * 0.1

    // Example 2: amount = 520
    discount = 520 * 0.1
    ```

  2. When the total is 200 or above, but below 500:

    * Apply a 5% discount on the amount greater than 200. 
    * Add 25 to the above intermediate result to get the final discount.

    ```
    // Example 1: amount = 200
    discount = (200 - 200) * 0.05 + 25

    // Example 2: amount = 220
    discount = (220 - 200) * 0.05 + 25
    ```
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

/*
  Functions support **currying** of input arguments. This is evident
  when there are 2 or more input arguments to a function. The function
  is converted into a sequence of functions which takes a single
  argument.

  This is the curried form of the `fullname` function from earlier:

    ```
    let fullname = firstName => {
      lastName => {
        firstName ++ " " ++ lastName
      }
    }
    ```
  
  The function `fullname` takes a single argument `firstName`. It then
  returns another function in its body. This inner function which
  does not have a name(anoynmous) takes a single argument `lastName`.
  At this point all the arguments have been applied and the inner
  body evaluates and returns the full name string.

  The implication of function currying is that when you want to call
  a function, you do not necessarily need to have all the arguments
  available with you. So you can write this:
  
    ```
    let hindleyPartial = fullName("J. Roger")
    ```
  
  The `hindleyPartial` is a **partial application** of the function
  and, is waiting for one more argument. It is a function waiting
  for one more argument of the `string` type. 
  
  Look at the type signatures of both functions:

    ```
    let fullName: (string, string) => string

    let hindleyPartial: string => string
    ```
  
  You can complete the function application by calling `hindleyPartial`
  with one more `string` argument.

    ```
    let hindley = hindleyPartial("Hindley") // J. Roger
    ```

  In languages which does not support currying, and thereby partial
  application of functions - you can emulate it by returning functions
  from the body of the function. The curried form of `fullname` was
  shown earlier for demonstrating the technique, but you do not need
  to do that here. The language supports it natively. So you can write
  your functions normally, and the arguments will be curried by default.

  Caveat
  ------
  
  ReScript compiles to JavaScript. JavaScript does **not** have currying. 
  
  If you call a JavaScript function with 3 arguments, with only two arguments
  it will still execute. It might result in a runtime error, or exhibit some 
  undefined behavior. This makes it extremely difficult to figure out if a 
  function application is complete in JavaScript.

  This is a problem when you are using a JavaScript API from ReScript through
  a binding. It not possible to verify through static analysis of code whether
  a function application is complete. 

  The term *binding* is new here. You can think of a binding as the machinery
  which makes it possible for a language like ReScript to reuse code already 
  written in another language like JavaScript. You will learn more about this
  later. 
 */

/*
  Uncomment the block below.
 */
/*
let wrapTagAroundText = (tag: string, text: string): string => {
  `<${tag}>${text}</${tag}>`
}

// Partial application (first form)
let makeHeading1 = (text: string): string => wrapTagAroundText("h1", text)
let makeHeading2 = text => wrapTagAroundText("h2", text)

// Partial application (second form)
let makeHeading3 = wrapTagAroundText("h3")
let makeParagraph = wrapTagAroundText("p")

// both first & second forms are identical
// call sites with complete application
let mainHeading = makeHeading1("This is the title of the document")
let subHeading = makeHeading2("A simple tagline...")
let para1 = makeParagraph("Text content....")
let para2 = makeParagraph("This is the second paragraph...")
*/

/*
  Partial application is useful for fixing an argument and then binding
  this specialized function to a name.

  The `makeHeading1` is a partial application of `wrapTagAroundText`
  function. It fixes the `tagName` argument to the value "h1".

  This is a simple example. 
  
  You will commonly see this type of usage in the presence of computations
  which requires I/O. The arguments required for completing an application
  may be dependent on the successful completion of the I/O operation. This
  means you are probably waiting to fetch some value from either a remote
  resource like an API, database or the file system.

  You can construct partially applied functions by fixing the values which
  are already known. Then once the remaining arguments becomes available
  the function application can be completed.

  In the 2nd form `makeHeading3` and `makeParagraph` the input argument
  `text` has been omitted. There is no difference between the 1st form
  of syntax, and the 2nd form. If you hover over all 4 partially applied
  functions you'll see that they have identical type signatures:

    ```
    string => string
    ```
  
  The `text` argument can be omitted because of currying. When you supply
  the `text` argument to `makeHeading3`, it is in turn applied to
  `wrapTagARoundText("h3")` to complete the function application.

  Even though this is valid syntax, try not to use this in practice. It
  obscures the partial application from the reader of the code. Unless
  they hover over the type signature it may not be evident to them that
  `makeHeading3` is a function, and not a final value. 
  
  In larger codebases this cognitive load will add up fast. So when in 
  doubt err on the side of readability of code. Use the first form where
  the input argument is explicitly stated for the benefit of the reader.
 */

/*
  Uncomment the block below.
 */
/*
let wrapTagAroundText2 = (tagName, indent: string => string, text) => {
  let indentSpaces = indent(" ")

  `<${tagName}>
${indentSpaces}${text}
</${tagName}>`
}

let indent = x => Js.String.repeat(2, x)

// same function defined in 3 different ways
let makeDiv1 = text => wrapTagAroundText2("div", indent, text)
let makeDiv2 = text => wrapTagAroundText2("div", x => Js.String.repeat(2, x), text)
let makeDiv3 = text => wrapTagAroundText2("div", Js.String.repeat(2), text)

// <div>
//   <p>Hello, world!</p>
// </div>
makeDiv3(makeParagraph("Hello, world!"))
*/

/*
  You can pass a function as an argument to another function.

  In `wrapTagAroundText2` function, the second argument is a function
  parameter named `indent`. The type signature of `indent` is:

    ```
    string => string
    ```
  
  This is a function which accepts a single `string` argument as its
  input and then produces an output `string` value.

  The type checker will complain if you do not pass a function which
  does not match this signature as the second argument.

  The type of `indent` has been manually annotated for your benefit.
  Again this is not required, as the compiler is capable of inferring
  this exact same type by itself.

  In the body of the `wrapTagAroundText2` you can see `indent(" ")`.
  The argument is an empty string value. It is used inside string
  interpolation, so the output value must also be a string value.
  This is how the compiler is able to infer the type even if you
  did not annotate it as: `string => string`
  
  Go ahead, remove the type annotation from indent and hover on the
  binding `wrapTagAroundText2` to see the compiler inferred type. Does
  the second parameter have the type `string => string`?

  The partially applied function `makeDiv*` has been defined with 
  identical second argument in three different ways:

    1. The named function `indent` is passed as an argument.
    2. The anonymous function is passed as an argument.
    3. The JS String API `repeat` function is passed after
       fixing the first argument as `2`.

  All of them demonstrate the different ways in which you can pass
  functions around as arguments to another function.

  When functional programmers say that functions are first-class
  citizens in a specific language, they are often referring to
  the ability to pass functions around to other functions as
  arguments. Since there is no special syntax to differentiate
  a function expression from a value expression, functions are
  considered to be first-class in the language.

  In languages where functions are not first-class special syntax
  is introduced often known as `lambda` expressions to be able
  to do the same thing.
 */

/*
  In functions like `fullname`, `wrapTagAroundText` or
  `wrapTagAroundText2` there are multiple input arguments which
  belong to the same type.

  It becomes easy to mix up the order of the arguments when
  calling the function like this:

    ```
    wrapTagAroundText("abc", "p") // <abc>p</abc>
    ```
  
  This code will compile. It may also slip through code review. 
  And you  may only be notified when it causes a bug in production. 
  Such an easy mistake to make!

  Also how often do you end up having to Google and lookup
  documentation to check the right order in which arguments have
  to passed to a function.

  So far we've been defining functions where the arguments are
  positionally ordered. To correctly use `wrapTagAroundText` you
  have to remember that the tag name is in the first position
  and the text is in the second position.

  This can be improved if instead of depending on positions, the
  parameters could be labelled. The parameters are not tied to
  a specific position anymore. They are identified by a label.

  This also has the effect of improving the readability of the 
  code. It becomes difficult to confuse between tag name and
  the inner text.
 */

/*
  Uncomment the block below.
 */
/*
let betterWrapTagAroundText = (~tag, ~indent, ~text) => {
  let indentSpaces = indent(" ")

  `<${tag}>
${indentSpaces}${text}
</${tag}>`
}

// <div>
//   <p>Hello, world!</p>
// </div>
betterWrapTagAroundText(
  ~tag="div",
  ~indent=Js.String.repeat(2),
  ~text=makeParagraph("Hello, world!"),
)
*/

/*
  The bindings you declare refer to **immutable** values. Immutability
  is the default setting in this language. You can attach new values
  to an existing binding through shadow binding.
  
  But that is not very useful in situations where you need to change an
  immutable value dynamically based on external configuration. For example
  the String `repeat` function you used earlier, takes a string argument
  and another count argument. It returns a new string where the input
  string arguments is repeated count times.

  Loops will not work for immutable values. Even if you shadow the binding
  in the outer scope of a loop, the changes you shadow within the block
  scope will not survive when the scope end. So it has no effect on the
  binding in the outer scope.

  You need function recursion to modify immutable values.

  The compiler smartly optimizes away the recursive function to an
  equivalent iterative version in JavaScript. So you do not pay any
  penalty for recursive functions.

  Let us implement a function `myCharRepeat` similar to the `repeat`
  function you used earlier.

  This function accepts two labelled arguments as input:
    1. ~count - number of times to be repeated
    2. ~char - a `char` (primitive) value.

  The `char` type values are enclosed in single quotes. 
  The `string` type values are enclosed in double quotes.

  This function has the type signature:

    ```
    let myCharRepeat: (~count: int, ~char: char) => string
    ```

  The usage of the function is as follows:

    ```
    myCharRepeat(~char='*', ~count=6) // ******
    myCharRepeat(~char='$', ~count=2) // $$
    myCharRepeat(~char='+', ~count=1) // +
    ```
 */

/*
  Uncomment the block below.
 */
/*
let myCharRepeat = (~count, ~char) => {
  // Memoize the conversion of `char` value to a `string` value once
  // here. We do not want to keep invoking this function again and
  // again from within the recursive inner function `aux`
  let s = String.make(1, char)

  // First argument is an accumulator. See the else branch to understand
  // how the accumulator grows. When the function terminates the
  // accumulator holds the result of the computation
  let rec aux = (acc, times) => {
    if times < 2 {
      acc
    } else {
      aux(acc ++ s, times - 1) // `s` is memoized outside
    }
  }

  // Call recursive function
  aux(s, count)
}

// call site
myCharRepeat(~char='@', ~count=6) // @@@@@@
*/
/*
  If you are not used to writing recursive functions it is going to take
  a while before you wrap your head around it.
  
  Let us follow what happens when you call this:

    `myCharRepeat(~count=3, ~char='@')`

  Inside `myCharRepeat` the '@' char value is memoized as a string,

    `s = "@"`

  Then the recursion starts with the call to `aux("@", 3)`.

  The call trace looks like this:

    aux("@", 3)
    aux("@" ++ "@", 3 - 1)  // else branch calls -> aux("@@", 2)
    aux("@@" ++ "@", 2 - 1) // else branch calls -> aux("@@@", 1)

  And finally we hit the terminal condition for ending recursion with
  the call to:
    
    aux("@@@", 1) // returns "@@@" to caller
  
  This may be a bit too much at first if you are not comfortable with
  function recursion. The best way to understand is to pick up a pen
  and some paper and try tracing a few different calls yourself.

  A recursive function has to be explicitly marked as recursive using
  the `rec` keyword.

  The inlined `aux` function is recursive. The reason it is inlined is
  to provide a clean API to the users of the function. If we made the
  the `myCharRepeat` itself a recursive function, then it would also
  require an accumulator in its parameters. We avoided that by making
  the recursion internal to the `myCharRepeat` function.

  Which is a cleaner & safer API for the end user? (1 or 2)

  1. myCharRepeat(~count=3, ~char='@', ~acc="")
  2. myCharRepeat(~count=3, ~char='@)

  The recursive `aux` (inlined) is a common technique used by functional 
  programmers to hide the accumulator parameter from the end users of the
  function.
 */

/*
  In practice implementing recursion is not that common when building
  CRUD applications, or user interfaces. But it is useful to learn about
  recrusion. It allows you tackle problems which require traversing,
  and updating **immutable** tree like structures when you encounter
  them.

  Real world examples which need recursion include,
  * Scraping content from an HTML page
  * Tree like UI components,
    * Directory/File navigation (file backup)
  * Browser extension which needs to traverse the DOM
  * Rendering SVG charts
  * etc.
 */

/*
  Readability is affected when you have deeply nested function calls
  like this:

    ```
    // <body><div><p>Hello, world!</p></div></body>
    wrapTagAroundText("body", 
      wrapTagAroundText("div", 
        wrapTagAroundText("p", "Hello, world!")))
    ```

  You have to scan the inner most expression, and begin parsing this
  expression inside out. This does not help readability.

  To workaround this problem you have access to the **pipe** `->` operator.
  Infix operators are not easy to Google if you do not already know it's
  name.

  The `->` (pipe) operator makes it possible to transform this:

    `someFunction(arg1, arg2)`

  into:

    `arg1->someFunction(arg2)`

  The argument order in `wrapTagAroundText` can be modified so that
  the incoming data parameter - `text` - is the first argument. This
  will allow us to construct a data transformation pipeline when
  repeatedly applying `wrapTagArondText`.

  Let us see how that works.
 */

/*
  Uncomment the block below.
 */
/*

// original nested call site
//
// returns:
//  <div><div><div><p>Hello, world!</p></div></div></div>
//
wrapTagAroundText(
  "div",
  wrapTagAroundText("div", wrapTagAroundText("div", wrapTagAroundText("p", "Hello, world!"))),
)
let wrapTagAroundText3 = (text, tag) => `<${tag}>${text}</${tag}>`

// transformed into a data pipeline
//
// returns:
// <div><div><div><p>Hello, world!</p></div></div></div>
//
"Hello, world!"
->wrapTagAroundText3("p")
->wrapTagAroundText3("div")
->wrapTagAroundText3("div")
->wrapTagAroundText3("div")

// use labelled ~tag parameter which makes it position less
let wrapTagAroundText4 = (text, ~tag) => `<${tag}>${text}</${tag}>`

// transformed into a data pipeline
//
// returns:
// <div><div><div><p>Hello, world!</p></div></div></div>
//
"Hello, world!"
->wrapTagAroundText4(~tag="p")
->wrapTagAroundText4(~tag="div")
->wrapTagAroundText4(~tag="div")
->wrapTagAroundText4(~tag="div")
 */

/*
  There are 3 different call-sites above:

  1. Regular nested function calls.
  2. The data parameter `text` is in first argument position.
  3. Use labelled `~tag` parameter making it position less.

  The code above creates value transformation pipeline. You can inspect
  the compiled JavaScript code to see how they look.

  The beginning data parameter is "Hello, world!". After the first
  function application in the pipeline it becomes:

    ```
    <p>Hello, world!</p>
    ```

  This transformed value becomes the input into the second function
  application and it continues till the end until you get:

    ```
    <div><div><div><p>Hello, world!</p></div></div></div>
    ```

  This is known as function *composition*. 
  
  Your challenge is to design your computations in such a manner that the 
  incoming **immutable** data parameter is transformed through a sequence
  of function applications.

  You should think breaking down your computation into a sequence of
  functions which **compose**. Then construct a value transformation
  pipeline to get from input to output.

  The type signature of `wrapAroundText3` is:

    ```
    (string, string) => string
    ```

  The type signature of `wrapAroundText4` is:

    ```
    (string, ~tag: string) => string
    ```

  In both cases the output is `string` type value which can then again
  become the input into one of these functions. So you end up with
  types lining up like this in a pipeline:

    ```
    string (input) 
      -> string (1st transform) 
      -> string (2nd transform)
      -> string (3rd transform)
      -> string (output)
    ```
  
  You can compose your functions in a pipeline only when the types
  line up. If the type output by a function is `string`, you can compose
  it with a function which accepts `string` input. Now if this function
  outputs a `float` type, you can then compose it with another function
  which accepts a `float` type, and the chain of value transformations
  can continue until you reach your final output value. There can be
  any number of intermediate steps.

    `string(input) -> float -> float -> int(output)`

  When the types do not line up it will result in a compilation error.
  This happens when your assumption regarding the shape of the data
  does not match what has been written in code. This is so powerful.
  You catch these errors at the time of compilation, without having
  to think very hard about them. The compiler does the heavy lifting
  of catching these errors for you.

    ```
    let doA: (string, int) => string
    let doB: (string) => float
    let doC: (float, float) => float
    let doD: (float) => int
    let doE: (int, int) => int
    ```

  It is possible to transform a `string` to an `int` by applying 
  the functions above in sequence. The types line up.

    ```
    "testing"
      ->doA(100) // string output
      ->doB      // string input, float output
      ->doC(0.5) // float input, float output
      ->doD      // float input, int output
      ->doE(2)   // int input, int output
    ```

  On the other hand this is a compilation error:

    ```
    "testing"
      ->doA(100) // string output
      ->doB      // string input, float output
      ->doE(2)   // int input <-- does not line up with incoming float ouput
    ```
  
  The challenge for you is to begin thinking in **immutable** transformation
  of values by composing functions sequentially in a pipeline. It may take
  some adjusting to get used to when you are used to **mutating** values in
  other languages.

  The benefits you will reap is in legibility of code for the reader, and 
  preventing value transformation mistakes from hiding in your code. 
 */

/*
  Uncomment the line below.
 */
// let unitValue: unit = ()

/*
  The `unit` type is a primitive. It has only a single value represented
  as `()`.

  The manual type annotation above is unnecessary. If you remove it, and
  hover over `unitValue` the type will be displayed as `unit`.

  When you see  `unit` in a function type signature it signals that the
  function has side-effects.

  Side-effects could be:
    * reading/writing to the file system
    * fetching data from a remote service
    * logging to the console
    * etc.
  
  These are all computations which introduces some state change in the
  application outside the realm of the function.

  You could read from a file, and the contents of the file may change
  in subsequent read calls. 
  
  You could fetch data from a remote API, and it may return successfully 
  most of the times, except when the remote service is unresponsive/down. 
  It may also return different results each time it is called.  
 */

/*
  Uncomment the line below.
 */
// let timestamp = Js.Date.now()

/*
  The JS Date API `now()` returns the current time as number of milliseconds
  since Unix epoch.

  The type signature of `now` is: (hover over `now()` to see it)

    ```
    unit => float
    ```
  
  This function takes zero inputs, yet produces an output of type `float`.
  
  How does a function without any input produce an output? 
  Side-effects.
 */

/*
  Uncomment the line below.
 */
// Js.log("takes one input, returns nothing!")

/*
  The `Js.log` is the binding for JS API `console.log`.

  The type signature of `log` is:

    ```
    'a => unit
    ```
  
  This function takes a single input, but returns `unit`.

  The type `'a` means that this is a function which can accept arguments
  of any type. Don't worry about this detail. This will be covered 
  extensively later.
 */

/*
  Uncomment the block below.
 */
/*
let addThreeNumbers = (x, y, z) => {
  Js.log("x : " ++ Belt.Int.toString(x))
  Js.log("y : " ++ Belt.Int.toString(y))
  Js.log("z : " ++ Belt.Int.toString(z))

  let result = x + y + z
  Js.log("sum (x + y + z) = " ++ Belt.Int.toString(result))

  result
}

addThreeNumbers(1, 2, 3)
*/

/*
  ReScript is not a **pure** functional language. You can use a side-effects 
  inside a function like logging to console for purposes of debugging.

  In a **pure** language if the type of the function is:
  
    ```
    (int, int, int) => int
    ```

  you are not allowed to do side-effects inside the function. You are
  expected to separate the side-effecting parts in your program from
  the pure computational parts. To do debug logging additional code
  is involved to make it type safe.

  The type signature for `addThreeNumbers` does not indicate anything
  about side-effects. But you can still perform side-effects from
  within it. Use your good judgement here. It will get better as you
  become more fluent in the langauge.
 */
