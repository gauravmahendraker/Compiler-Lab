%{
#include <stdio.h>
#include <string.h>

int yylex();
void yyerror(const char *s) {
    fprintf(stderr, "%s\n", s);
}

int op_count = 0;
int operand_count = 0;
%}

%union {
    char *str;
   
}

%token <str> NUM
%left ADD SUB
%left MUL DIV
%token OB CB
%token END


%%

input : expr END { printf("Total operands: %d\n", operand_count); printf("Total operators: %d\n", op_count); }
      ;

expr : expr ADD expr { op_count++;printf("Operator: +\n");  }
     | expr SUB expr { op_count++;  printf("Operator: -\n"); }
     | expr MUL expr { op_count++; printf("Operator: *\n"); }
     | expr DIV expr { op_count++;  printf("Operator: /\n"); }
     | OB expr CB {  }
     | NUM { operand_count++; printf("Operand: %s\n", $1); }
     ;

%%

int main() {
    printf("Enter an arithmetic expression: ");
    yyparse();
    return 0;
}