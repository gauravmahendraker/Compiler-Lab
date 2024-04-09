%{
#include "q1.tab.h"
%}

%%
[0]          {return TokenA; }
[1]          { return TokenB; }
[\n]          { return 0; }
.           { }

%%

int yywrap() {
    return 1;
}