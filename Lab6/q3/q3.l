%{ 
  #include<stdio.h>
  #include "q3.tab.h"
  extern int yylval;
%}
%%
am | 
is | 
are | 
was | 
were | 
being | 
been | 
be | 
have | 
do | 
does | 
did | 
will | 
would | 
shall | 
should | 
may | 
might | 
must | 
can | 
could  { printf("%s: ", yytext); return HV;}
[a-zA-Z]+ { printf("%s: ", yytext); return NHV;}
[\t ]+ ;
.|\n 
%%

int yywrap()
{
 return 1;
}