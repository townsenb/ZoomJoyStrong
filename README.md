# ZoomJoyStrong
Lexing/Parsing assignment CIS 343

compiled with: 
  flex zjs.lex
  bison -d zjs.y
  clang -o zjs *.c -lSDL2 -lm -lfl
