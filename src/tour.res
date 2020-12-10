//
// ReScript compiles down to JavaScript. The generated JavaScript is
// readable. You can run it in the browser and also Node.js.
//
// The ReScript compiler generated JavaScript has the file extension
// which ends in `bs.js` to differentiate them from regular JavaScript
// files. The `bs` stands for BuckleScript compiler -- an earlier name
// before being rebranded as the ReScript compiler.
//
// To build this tutorial you can run the following command from the
// root directory.
//
//    $ npm run start
//
// This will build the project in watch mode. Any changes you make to
// this file will be detected and the build will automatically re-run.
//
// ReScript projects are built using `bsb` build system. You can look
// inside `package.json` to see that `start` command is an alias for
// building this project:
//
//    bsb -make-world -w
//
// The build will fail because the code below has a syntax error.
//
// The ReScript complier provides clear error messages which will help
// you a catch a whole class of error at compile-time. So read the
// error message and try to fix the code below.
//
// After you save your changes to file the build will re-rerun
// automatically. When there are zero errors remaining, the build
// will succeed.
//
// After the build succeeds you can look at the generated JavaScript
// code which will be in this file: `tour.bs.js`. It should contain
// the equivalent line in JavaScript:
//
//    console.log("Hello, World!");
//

Js.log("Hello, World!")
