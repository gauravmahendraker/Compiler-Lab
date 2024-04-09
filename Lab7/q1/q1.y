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

%token <count> ZERO
%token <count> ONE
%token END

%start Patt

%%

Patt: seq {};
 

seq:  seq ONE   {count=count*2+1;} |  seq ZERO {count=count*2;}|

%%

void yyerror(const char *s) {
   fprintf(stderr, " Not accepted");
   flag = 1;
}

int main() {
   yyparse();
   if(!flag)
   {
      printf("Binary to Dec %d \n", count);
   }
   return 0;
}