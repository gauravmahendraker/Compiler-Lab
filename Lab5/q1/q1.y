%{
#include <stdio.h>
int yylex();
void yyerror(const char *s);
int As = 0;
int Bs = 0;
int flag=0;


%}

%union {
    int count;
}

%token <count> TokenA
%token <count> TokenB
%token OTHER EL

%type <count> A_seq
%type <count> B_seq

%start Patt

%%

Patt: TokenA TokenB TokenA seq {};
 

seq: seq TokenA | seq TokenB | ;
A_seq: TokenA A_seq {  As++;}
            | /* empty */ ;

B_seq: TokenB B_seq {Bs++;}
            | /* empty */ ;

%%

void yyerror(const char *s) {
   fprintf(stderr, " Not accepted");
   flag = 1;
}

int main() {
   yyparse();
   if(!flag)
   {
      printf("String Accepted: %d A's followed by %d B's\n", As, Bs);
   }
   return 0;
}