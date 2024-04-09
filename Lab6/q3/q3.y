%{ 
   #include <ctype.h> 
   #include <stdio.h> 
   #define YYSTYPE double /* double type for yacc stack */ 
%} 

%start StartSymbol
%token HV
%token NHV

%%
 StartSymbol: StartSymbol Start | Start;
 Start : HV {printf("is a helping verb\n");}
 | NHV {printf("is not a helping verb\n");}
%% 

int main()
{
   yyparse();
   return 0;
}

void yyerror(){}