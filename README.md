# Getting started

```
npm install
npm run start
```

Then open VSCode in the same directory:

```
code .
```

Open the first chapter - `chap_1_immutable.res`. Follow the instructions in the
file. As you're editing the code, watch the terminal where you ran `npm run start`. It will show any errors from the ReScript compiler and you will have to refer to it often as you're working through the exercises.

The ReScript compiler compiles the `.res` files gets into `.bs.js` files. For the first chapter, that would be `chap_1_immutable.bs.js`. You should open that file as well in a new window by pressing CTRL+O (CMD+O in Mac) and selecting the correct `.bs.js` file. Keep both `.res` file and `.bs.js` file side-by-side so you can see how the ReScript you write gets compiled to JavaScript in real-time.


## Sections

1. Immutable bindings
2. Functional programming techniques
3. Algebraic data types
4. Parametric polymorphism, Collections, Optional
5. Bindings, Mutation
6. Modularity

## TODO

- diff expected/received for large inputs
- add standalone exercises
  - rendering HTML from `markup` (self-referential)
  - dns resolver
  - see introduction to ruby (Jasim) for array/hash exercises
- add long-form narrative to chapters
- nice to have
  - add an exericse for using Option.map
  - add an exercise for parsing JSON object
  - add a binding to Node.js API and use it
  - add an exercise for mutation using `ref`
