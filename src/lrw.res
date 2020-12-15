/*
  In Reason there are 6 basic types: int, float, char, string, bool, and unit.

  The following exercises and examples will give you a brief introduction to
  these types. Feel free to play around with them in rtop.

  Note the keyword [let], which is how variable assignment is done in Reason.

  In Reason floats are distinguished from ints by their decimal points. 0 is an
  int, 0. is a float.

  In addition the basic math operations are also distinguished by a decimal
  point. For example, + allows you to add two ints and +. allows you to add two
  floats.

  Signatures
  ==========

  four is a value with the type int. We write the signature like this:

  let four : int

  Read it like this: "[four] is a value of type int".

  Signatures are similar to type declarations in other languages. They tell the
  compiler (and human readers of your code!) the types of variables and
  functions in your program. For example, in C, C++, and Java, the signature
  above would be written like so:

  int four;
 */
let _four = 4

/*
  floatFour is a value with the type float. We write the signature like this:

  let floatFour : float

  You may have noticed that the two signatures we showed you were in comments.
  Signatures are not always required! In many situations, you may omit them,
  and the compiler will infer the type of values.

  However, if you do write a signature for a value, the compiler will make sure
  to check that it's consistent with how that value is used.

  Try inserting an incorrect signature for [floatFour] to see what error the
  compiler gives you.
 */
let floatFour = 4.

/*
  Function signatures
  ===================

  In Reason, functions are also values! And so, functions also have type
  signatures.

  In a function signature, types of parameters are enclosed within parentheses.
  The return value is the described last and preceded immediately by an arrow
  [=>].

  So the signature for a function that takes two integers and returns an
  integer is:

  let intAverage: (int, int) => int

  In Reason there's no explicit return statement: functions just return the
  value of the last statement in that function.
 */
/* let intAverage = (x, y) => failwith("For you to implement"); */
let intAverage = (_x, _y) => failwith("For you to implement")

/* let floatAverage : (float, float) => float */
/* let floatAverage = (x, y) => failwith("For you to implement"); */
let floatAverage = (_x, _y) => failwith("For you to implement")

/*
  The following expression computes the average of 10 and 20:

  intAverage(10, 20)

  As in many languages strings are denoted with "" and chars are denoted with ''.

  String concatenation is done with the ++ operator.

  let firstName : string
 */
let firstName = "Fred"

/* You can also write type annotations in definitions */
let lastName: string = "Flintstone"

/*
  But Reason has very strong type inference, so you can most often omit types,
  and the compiler can infer that fullName is a string.
 */
let fullName = firstName ++ " " ++ lastName

let aBooleanFalse: bool = false

/*
  You can use
  && for logical and
  || for logical or
  !  for logical not
 */
let () = assert (true || aBooleanFalse)

/*
  The [unit] type
  ===============

  unit is a special type in Reason that has only one possible value written ().
  It is generally used for mutation and io-operations such as printing.

  (I/O stands for input/output. Examples: printing to screen, reading a file,
  sending and receiving network requests.)

  To combine several unit operations together the ; operator is used contained
  within curly braces.
 */
let () = {
  print_endline("Hi, My name is ")
  print_endline(fullName)
  print_endline(" and I am 5 years old")
}

/*
  The lines that follow are inline tests. Each evaluates a boolean expression.
  They are run during the build, and failures -- evaluating to false -- are
  treated like compile errors by the build tool and editors.

  We will see other kinds of inline tests later, and some interesting patterns
  for using them.
  While Reason supports polymorphic comparison, it is good practice to use
  equality and comparison functions specific to each type.

  So, [Int.equal] is the [equal] function defined in the [Int] module. Its
  signature is

  val equal : int -> int -> bool

  In words: [equal] takes two [int]s and returns a [bool]. The following line
  is applying that function to two inputs, [5] and [int_average 5 5].
 */

Test.runAll([
  (intAverage(5, 5) == 5, "int average"),
  (floatAverage(5., 5.) == 5., "float average"),
  (floatAverage(5., 10.) == 7.5, "float average"),
])
/*
  .rei files
  ==========

  Check out the [basicTypes.rei] file in this directory! It declares the types for
  the two functions you had to implement. If the types in the [.rei] don't
  match the types of the values in the [.re], the compiler will flag that as an
  error.
 */

/*
  We use let to define functions.

  Definitions take on the form:
  let functionName = (arg1, arg2) => body;

  For example, here we define a function add1 that takes a single int
  argument and returns that argument plus 1.
 */
let _add1 = arg => arg + 1

/* This function uses the built-in ++ operator to append strings. */
let stringAppend = (x, y) => x ++ y

/* Let's define our own functions using +, -, *, and / below. */
let plus = (_x, _y) => failwith("For you to implement")

let times = (_x, _y) => failwith("For you to implement")

let minus = (_x, _y) => failwith("For you to implement")

