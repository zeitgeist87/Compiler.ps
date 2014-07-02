ps-compiler
===========

Small toy compiler for postscript written in postscript. Postscript is not
only a document format, but also a very powerful turing complete programming
language. It is so powerful, that the language itself contains a parser
for postscript. So it is very easy to use this parser and write a
compiler that translates postscript to x64 assembly.

This compiler is just a toy project. At the moment it is very primitive
and only implements a tiny subset of the postscript language. It is barely
enough to compile the nqueens problem from the demo directory.

## Usage

The compiler is implemented in "compile.ps" and it can be directly started with
ghostscript, but it is better to use it through the "compile.sh" bash script,
which contains some additional optimization routines.


```
sh compile.sh nqueens.ps
```

This will create two new files, namely "main.s" and "func.s". They contain
x64 assembly and can be compiled with gcc:

```
gcc -o nqueens main.s func.s
```

## Performance

The performance gains are substantial:

```
time ./nqueens
73712

real	0m7.925s
user	0m7.860s
sys	0m0.050s
```

```
time gs -q nqueens.ps 
73712

real	5m1.102s
user	5m0.383s
sys	0m0.090s
```



