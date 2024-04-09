%{
#include <stdio.h>
#include "q2.tab.h"
%}

%%

\n { return END; }
[0-9]+ { yylval.str = yytext; return NUM; }
"+" { return ADD; }
"-" { return SUB; }
"*" { return MUL; }
"/" { return DIV; }
"(" { return OB; }
")" { return CB; }
[ \t] { /* Ignore whitespace */ }
. { yyerror("Invalid character"); }

%%

int yywrap() {
    return 1;
}