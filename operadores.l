%option noyywrap
%{
	#include <stdio.h>
%}
DIGIT [0-9]
OPERATOR [+*/-]
%%
{DIGIT}+ printf ("Numero: %s\n", yytext);
{OPERATOR} printf ("Operador: %s\n", yytext);
.	/* Ignorar otros caracteres */

%%
int main()
{ 
	yylex(); 
	return 0;
}