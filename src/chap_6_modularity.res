/*
  Every individual `.res` file compiles into a module. 

  A file named `hello.res` compiles to a module with the name `Hello`.

  You can put everything you've learned so far - bindings, expressions,
  control flow and functions within a ReScript module.

  Here is an example `hello.res`:

    ```
    let greet = name => `Hello, ${name}!`
    ```

  You can access the greet function from any other module like this:

    ```
    Hello.greet("visitor") // Hello, visitor!
    ```

  Modules can also be nested within a file. Here is an example:
 */

module GithubProject__WithoutInterface = {
  type t = {
    name: string,
    url: string,
    repositories: int,
    people: int,
  }

  let linkTo = t => `<a href="${t.url}">${t.name}</a>`
}

/*
  The main record type is given an abbreviated name `t`. This is a
  convention followed by ReScript programs. You can therefore refer
  to the type in this module as `GithubProject_WithoutInterface.t`.
 */

module GithubPWI = GithubProject__WithoutInterface

/*
  The module name is long and tedious to type often. Above we create
  an alias. This is shorter and easier to use. When you write `GithubPWI.t`
  it still means `GithubProject_WithoutInterface.t`.
 */

let atom: GithubPWI.t = {name: "Atom", url: "https://atom.io", repositories: 255, people: 56}

/*
  The record type inside the module is not visible in this lexical scope.
  You have to therefore manually annotate the type.

  -----------------------------------------------------------------------------
  Exercise 1 
  -----------------------------------------------------------------------------
  Remove the type annotation from `atom` to see the compiler error.

  The error message prescibes a couple of solutions. Try them out and move
  on when you are satisfied.
  -----------------------------------------------------------------------------
 */

atom->GithubPWI.linkTo // <a href="https://atom.io">Atom</a>

/*
  Prefix the module name to bring the function you want to call into
  the current scope. There are no additional rules to learn here. Calling or
  applying a function, works the same as you learned earlier.
*/

/*
module GithubProject__WithoutDataHiding: {
  type t = {
    name: string,
    url: string,
    repositories: int,
    people: int,
  }

  let linkTo: t => string
} = {
  type t = {
    name: string,
    url: string,
    repositories: int,
    people: int,
  }

  // used in linkTo
  // unnecessary - but useful for demonstration purposes
  let name = t => t.name
  let url = t => t.url

  let linkTo = t => `<a href="${t->url}">${t->name}</a>`
}

module Github2 = GithubProject__WithoutDataHiding

let node: Github2.t = {name: "Node.js", url: "https://nodejs.org", repositories: 182, people: 375}
node->Github2.linkTo
let node2 = {...node, people: node.people + 10}
let node3 = {...node2, repositories: node2.repositories + 1}
*/

/*
module GithubProject__WithOpaqueType: {
  type t

  let make: (~name: string, ~url: string, ~repositories: int, ~people: int) => t

  let linkTo: t => string

  let updatePeople: (t, int) => t
} = {
  type t = {
    name: string,
    url: string,
    repositories: int,
    people: int,
  }

  let make = (~name, ~url, ~repositories, ~people) => {
    name: name,
    url: url,
    repositories: repositories,
    people: people,
  }

  let linkTo = t => `<a href="${t.url}">${t.name}</a>`

  let updatePeople = (t, count) => {...t, people: t.people + count}
}

module Github3 = GithubProject__WithOpaqueType

let rails = Github3.make(
  ~name="Ruby on Rails",
  ~url="https://rubyonrails.org",
  ~repositories=99,
  ~people=66,
)
rails->Github3.linkTo

let rails2 = rails->Github3.updatePeople(5)
*/

/*
  -----------------------------------------------------------------------------
  Exercise 1
  -----------------------------------------------------------------------------
  Implement the following (immutable) functions:

  rails->Github3.name         // returns: "Ruby on Rails"
  rails->Github3.url          // returns: "https://rubyonrails.org"
  rails->Github3.repositories // returns: 99
  rails->Github3.people       // returns: 66

  let rails2 = rails->Github3.updateRepositories(1)
  rails2->Github3.repositories // returns: 100
  -----------------------------------------------------------------------------
*/