let divide = (_x, _y) => failwith("For you to implement")

Test.runAll([
  (plus(1, 1) == 2, "plus"),
  (plus(50, -1) == 49, "plus"),
  (times(8, 8) == 64, "times"),
  (times(2, -1024) == -2048, "times"),
  (minus(-2, 2) == -4, "minus"),
  (minus(1337, 337) == 1000, "minus"),
  (divide(1024, 2) == 512, "divide"),
  (divide(31337, 31) == 1010, "divide"),
])

/* Here are some example functions: */
let square = x => x * x

let half = x => x / 2

let _add = (x, y) => x + y

/* You can order function invocations with parentheses or let bindings */
/* Parens */
let () = Js.log("(5^2)/2 = " ++ string_of_int(half(square(5))))

/* Let bindings */
let () = {
  let squared = square(5)
  let halved = half(squared)
  let toString = string_of_int(halved)
  Js.log("(5^2)/2 = " ++ toString)
}

/* Try to write [average] by reusing [add] and [half] */
let average = (_x, _y) => failwith("For you to implement")

Test.runAll([(average(5, 5) == 5, "average"), (average(50, 100) == 75, "average")])

/*
  We can easily write a function that adds 1 to any number.
  Recall that the infix operator (+) will add two integers.
 */
let add1 = _x => failwith("For you to implement")

/*
  Let's write a function that squares its argument (multiplies it by itself)
 */
let square = _x => failwith("For you to implement")

/*
  Functions are first class in Reason. This means that you can take
  a function and pass it around as an argument to other functions.

  Let's write a function named twice: it will take a function and apply
  that function to itself two times.

  For example, if we wanted to make an "add2" function, we could do it
  by writing:
  let add2 = twice(add1)
 */
let twice = (_f, _x) => failwith("For you to implement")

/* Now that we have twice, write add2 and raiseToTheFourth */
let add2 = failwith("For you to implement") /* Hint: use add1 */

let raiseToTheFourth = failwith("For you to implement") /* Hint: use square */

Test.runAll([
  (add1(4) == 5, "add1"),
  (square(4) == 16, "square"),
  (square(-4) == 16, "square"),
  (twice(add1, 3) == 5, "twice"),
  (add2(1335) == 1337, "add2"),
  (raiseToTheFourth(1) == 1, "raiseToTheFourth"),
  (raiseToTheFourth(10) == 10000, "raiseToTheFourth"),
])

/*
  Pattern matching lets us compare inputs to known values.
  Patterns following "|" are tested in order.
  On the first match, we use the result following "=>".
  The "_" pattern means "could be anything".
 */
let isSuperman = x =>
  switch x {
  | "Clark Kent" => true
  | _ => false
  }

/*
  Let's use our own pattern matching. Write a function that returns
  whether x is non zero by matching on x
 */
let nonZero = _x => failwith("For you to implement")

Test.runAll([
  (nonZero(0) == false, "non zero"),
  (nonZero(500) == true, "non zero"),
  (nonZero(-400) == true, "non zero"),
])

/*
  Remember that functions can call functions?
  They can call themselves too. But only with a special keyword.

  Try changing "let rec" to "let" and you'll see the following compiler error:
  "The value addEveryNumberUpTo can't be found"
 */
let rec addEveryNumberUpTo = x => {
  /* make sure we don't call this on negative numbers! */
  assert (x >= 0)
  switch x {
  | 0 => 0
  | _ => x + addEveryNumberUpTo(x - 1)
  }
}
addEveryNumberUpTo(10)

/*
  Let's write a function to multiply every number up to x.
  Remember: [factorial 0] is 1
 */
// let rec factorial = x => {
let factorial = x => {
  assert (x >= 0)
  failwith("For you to implement")
}

Test.runAll([
  (factorial(0) == 1, "factorial"),
  (factorial(5) == 120, "factorial"),
  (factorial(12) == 479001600, "factorial"),
])

/*
  Reason natively supports linked lists as part of the language.
  Lists are commonly referred to as having heads and tails.
  The head is the first element of the linked list
  The tail is everything else.

  [] means "the empty list".
  [hd, ...tl] means "the element hd added to the front of the list tl".

  When matching on a list, it's either empty or non-empty. To say it another
  way, it's either equal to [] or equal to ([hd, ...tl]) where hd is the first
  element of the list and tl is all the rest of the elements of the list
  (which may itself be empty).

  This function computes the length of a list.
 */
let rec length = lst =>
  switch lst {
  | list{} => 0
  | list{_, ...tl} => 1 + length(tl)
  }

/* Write a function to add up the elements of a list by matching on it. */
// let rec sum = lst => failwith("For you to implement")
let sum = _lst => failwith("For you to implement")

/*
  The signature for the append operator is
  let (@) : (list('a), list('a)) => list('a)

  It's an infix operator.
 */
