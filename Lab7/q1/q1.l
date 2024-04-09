%{
#include "q1.tab.h"
%}

%%
[0]          { return ZERO;}
[1]          {return ONE; }
[\n]          { return 0; }
.           { }

%%

int yywrap() {
    return 1;
}