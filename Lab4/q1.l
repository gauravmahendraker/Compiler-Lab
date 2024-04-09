%{
#include <stdio.h>
int count = 0;
int offset = 2;
%}

%option noyywrap

%%

[a-zA-Z] {
    char c = yytext[0];
    int new_char = (c - 'a' + offset) % 26 + 'a'; // Apply offset and wrap around if necessary
    fprintf(yyout, "%c", new_char);
    count++;
    offset++;
    if (offset > 26) offset = 1; // Reset offset if it crosses 5
}
[^a-zA-Z] {
    fprintf(yyout, "%s", yytext);
}
<<EOF>> {
    fprintf(yyout, "\nTotal characters processed: %d\n", count);
    count = 0;
    offset = 2;
    return 0;
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

    fclose(input_file);
    fclose(output_file);

    return 0;
}
