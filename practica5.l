%option noyywrap

%{
#include <stdio.h>
int comentario_count = 0; 
%}

%%

"if"|"else"|"while"|"for"|"return"|"int"|"float"|"char" {
    printf("Palabra reservada: %s\n", yytext);
}

"//".* {
    comentario_count++;
    printf("Comentario de linea detectado. Total: %d\n", comentario_count);
}

"/*"([^*]|\*[^/])*"\*/" {
    comentario_count++;
    printf("Comentario de bloque detectado. Total: %d\n", comentario_count);
}

[a-zA-Z_][a-zA-Z0-9_]* {
    printf("Identificador de variable: %s\n", yytext);
}

[\+\-\*/%] {
    printf("Operador aritmetico: %s\n", yytext);
}

"&&"|"||"|"!" {
    printf("Operador logico: %s\n", yytext);
}

[ \t\n] ; // Ignorar espacios, tabulaciones y saltos de linea

. ; // Ignorar cualquier otro caracter no reconocido

%%

int main() {
    printf("Ingrese codigo en C para analizar:\n");
    yylex();

    printf("\n");
    printf("Total de comentarios encontrados: %d\n", comentario_count);
    return 0;
}