// let listAppend = (first, second) => first @ second;

/*
  The way you put something on the head to the list uses the same kind of
  syntax for matching on lists. This is called the spread syntax.
 */
let newHead = (hd, rest) => list{hd, ...rest}

Test.runAll([
  (sum([]) == 0, "sum"),
  (sum([55]) == 55, "sum"),
  (sum([5, -5, 1, -1]) == 0, "sum"),
  (sum([5, 5, 1, 1]) == 12, "sum"),
])

/*
  The append infix operator @ concatenates two lists:

  let (@) : (list('a), list('a)) => list('a)

  This function is the same as the List.append function.
 */
// let () = {
//   assert ([5, 1] @ [8, 4] == [5, 1, 8, 4]);
//   assert (List.append([5, 1], [8, 4]) == [5, 1, 8, 4]);
// };

/*
  Write a function to construct a list of all integers in the range [from,to_]
  in increasing order.

  let range: (int, int) => list(int)
 */
// let rec range = (from, to_) => failwith("For you to implement");
let range = (_from, _to) => failwith("For you to implement")

Test.runAll([
  (range(1, 4) == [1, 2, 3], "range"),
  (range(-5, 3) == [-5, -4, -3, -2, -1, 0, 1, 2], "range"),
])

/* Now let's write a function to multiply the elements of a list. */
// let rec product = xs =>
let product = xs =>
  switch xs {
  | [] => failwith("For you to implement")
  | _for_you_to_implement => failwith("For you to implement")
  }

Test.runAll([
  (product([]) == 1, "product"),
  (product([55]) == 55, "product"),
  (product([5, -5, 1, -1]) == 25, "product"),
  (product([5, 5, 1, 1]) == 25, "product"),
])

let plus = (x, y) => x + y

let times = (x, y) => x * y

/* Sometimes, multiple functions look similar: */
let rec addEveryNumberUpTo = x =>
  switch x {
  | 0 => 0
  | _ => plus(x, addEveryNumberUpTo(x - 1))
  }

let rec factorial = x =>
  switch x {
  | 0 => 1
  | _ => times(x, factorial(x - 1))
  }

/*
  These functions have a lot in common:

  let rec NAME x =
    switch (x) {
    | 0 => ANSWER
    | _ => COMBINE(x, NAME(x-1))
    }

  Reason lets us write the common parts just once.
  We just add an extra input for every part that changes (other than the name):
 */
let rec upTo = (answer, combine, x) =>
  switch x {
  | 0 => answer
  | _ => combine(x, upTo(answer, combine, x - 1))
  }

/* Now we can write our original functions in one line each! */
let simplerAddEveryNumberUpTo = x => upTo(0, plus, x)

let simplerFactorial = x => upTo(1, times, x)

/*
  Note that with infix operators like + and *, you can actually pass them as
  functions! You can do this by writing ( + ) and ( * ). So another way to
  write the above two functions would be:

  let simplerAddEveryNumberUpTo = x => upTo(0, ( + ), x);
  let simplerFactorial = x => upTo(1, ( * ), x);

  Remember sum and product?
 */
let rec sum = xs =>
  switch xs {
  | list{} => 0
  | list{x, ...rest} => plus(x, sum(rest))
  }

let rec product = xs =>
  switch xs {
  | list{} => 1
  | list{x, ...rest} => times(x, product(rest))
  }

/*
 These functions look pretty similar too:

 let rec NAME xs =
  switch (xs) {
  | [] => ANSWER
  | [x, ...rest] => COMBINE(x, NAME(rest))
  }

 Let's write the common parts just once:
 */
// let rec every = (answer, combine, xs) => failwith("For you to implement")
let _every = (_answer, _combine, _xs) => failwith("For you to implement")

/* Now let's rewrite sum and product in just one line each using every */
let simplerSum = _xs => failwith("For you to implement")

let simplerProduct = _xs => failwith("For you to implement")

Test.runAll([
  (simplerProduct([]) == 1, "simpler product"),
  (simplerProduct([55]) == 55, "simpler product"),
  (simplerProduct([5, -5, 1, -1]) == 25, "simpler product"),
  (simplerProduct([5, 5, 1, 1]) == 25, "simpler product"),
  (simplerSum([]) == 0, "simpler sum"),
  (simplerSum([55]) == 55, "simpler sum"),
  (simplerSum([5, -5, 1, -1]) == 0, "simpler sum"),
  (simplerSum([5, 5, 1, 1]) == 12, "simpler sum"),
])

/* This function finds the largest element in a list: */
let rec largest = xs =>
  switch xs {
  | list{} => neg_infinity
  | list{x, ...rest} => max(x, largest(rest))
  }

largest(list{})

/* Let's write a function to find the smallest element: Hint: the opposite of
 [neg_infinity] is [infinity]. */
