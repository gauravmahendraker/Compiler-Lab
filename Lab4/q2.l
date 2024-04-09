%{
#include <stdio.h>
int sf = 0, pf = 0;
%}

%%

"printf" {
    printf("printf found: %s\n", yytext); 
    pf++;
}
"printf"([.]*) {
    printf("printf found: %s\n", yytext); 
    pf++;
}
"scanf" {
    printf("Scanf found: %s\n", yytext); 
    sf++;
}
"scanf"([.]*) {
    printf("Scanf found: %s\n", yytext); 
    sf++;
}
[a-zA-Z0-9]+ {
    printf("scanf or printf not found : %s\n", yytext);
}

    
%%

int main() {
    FILE *input_file = fopen("input.txt", "r");
    FILE *output_file = fopen("output.txt", "w");

    if (!input_file || !output_file) {
        perror("Error opening file");
        return 1;
    }

    yyin = input_file;
    yyout = output_file;

    yylex();
    printf("Number of scanfs = %d\nNumber of Printfs = %d\n", sf, pf);
    fclose(input_file);
    fclose(output_file);

    return 0;
}
