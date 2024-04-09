%{
#include <stdio.h>
int yylex();
void yyerror(const char *s);
int count = 0;
int flag=0;


%}

%union {
    int count;
}

%token <count> TokenA
%token <count> TokenB
%token END OTHER

%start Patt

%%

Patt: seq {};
 

seq: TokenA seq  TokenB  {count=count+1;} |

%%

void yyerror(const char *s) {
   fprintf(stderr, " Not anbn form");
   flag = 1;
}

int main() {
   yyparse();
   if(!flag)
   {
      printf("Accepted anbn form with n= %d \n", count);
   }
   return 0;
}