// let rec smallest = xs => failwith("For you to implement")
let smallest = _xs => failwith("For you to implement")

Test.runAll([
  (smallest([]) == infinity, "smallest"),
  (smallest([55.]) == 55., "smallest"),
  (smallest([5., -5., 1., -1.]) == -5., "smallest"),
  (smallest([5., 5., 1., 1.]) == 1., "smallest"),
])

/* Here is [every] from the "Sum Product" problem */
let rec every = (answer, combine, xs) =>
  switch xs {
  | list{} => answer
  | list{x, ...xs} => combine(x, every(answer, combine, xs))
  }

/*
  Here are two functions which compute the largest and smallest integers in a
  list of integers:
 */
let rec largest = xs =>
  switch xs {
  | list{} => neg_infinity
  | list{x, ...ys} => max(x, largest(ys))
  }

let rec smallest = xs =>
  switch xs {
  | list{} => infinity
  | list{x, ...ys} => min(x, smallest(ys))
  }

/* Let's rewrite them using every: */
let simplerLargest = _xs => failwith("For you to implement")

let simplerSmallest = _xs => failwith("For you to implement")

Test.runAll([
  (simplerSmallest([]) == infinity, "simpler smallest"),
  (simplerSmallest([55.]) == 55., "simpler smallest"),
  (simplerSmallest([5., -5., 1., -1.]) == -5., "simpler smallest"),
  (simplerSmallest([5., 5., 1., 1.]) == 1., "simpler smallest"),
  (simplerLargest([]) == neg_infinity, "simpler largest"),
  (simplerLargest([55.]) == 55., "simpler largest"),
  (simplerLargest([5., -5., 1., -1.]) == 5., "simpler largest"),
  (simplerLargest([5., 5., 1., 1.]) == 5., "simpler largest"),
])

/*
  As in most languages, you can define your own types.
  The keyword "type" introduces a type definition.

  One of the non-basic types in Reason is called the variant type.
  Variant types are similar to Enums in other languages. They are
  types which may take on multiple forms, where each form is marked
  by an explicit tag. A variant type is defined as follows:
 */
type color =
  | Red
  | Green
  | Blue

/* Variants are very useful in combination with pattern matching */
let toString = color =>
  switch color {
  | Red => "red"
  | Green => "green"
  | Blue => "blue"
  }

/*
  Reason variants are in many ways more powerful than Enums because the different
  constructors of your variant can include data in them. Here's an example:
 */
type cardValue =
  | Ace
  | King
  | Queen
  | Jack
  | Number(int)

let oneCardValue: cardValue = Queen

let anotherCardValue: cardValue = Number(8)

let cardValueToString = cardValue =>
  switch cardValue {
  | Ace => "Ace"
  | King => "King"
  | Queen => "Queen"
  | Jack => "Jack"
  | Number(i) => string_of_int(i)
  }

/*
  Write a function that computes the score of a card (aces should score 11
  and face cards should score 10).
 */
let cardValueToScore = _cardValue => failwith("For you to implement")

Test.runAll([
  (cardValueToScore(Ace) == 11, "card value to score"),
  (cardValueToScore(King) == 10, "card value to score"),
  (cardValueToScore(Queen) == 10, "card value to score"),
  (cardValueToScore(Jack) == 10, "card value to score"),
  (cardValueToScore(Number(5)) == 5, "card value to score"),
])

/*
  Another non-basic type in Reason is a tuple. A tuple is an ordered collection
  of values that can each be of a different type.
 */
type intStringAndChar = (int, string, char)

/* Tuples are created by supplying values in place of their basic types: */
let example: intStringAndChar = (5, "hello", 'A')

/* You can also extract the components of a tuple: */
let (i, s, c) = example

let () = {
  assert (i == 5)
  assert (s == "hello")
  assert (c == 'A')
}

/*
  Consider a coordinate type containing the x and y values of a coordinate.
  Write a function that computes the sum of two coordinates.
 */
type coordinate = (int, int)

/* TODO */
let add = (_coord1, _coord2) => failwith("For you to implement")

/* Now consider a name type containing strings representing first and last name. */
type name = (string, string)

/* Or an initials type containing chars representing first and last initials */
type initials = (char, char)

/*
  Say we want to write a function that extracts the first element from a coordinate,
  name, or initials. We currently can't write that because they all have different
  types.

  Lets define a new pair type which is parameterized over the type contained in
  the pair. We write this as:
 */
type pair<'a> = ('a, 'a)

/*
  Our types defined above could be rewritten as

    type coordinate = pair(int)
    type name       = pair(string)
    type initials   = pair(char)

  We can construct pairs just like we construct regular tuples
 */
let intPair: pair<int> = (5, 7)

let stringPair: pair<string> = ("foo", "bar")

let nestedCharPair: pair<pair<char>> = (('a', 'b'), ('c', 'd'))

