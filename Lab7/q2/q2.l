
%{
#include "q2.tab.h"
%}

%%
[0-9a-zA-Z]+@[a-zA-Z.]*[a-zA-Z]  { return EMAIL;}
[\n]          { return 0; }
.           { }

%%

int yywrap() {
    return 1;
}