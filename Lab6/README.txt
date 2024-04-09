To compile the file to generate the executable run the following commands:
For question 1(q1):
bison -d q1.y       # Generate parser files (q1.tab.c and q1.tab.h)
flex q1.l           # Generate lexer file (lex.yy.c)
gcc q1.tab.c lex.yy.c -o q1 -lfl  # Compile and link the parser and lexer files

For question 2(q2):
bison -d q2.y       # Generate parser files (q2.tab.c and q2.tab.h)
flex q2.l           # Generate lexer file (lex.yy.c)
gcc q2.tab.c lex.yy.c -o q2 -lfl  # Compile and link the parser and lexer files

For question 3(q3):
bison -d q3.y       # Generate parser files (q2.tab.c and q2.tab.h)
flex q3.l           # Generate lexer file (lex.yy.c)
gcc q3.tab.c lex.yy.c -o q3 -lfl  # Compile and link the parser and lexer files

To run executable run:
./q1
./q2
./q3