/* Write functions to extract the first and second elements from a pair. */
/* let first: pair('a) => 'a */
/* TODO */
let first = _pair => failwith("For you to implement")

/* let second: pair('a) => 'a */
/* TODO */
let second = _pair => failwith("For you to implement")

Test.runAll([
  (add((1, 2), (3, 4)) == (4, 6), "add"),
  (first(("foo", "bar")) == "foo", "first"),
  (second(('a', 'b')) == 'b', "second"),
])

/*
  The following function has the signature:

  let divide : int -> int -> int

  Looking at just the signature, it's not obvious which int argument is
  the dividend and which is the divisor.
 */
let _divide = (dividend, divisor) => dividend / divisor

/*
  We can fix this using labelled arguments.

  To label an argument in a signature, and when defining a function, we
  put a tilde (~) before the name of the argument.

  The following function has the signature:

  let divide: (~dividend:int, ~divisor:int) => int
 */
let divide = (~dividend, ~divisor) => dividend / divisor

/*
  We can then call it using: divide(~dividend=9, ~divisor=3)

  Labelled arguments can be passed in in any order.

  We can also pass variables into the labelled argument:

  let dividend = 9;
  let divisor  = 3;
  divide(~dividend=dividend, ~divisor=divisor)

  If the variable name happens to be the same as the labelled argument, we
  don't even have to write it twice:

  let dividend = 9;
  let divisor  = 3;
  divide(~dividend, ~divisor)

  This short-hand syntax is called punning.

  Now implement [modulo(~dividend, ~divisor)] using our version of divide with
  labelled arguments (e.g. [modulo(~dividend:7, ~divisor:2)] should equal 1)
 */
let modulo = (~dividend, ~divisor) => mod(dividend, divisor)

Test.runAll([
  (modulo(~dividend=17, ~divisor=5) == 2, "modulo"),
  (modulo(~dividend=99, ~divisor=9) == 0, "modulo"),
])

/*
  Many languages have a concept of "Null", which describes that some data is
  absent. In Reason, we can model the presence/absence data using ordinary
  variants.

  Note: we're defining the [option] type here to show you that it isn't magic.
  In real life you would always use the [option] type provided by the standard
  library.
 */
