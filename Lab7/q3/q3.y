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

%token <count> DIGIT


%start Patt

%%

Patt: DIGIT {};

%%

void yyerror(const char *s) {
   fprintf(stderr, " Not DIGIT");
   flag = 1;
}

int main() {
   yyparse();
   if(!flag)
   {
      printf("Is a DIGIT");
   }
   return 0;
}