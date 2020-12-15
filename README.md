## Prerequisites

Install:

- Node Version Manager
- Node.js
- npm package manager
- pnpm (faster, disk space efficient than npm)

Setup nvm, Node.js, npm & pnpm

```
#
# Install Node Version Manager
# Verify the installation
# Follow instructions from here - https://github.com/nvm-sh/nvm
#

#
# Install a recent `Node.js` with the latest working `npm` for
# that node version
#

$ nvm install lts/fermium --latest-npm

#
# Install fast, disk space efficient package manager
# (alternative to npm)
#

$ npm install -g pnpm

```

## Learn ReasonML Workshop

- Introduction: code-compile cycle, fix syntax error
- Six Basic Types: int, float, char, string, bool, & unit (let keyword)
- Define functions
- Call Functions
- Twice (function composition, higher order functions)
- Pattern Matching (on strings, numbers)
- Recursive functions
- Introduction to Lists
- List Range (range(1, 4) == [1, 2, 3])
- List Product (multiply elements of a list)
- Sum Product (generalizing higher order functions)
- Find smallest/largest element in a list
- (?) largest/smallest puzzle
- Variants
- Tuples (Paramaterized type pair('a) = ('a, 'a))
- Labelled arguments
- Option type
- Anonymous functions (Option.map)
- List operations (map, iter, fold_left, find)
- Reading sigs, Modules (module interface types inline in .re)
- Writing list operations (map, iter, filter using fold_left)
- Record types
- Mutable records
- Refs

## ReScript Language Manual

- Overview
  - Language Positioning
  - Difference vs TypeScript
  - Other Benefits Highlighted
- Try it online - playground
- Language Features Overview
  - Comparison to JS
  - Common Features JS Output
  - Let Binding
    - Block Scope
    - Bindings are immutable
    - Binding Shadowing
  - Type
    - Inference
    - Annotation
    - Alias
    - Parameter (Generic)
    - Recursive
    - Mutually Recursive
    - Type Escape Hatch `%identity` (for use with external code)
  - Primitive Types: String, Char, Regex, Boolean, Integers, Floats, Unit
  - Tuple (structural typing)
  - Record (JS Objects) / nominal typing vs structural typing
    - CRUD
    - Immutable update
    - Mutable update (`mutable`)
    - Compiled JS output
  - Object
    - Type declaration
    - Creation
    - Access
    - Update
  - Variant
    - Definition
    - Constructor Arguments
    - Inline Record
    - Compiled JS Output
  - Null, Undefined & Option
  - Array `Js.Array` & List
  - Function
    - Labelled arguments
    - Optional Labelled arguments
    - Recursive functions
    - Uncurried function (remove curry runtime)
  - Control Flow
    - If-Else & Ternary
    - For Loops
    - While Loops
  - Pipe
    - JS Method Chaining
    - Pipe into Variants
    - Placeholders
    - Data-first vs. Data-last (Javier Chávarri)
  - Pattern Matching/Destructuring
    - Destructuring
    - Rename a field while destructuring
    - switch
      - fall through
      - when clause
      - exceptions
      - exhaustive
  - Mutation
  - JSX
  - Exception (are exceptional)
    - Composable error handling (Vladimir Keleshev)
    - Catching JS exceptions
    - Raise a JS exception
    - Catch ReScript exceptions from JS
  - Lazy Value
  - Async & Promise
  - Module
    - Basics
    - Signatures
    - Functors
  - Import/Export
  - Attribute (decorator)
    - Annotations
    - Extension Points
  - Unboxed
    - record with single field
    - variant with a single constructor
- JavaScript Interop
  - Embed Raw JavasScript
    - debugger
  - Shared Data Types
  - External Bind to any JS library
  - Bind to Objects
  - Bind to JS Function
  - Import from/Export to JS
  - Bind to global JS values
  - JSON
  - Inlining Constants
  - Use illegal identifier names
  - Browser Support & Polyfills

## Real World OCaml (A Guided Tour)

- OCaml as a Calculator
- Functions & Type Inference
- Inferring Generic Types
- Type errors vs exceptions
- Tuples, Lists, Options, and Pattern Matching
- Recursive list functions
- Options
- Records & Variants
- Imperative Programming
  - Arrays
  - Mutable Record Fields
  - Refs
  - For & while loops
- A complete program

## Common & Useful

- Stdlib vs. Belt
- Js.Date
  - https://dev.to/dmtrkovalenko/you-might-not-need-date-fns-23f7
  - https://momentjs.com/docs/#/-project-status/
- Unicode
- Utils
- Fetch
- XMLHttpRequest `xhr`
- bs-json
- maps & hash tables
- cli parsing
- dom, webapis, canvas
- https://github.com/ostera/reason-design-patterns
- Obj.Magic

## DOM & other Web APIs

- Global objects
  - window
  - alert
  - navigator
  - location
- Document
  - body, location, title
  - getElementById, querySelector, querySelectorAll
- Events
  - Delegation, bubbling, capturing, browser default actions
  - Clipboard
  - Drag & Drop
  - Fullscreen
  - Keyboard
  - Load/Unload
  - Pointer/Touch
- Styles & Classes
  - getComputedStyle
  - getBoundingClientRect
  - scrolling elements, windows
- Forms
  - events like change, cut, copy, paste
  - submit
  - focus
- Event Loop
  - setTimeout/setInterval
  - blocking the main thread
  - requestAnimationFrame
- Selection/Range
  - boundary points (start, end)
- Storage
  - Cookies
  - Session
  - LocalStorage
  - IndexedDB
- Animation
  - CSS - bezier curve
  - Javascript using canvas
- Regular expressions (just enough to be dangerous)
- History
  - moving back/forward
  - go to specific point in history
  - pushState
  - replaceState
