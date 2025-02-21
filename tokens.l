%{
#include <stdio.h>
%}

%%

[a-z]*ae[a-z]*       { printf("Diptongo (ae): %s\n", yytext); }
[a-z]*ai[a-z]*       { printf("Diptongo (ai): %s\n", yytext); }
[a-z]*ao[a-z]*       { printf("Diptongo (ao): %s\n", yytext); }
[a-z]*au[a-z]*       { printf("Diptongo (au): %s\n", yytext); }

while                { printf("Palabra reservada de Java (while): %s\n", yytext); }
try                  { printf("Palabra reservada de Java (try): %s\n", yytext); }
switch               { printf("Palabra reservada de Java (switch): %s\n", yytext); }
static               { printf("Palabra reservada de Java (static): %s\n", yytext); }
new                  { printf("Palabra reservada de Java (new): %s\n", yytext); }

(00[01]*)|([01]*00) { printf("Palabra en {0,1} que inicia o termina con '00': %s\n", yytext); }

[0-9]+\.[0-9]+       { printf("Número decimal: %s\n", yytext); }
[0-9]+               { printf("Número entero: %s\n", yytext); }

[A-Z][a-zA-Z]*       { printf("Nombre propio (palabra que inicia con mayúscula): %s\n", yytext); }
[a-z]+               { printf("Palabra en minúsculas: %s\n", yytext); }

%%

int yywrap() { return 1; }

int main() {
    printf("Ingrese token a buscar (CTRL+D para terminar):\n");
    yylex();
    return 0;
}