type option<'a> =
  | None
  | Some('a)

/*
  An [option('a)] is either [None], meaning absence of data, or [Some x]
  meaning the data exists, and that data specifically is [x]. Here's an
  example:
 */
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

Test.runAll([
  (
    switch safeDivide(~dividend=3, ~divisor=2) {
    | Some(1) => true
    | _ => false
    },
    "safe divide",
  ),
  (
    switch safeDivide(~dividend=3, ~divisor=0) {
    | None => true
    | _ => false
    },
    "safe divide",
  ),
])

/*
  In Reason, functions are values, so we can pass them in as
  arguments to other functions.

  To represent a function in a signature, you wrap its type in parenthesis,
  with arrows separating arguments and the type of the functions result.

  Recall: a function called add1 which takes an integer and returns an integer
  has the type
  let add1 : int => int

  so, to use that signature in a type, we'd write
  (int => int)

  We now define a function called mapOption.
  mapOption takes a function and an option.

  If the option has a value of None, mapOption returns None
  If the option has a value of Some x, the function is called on x, and
  wrapped up in a Some.

  This may seem unintuitive, but this kind of function is very useful.
  It means that you can continue working on data, and ignore if
  the data isn't there (no null pointer exceptions!)

  The signature for the function is

  let mapOption : (('a => 'b), option('a)) => option('b)
 */
let mapOption = (f, opt) =>
  switch opt {
  | None => None
  | Some(i) => Some(f(i))
  }

let double = i => 2 * i

let () = assert (mapOption(double, None) == None)

let () = assert (mapOption(double, Some(2)) == Some(4))

/*
  Instead of defining the function double beforehand, we can use an anonymous
  function.
 */
let () = assert (mapOption(i => 2 * i, Some(2)) == Some(4))

/*
  Define a function applyIfNonzero which takes a function from (int => int)
  and an int, and applies the function if the integer is not zero, and
  otherwise just returns 0.
 */
let applyIfNonzero = (_f, _i) => failwith("For you to implement")

Test.runAll([
  (applyIfNonzero(x => 10 / x, 0) == 0, "apply if non-zero"),
  (applyIfNonzero(x => 10 / x, 5) == 2, "apply if non-zero"),
])

/*
  It is common in all programming languages to want to store and operate on
  collections of the same data type. As you have seen in previous exercises,
  we can achieve this in Reason using the list('a) type, e.g. list(int),
  list(bool), list(list(string)).

  When you first learn to program in languages like C and Java, you use "for"
  loops to operate on all the elements of an array, e.g.:

    for (int i = 0; i < array.length(); i++) { do_something_with(array[i]); }

  In Reason, we use "higher order functions", in other words, functions which
  take other functions as input. Let's take a look at the [List.map] function,
  which has signature:

    let map : (('a => 'b), list('a)) => list('b)

  Let's read this signature together. It takes two arguments:
    1) a function from some type ['a] to some other type ['b]
    2) a list of ['a]s
  and then it returns a list of ['b]s.

  What map(f, la) does is take your function [f], apply it to each element of
  [la], and returns a new list [lb] here the the [i]th element of [lb] is
  equal to the function [f] applied to the [i]th element of [la].

  Let's see some examples:
 */
let myInts: list<int> = list{1, 2, 3, 4, 5}

let doubleMyInts = (ints): list<int> => List.map(x => x * 2, ints)

let () = assert (doubleMyInts(myInts) == list{2, 4, 6, 8, 10})

let myStrings = (ints): list<string> => List.map(string_of_int, ints)

let () = assert (myStrings(myInts) == list{"1", "2", "3", "4", "5"})

/*
  Exercise: implement the value [myNewInts], which is obtained by adding 1 to
  each element of [ints]
 */
let myNewInts = _ints => failwith("For you to implement")

/*
  If the function you want to perform on each element of your list is one that
  returns [unit], meaning that all it does is perform some side-effect (like
  [Js.log]), there is a higher-order function called [List.iter] which has the
  following signature:

  let iter:  ('a => unit, list('a)) => unit
 */
let () = List.iter(i => Js.log("here's an int: " ++ i), myStrings(myInts))

/*
  Another thing you might want to do with a list is combine all the elements
  together in some way. Here is the signature of [List.fold_left]:

  let fold_left: (('b, 'a) => 'b, 'b, list('a)) => 'b

  Let's say your list [l] contains [a1, a2, a3]. Then if you call
  fold_left(f, i, l), then it will end up computing:

    (f (f (f i a1) a2) a3)

  Here's an example of using [fold_left] to compute a sum:
 */
let sumOfMyInts = (ints): int => List.fold_left((total, myInt) => total + myInt, 0, ints)

let () = assert (sumOfMyInts(myInts) == 15)

/*
  Exercise: use [List.fold_left] to count even elements in [ints]
  
  Hint: Use the infix operator `mod`.
    (4 mod 2 == 0)
 */
let numEvenInts = _ints => failwith("For you to implement")

/*
  Here's one more example of a useful list function: [List.find]:

  let find: ('a => bool, list('a)) => 'a

 */
let firstNumGreaterThan3 = ints => List.find(x => x > 3, ints)

let () = assert (firstNumGreaterThan3(myInts) == 4)

Test.runAll([
  (myNewInts(myInts) == [2, 3, 4, 5, 6], "my new ints"),
  (numEvenInts(myInts) == 2, "num even ints"),
])

/*
  Reason, like many other languages, provides a way to interact with code via
  interfaces. This allows implementation details to be hidden away, and for
  grouped units of code to restrict how they are used.

  Here's an example of a module signature coupled with an implementation. The
  signature is wrapped in curly braces similar to the implementation.
 */
module Example: {
  /* Here, 'let' indicates that we are exposing a value. This value is an integer */
  let theMeaningOfLifeTheUniverseAndEverything: int
  /*
    To declare functions, again we use 'let' - in Reason, functions are values.
    This value takes an integer as a parameter and returns an integer
 */
  let subtractOne: int => int
} = {
  let theMeaningOfLifeTheUniverseAndEverything = 42
  let subtractOne = x => x - 1
}

/* Here's how we use these values */
let oneLessThanTheMeaningOfLifeEtc = Example.subtractOne(
  Example.theMeaningOfLifeTheUniverseAndEverything,
)

assert (oneLessThanTheMeaningOfLifeEtc == 41)

/*
  Types can be exposed via signatures in Reason as well. Here's an example of declaring
  an "abstract" type - one where the definition of the type is not exposed.
 */
module AbstractTypeExample: {
  /* We do not let the user know that [t] is an integer */
  type t
  /* This function allows [t] to be coerced into an integer */
  let toInt: t => int
  /* Users need some way to start with some [t] */
  let zero: t
  let one: t
  /* Let them do something with the [t] */
  let add: (t, t) => t
} = {
  type t = int
  let toInt = x => x
  let zero = 0
  let one = 1
  let add = (x, y) => x + y
}

/* Here's an example of adding 2 and 2 */
let two = AbstractTypeExample.add(AbstractTypeExample.one, AbstractTypeExample.one)

let four = AbstractTypeExample.toInt(AbstractTypeExample.add(two, two))

assert (four == 4)

module Fraction: {
  type t
  /*
    TODO: Add signatures for the create and value functions to expose them in
    the Fraction module.
 */
} = {
  type t = (int, int)
  let _create = (~numerator, ~denominator) => (numerator, denominator)
  let _value = ((numerator, denominator)) => float_of_int(numerator) /. float_of_int(denominator)
}
/* TODO: After adding signatures above uncomment the tests below */
/* Test.runAll([
     (
       Fraction.value(Fraction.create(~numerator=5, ~denominator=2)) == 2.5,
       "Fraction.value",
     ),
     (
       Fraction.value(Fraction.create(~numerator=4, ~denominator=10)) == 0.4,
       "Fraction.value",
     ),
   ]); */

/*
  As we've seen, in Reason, instead of for loops we use "higher order functions"
  to itereate over collections like lists. Higher order functions, in other
  words, are functions that take other functions as input. Let's take a deeper
  look at the [List.fold_left] function, which has the signature:

  let fold_left: (('a, 'b) => 'a, 'a, list('b)) => 'a

  'a is the type of the accumulator, and 'b is the type of the values in the
  input list.

  The 1st argument is a function for updating the accumulator. The 2nd
  argument is the initial accumulator value. The final argument is the list
  to process.

  List.fold_left walks over the list from left to right, updating the
  accumulator at each step and returning the final value of the accumulator
  when it's done.

  Let's revisit the sumOfMyInts example we've seen before. In this case, types
  'a and 'b are both equal to int.
 */
let ints = list{1, 2, 3}

let sumOfMyInts = List.fold_left((total, myInt) => total + myInt, 0, ints)

let () = assert (6 == sumOfMyInts)

/* Now let's use List.fold_left to write some other useful List functions. */
module MyList: {
  /*
    map(f, list) takes a function [f] from ('a => 'b) and a list('a) and
    returns a list('b) (e.g. [f] applied to each element)
 */
  let map: ('a => 'b, list<'a>) => list<'b>
  /*
    iter(f, list) calls [f] on each element in [list]. Since [f] returns
    [unit], there is nothing to return
 */
  let iter: ('a => unit, list<'a>) => unit
  /*
    filter(f, list) runs [f] on each element in [list] and returns a new list
    consisting of all elements [f] returned [true] for
 */
  let filter: ('a => bool, list<'a>) => list<'a>
} = {
  /* TODO */
  let map = (_f, _lst) => failwith("For you to implement")
  /* TODO */
  let iter = (_f, _lst) => failwith("For you to implement")
  /* TODO */
  let filter = (_f, _lst) => failwith("For you to implement")
}

/*
  Here are some other list functions that you may find useful in future
  exercises.

  You can see the full signature of the List module here:

  https://reasonml.github.io/api/List.html

  List.hd returns the first element of the list. It raises an exception if
  called on an empty list. The signature is:

  let hd: list('a) => 'a;
 */
let () = assert (List.hd(list{1, 2, 3}) == 1)

/*
  Similarly, List.tl returns all but the first element of the list. It also raises
  an exception if called on an empty list. The signature is:

  let tl: list('a) => list('a);
 */
let () = assert (List.tl(list{1, 2, 3}) == list{2, 3})

/*
  List.rev returns the reverse of the input list.

  let rev: list('a) => list('a);
 */
let () = assert (List.rev(list{1, 2, 3}) == list{3, 2, 1})

/*
  List.mem returns a bool indicating if the given element is contained in the
  list.

  let mem: ('a, list('a)) => bool;
 */
let () = assert List.mem(3, list{1, 2, 3})

/*
  List.sort returns a sorted list in increasing order according to the specified
  comparison function. The comparison function should return a negative number to
  indicate the first element is smaller, 0 to indicate they are equal, and a positive
  number to indicate the first element is larger.

  let sort: (('a, 'a) => int, list('a)) => list('a);
 */
let () = assert (List.sort((x, y) => x - y, list{3, 1, 2}) == list{1, 2, 3})

let acc = ref(0)

MyList.iter(x =>
  if x > acc.contents {
    acc := x
  }
, list{1, 8, 5, 2, 7, 3})

Test.runAll([
  (MyList.map(x => 2 * x, list{1, 2, 3, 4}) == list{2, 4, 6, 8}, "MyList.map"),
  (acc.contents == 8, "MyList.iter"),
  (MyList.filter(x => mod(x, 2) == 0, list{1, 3, 7, 8, 9, 2}) == list{8, 2}, "MyList.filter"),
])

/*
  Reason allows you to define record types. These are like structs in C.
  Or in Python, Ruby & Java, these are similar to data members or static
  variables of a class.
 */
/* Here is a [person] record type that contains four fields. */
/* The first field, called "age" is of type int. */
type person = {
  /* The name of the type is [person] */
  age: int,
  firstName: string,
  lastName: string,
  numberOfCars: int,
}

/*
  We can create a [person] like this. When defining and matching on a record,
  the fields can be listed in any order.
 */
let anExample: person = {
  firstName: "Cotton-eyed",
  lastName: "Joe",
  age: 22,
  numberOfCars: 0,
}

/*
  In order to get a field out of a record we use the "." operator:
  variable.field
 */
let age: int = anExample.age

let () = assert (age == 22)

/* We can also match on records to get field information. */
let print_info = ({firstName, lastName, age, numberOfCars}) => {
  print_endline(firstName)
  print_endline(lastName)
  print_endline("Age: " ++ string_of_int(age))
  print_endline("# of cars: " ++ string_of_int(numberOfCars))
}

/* If we don't care about an argument we can ignore it using "= _" */
let print_name = ({firstName, lastName, age: _, numberOfCars: _}) => {
  print_endline(firstName)
  print_endline(lastName)
}

/*
  Finally, we can perform "functional updates" by replacing the value of a
  field, yielding a brand new record. We use the ... spread operator to do
  this. The original record isn't mutated.

  let addOneToAge : person -> person
 */
let addOneToAge = person => {...person, age: person.age + 1}

let () = assert (23 == addOneToAge(anExample).age)

/*
  Write a function that does different things for different people:
  When the person's first name is "Jan", you should return a record with
  the age set to 30.

  Otherwise, you should increase the number of cars by 6.

  let modify_person : person -> person
 */
let modifyPerson = (_person: person) => failwith("For you to implement")

module ForTesting = {
  let test_ex1: person = {
    firstName: "Jan",
    lastName: "Saffer",
    age: 55,
    numberOfCars: 0,
  }
  let test_ex1': person = {...test_ex1, age: 30}
  let test_ex2: person = {
    firstName: "Hugo",
    lastName: "Heuzard",
    age: 4,
    numberOfCars: 55,
  }
  let test_ex2': person = {...test_ex2, numberOfCars: 61}
}

Test.runAll([
  (modifyPerson(ForTesting.test_ex1) == ForTesting.test_ex1', "modifyPerson"),
  (modifyPerson(ForTesting.test_ex2) == ForTesting.test_ex2', "modifyPerson"),
])

/*
  Sometimes rather than redefining the record you would like to have a field or
  a set of fields that you can modify on the fly.

  In Reason if you want to have a field in a record that can be updated in place,
  you must use some additional syntax. The mutable keyword makes the field
  modifiable.

  Then you can update those fields in place with the = operator.
 */
type color2 =
  | Red
  | Yellow
  | Green

type stoplight = {
  location: string /* stoplights don't usually move */,
  mutable color: color2 /* but they often change color */,
}

/* On creation mutable fields are defined just like normal fields */
let anExample: stoplight = {
  location: "The corner of Vesey Street and the West Side highway",
  color: Red,
}

/*
  Now rather than using a functional update we can use a mutable update.
  This doesn't return a new stoplight, it modifies the input stoplight.
 */
let setColor = (stoplight, color) => stoplight.color = color

/*
  Since we know that stoplights always go from Green to Yellow, Yellow to
  Red, and Red to Green, we can just write a function to advance the color
  of the light without taking an input color.
 */
let advanceColor = _stoplight => failwith("For you to implement")

module ForTesting2 = {
  let test_ex_red: stoplight = {location: "", color: Red}
  let test_ex_red': stoplight = {...test_ex_red, color: Green}
  let test_ex_yellow: stoplight = {location: "", color: Yellow}
  let test_ex_yellow': stoplight = {...test_ex_red, color: Red}
  let test_ex_green: stoplight = {location: "", color: Green}
  let test_ex_green': stoplight = {...test_ex_red, color: Yellow}
}

advanceColor(ForTesting2.test_ex_red)

advanceColor(ForTesting2.test_ex_yellow)

advanceColor(ForTesting2.test_ex_green)

Test.runAll([
  (ForTesting2.test_ex_red == ForTesting2.test_ex_red', "advance color"),
  (ForTesting2.test_ex_yellow == ForTesting2.test_ex_yellow', "advance color"),
  (ForTesting2.test_ex_green == ForTesting2.test_ex_green', "advance color"),
])

/*
  It is sometimes useful to create a single mutable value. We can do this
  using a ref. We can create an int ref containing 0 as follows:
 */
let x = ref(0)

/*
  Then we can access the value in the ref using the ^ operator, and
  we can update it using the := operator. So, we could increment our
  ref as follows:
 */
let () = x := x.contents + 1

/*
  Write a function minAndMax which returns a tuple containing the minimum
  and maximum values in a non-empty list of positive integers.

  Your function should iterate over the list and maintain refs of the minimum
  and maximum values seen so far.

  Hint: [max_int] or [min_int].
 */
let minAndMax = _lst => failwith("For you to implement")

Test.runAll([
  (minAndMax([5, 9, 2, 4, 3]) == (2, 9), "min and max"),
  (minAndMax([11, 15, 7, 34]) == (7, 34), "min and max"),
])
