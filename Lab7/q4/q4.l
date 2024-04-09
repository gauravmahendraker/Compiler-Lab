%{
#include "q4.tab.h"
%}

%%
[a]          { return TokenA;}
[b]          {return TokenB; }
[\n]          { return 0; }
.           { return OTHER;}

%%

int yywrap() {
    return 1;
}