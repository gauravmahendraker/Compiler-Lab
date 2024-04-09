%{
#include<stdio.h>
int single_line_comment = 0;
int multiple_line_comment = 0;
%}          

%%

"//".* {printf("Single line comment: %s\n", yytext); single_line_comment++;}
"/*"([^*]|[*][^/])*"*/" {printf("Multi line comment : %s\n", yytext); multiple_line_comment++;}

. { } // Discard any other characters
\n  // Discard newline characters

%%

int yywrap(void) {}

int main() {
    FILE *fp;
    fp = fopen("input2.txt", "r");
    if (fp == NULL) {
        printf("Couldn't open file");
        return 0;
    }
    yyin = fp;
    yylex();
    printf("Single line comments: %d\n", single_line_comment);
    printf("Multiple line comments: %d\n", multiple_line_comment);
    fclose(fp);
    return 0;
}
