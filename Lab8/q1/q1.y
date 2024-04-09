%{
#include <stdio.h>
int yylex();
 
void yyerror(char *);
 
%}

%token NUMBER
%left '+'  '-'
%left '*'  '/'
%right UMINUS
%right '^'

%%
lines: E '\n' { printf("\n");}
	|
	;
E :E'+'E { printf(" + ");}
  |E'-'E { printf(" - ");}
  |E'*'E { printf(" * ");}
  |E'/'E { printf(" / ");}
  |'('E')' 
  |NUMBER { printf("%g ",yylval);}
  ;



%%

void yyerror(char *s) {
 fprintf(stderr, "%s\n", s);
}



int main(void) {
 printf("\nEnter the infix : ");
 yyparse();
 return 0;
} 