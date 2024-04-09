
/* Lex program to Count the Positive numbers,  
      - Negative numbers and Fractions  */
  
%{ 
     /* Definition section */
    int postiveno=0; 
    int negtiveno=0; 
    int positivefractions=0; 
    int negativefractions=0; 
%} 
  
/* Rule Section */
DIGIT [0-9] 
%% 
  
\+?{DIGIT}+             postiveno++; 
-{DIGIT}+               negtiveno++; 
  
\+?{DIGIT}*.{DIGIT}+   positivefractions++; 
-{DIGIT}*.{DIGIT}+     negativefractions++; 
. ;    
%% 
  
// driver code 
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
    fprintf(output_file, "\nNo. of positive numbers: %d", postiveno);
    fprintf(output_file, "\nNo. of Negative numbers: %d", negtiveno);
    fprintf(output_file, "\nNo. of Positive numbers in fractions: %d", positivefractions);
    fprintf(output_file, "\nNo. of Negative numbers in fractions: %d\n", negativefractions);
    
    fclose(input_file);
    fclose(output_file);
    
    return 0;
}
