%{
#include "y.tab.h"
#include <cstdlib>
%}

%%

"while"        return WHILE;
"("            return '(';
")"            return ')';
"{"            return '{';
"}"            return '}';
";"            return ';';
"+"            return '+';
"="            return '=';

[0-9]+         { yylval.value = atoi(yytext); return num; }
[a-zA-Z]+      return id;

[ \t\n]        ;
.              return yytext[0];

%%

int yywrap() {
    return 1;
}