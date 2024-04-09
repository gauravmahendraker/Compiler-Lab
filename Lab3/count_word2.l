/*lex program to count number of words*/
%{ 
#include<stdio.h> 
#include<string.h> 
int count = 0; 
%} 


%% 
([a-z]) {printf("%c",yytext[0]-'a'+'A');}
([A-Z]) {printf("%c",yytext[0]-'A'+'a');}
<<EOF>> {printf("Total words: %d\n", count); count = 0;return 0;}


%%

int yywrap(void){} 

int main() 
{ 
	// The function that starts the analysis 
	FILE *file = fopen("input.txt", "r"); // Change "input.txt" to your desired file path
    if (!file) {
        perror("Error opening file");
        return 1;
    }
    
    // Set the input file for lexer
    yyin = file;
	yylex(); 
	
	return 0; 
} 
