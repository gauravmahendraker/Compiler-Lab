%{
#include <stdbool.h>
#include <stdio.h>
extern FILE *yyin;
int yylex();
bool balanced =true;
void yyerror(const char *t);
%}

%token OP CP OB CB END

%%

input: input END {printf("Balanced \n");exit(0);};
     | input input 
     | OP input CP
     | OB input CB
     | 
     ;


%%

void yyerror(const char *t) {
    balanced=false;
    return;
}

int main(int argc, char *argv[]) {
    
    FILE *file = fopen("Input.c", "r");
    if (!file) {
        fprintf(stderr, "Error: Cannot open file %t\n");
        return 1;
    }
    yyin = file;
    yyparse();
    fclose(file);
     if (balanced) {
        printf("Balanced INPUT\n");
    } else {
        printf("Unbalanced INPUT\n");
    }
    return 0;
}