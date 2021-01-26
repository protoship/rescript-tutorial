// modules
// module interfaces
// module opaque types

module GithubProject__WithoutReScriptInterface = {
  type t = {
    name: string,
    url: string,
    repositories: int,
    people: int,
  }

  let linkTo = t => `<a href="${t.url}">${t.name}</a>`
}

// Convention:
// types inside a module are named `t`
//
// alias for convenience
// don't want to repeatedly use long name
module Github1 = GithubProject__WithoutReScriptInterface

// call site
// type is moduleName dot t
let atom: Github1.t = {name: "Atom", url: "https://atom.io", repositories: 255, people: 56}
atom->Github1.linkTo // <a href="https://atom.io">Atom</a>

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

// exercise define name, url, repositories, people accessors
// exercise define addRepositories (immutable)
