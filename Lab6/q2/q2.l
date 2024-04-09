%{
#include "Q2.tab.h"
%}

%%

"("             { yylval = '('; return OP; }
")"             { yylval = ')'; return CP; }
"{"             { yylval = '{'; return OB; }
"}"             { yylval = '}'; return CB; }
[\n]            ; 
.               ; 
<<EOF>>  { return END;}

%%

int yywrap() {
    return 1;
}