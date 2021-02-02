/*
  Every individual `.res` file compiles into a module. 

  A file named `hello.res` compiles to a module with the name `Hello`.

  You can put everything you've learned so far - bindings, expressions,
  control flow and functions within a ReScript module.

  The directory structure of your project has no effect on the name
  of a compiled module. Only the file name matters.

  There are no explicit import/export statements to bring a module
  into scope. After successful compilation of a project, every module
  is available for use anywhere within the project.

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

/*
  Uncomment the line below.
 */
/*
module GithubProject__WithoutInterface = {
  type t = {
    name: string,
    url: string,
    repositories: int,
    people: int,
  }

  let linkTo = t => `<a href="${t.url}">${t.name}</a>`
}
*/

/*
  To refer to this nested module type from another module you will have
  to write:

    `Chap_6_modularity.GithubProject__WithoutInterface.t`

  Inside this module you can simply refer to the nested module as:

    `GithubProject_WithoutInterface.t`

  The main record type of this module has an abbreviated name - `t`.

  This is a convention followed by all ReScript programs. You can
  access the main type of a module like `TheModuleName.t`.
 */

/*
  Uncomment the line below.
 */
// module GithubPWI = GithubProject__WithoutInterface

/*
  The module name is long and tedious to type often. So we created an alias
  above. This is shorter and easier to use. When you write: `GithubPWI.t`, 
  it still refers to this: `GithubProject_WithoutInterface.t`.
 */

/*
  Uncomment the line below.
 */
// let atom: GithubPWI.t = {name: "Atom", url: "https://atom.io", repositories: 255, people: 56}

/*
  -----------------------------------------------------------------------------
  Exercise 1 
  -----------------------------------------------------------------------------
  The record type defined inside the module is not visible in this lexical
  scope. Therefore manual type annotation is necessary for the `atom` binding.

  Remove the type annotation from `atom` to see a compiler error.

  The error message prescribes a couple of solutions. Try them out and move
  on when you are satisfied.
  -----------------------------------------------------------------------------
 */

/*
  Uncomment the line below.
 */
// atom->GithubPWI.linkTo // <a href="https://atom.io">Atom</a>

/*
  Prefix the module name to bring the function you want to call into
  the current scope. There are no additional rules to learn here. Calling or
  applying a function, works the same as you learned earlier.
*/

/*
  Uncomment the line below.
 */
// let bookFormat: Chap_3_adt.bookFormat = Paperback

/*
  Any binding or type defined in the other modules are also available here.

  Above binding uses the variant type defined the `Chap_3_adt.res` file. 
  
  Here manual annotation is necessary. The `bookFormat` variant is not visible
  in the scope of this module. The type annotation informs the compiler.
 */

/*
  Uncomment the block below.
 */
/*
module GithubProject: {
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

  // let url = t => t.url

  let linkTo = t => `<a href="${t.url}">${t.name}</a>`
}
*/

/*
  There is some additional syntax here. The module definition is
  annotated with a type.

    ```
    module TheModuleName : TheModuleType = 
      TheModuleImplementation
    ```

  This is the type definition for `GithubProject`:

    ```
    {
      type t = {
        name: string,
        url: string,
        repositories: int,
        people: int,
      }

      let linkTo: t => string
    }   
    ```

  This is known as the interface of the module. Only those types
  and bindings defined in the interface will be publicly available
  for use in other modules.

  This interface defines the record type `t` and a function named
  `linkTo` which accepts this type `t` as input and returns a
  string.


  Everything defined inside the `GithubProject_WithoutInterface` module
  is public because it does not define its interface.

  Ideally you do not want to expose every implementation detail to
  the outside clients of the module. Instead you should think of the
  module interface as the API which the clients will use from
  other modules.

  Having an interface allows you to specify the constituents of that
  public API.

  The syntax you see here is only applicable for nested modules. So
  how do you add an interface for bindings, types and functions
  defined at the top level of a module?

  The answer is to create a separate interface file. This file has
  the extension `.resi`. The compiler understands that this is an
  interface and it only contains the type. It will look for the
  implementation of this interface in the `.res` file.

  -----------------------------------------------------------------------------
  Exercise 2
  -----------------------------------------------------------------------------
  The `linkTo` function is part of the interface for the `GithubProject`
  module.

  Remove or comment out the implementation code for `linkTo` from within this
  module.

  This will result in a compilation error. Read the generated compiler error.

  It essentially tells you that the `linkTo` function is declared in the
  interface, but the compiler did not find it's impementation within the
  module.

  Reverse your changes to fix the compilation error, and proceed.
  -----------------------------------------------------------------------------  
 */

/*
  Uncomment the block below.
 */
/*
let node: GithubProject.t = {
  name: "Node.js",
  url: "https://nodejs.org",
  repositories: 182,
  people: 375,
}

node->GithubProject.linkTo
*/

/*
  The `node` binding is a record type. So you update it in the same manner
  you would update **immutable** values.
*/

/*
  Uncomment the block below.
 */
/*
let node2 = {...node, people: node.people + 10}
let node3 = {...node2, repositories: node2.repositories + 1}
*/

/*
  -----------------------------------------------------------------------------
  Exercise 3
  -----------------------------------------------------------------------------
  Add the `url` function to the interface of `GithubProject` module to pass
  the test below.
  -----------------------------------------------------------------------------
*/

/*
  Uncomment the block below.
 */
/*
SimpleTest.assertEqual(
  ~expected="https://nodejs.org",
  ~actual=node3->GithubProject.url,
  ~msg="[exercise 3] github project url",
)
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
