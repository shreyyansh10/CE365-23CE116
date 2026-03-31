%{
#include <iostream>
using namespace std;

void yyerror(const char *s);
int yylex();
%}

%union {
    int value;
}

%token WHILE id
%token <value> num

%%

S : WHILE '(' E ')' '{' S '}' 
    { cout << "Valid while loop\n"; }
  | S S
  | id '=' E ';'
  ;

E : E '+' T
  | T
  ;

T : id
  | num
  ;

%%

void yyerror(const char *s) {
    cout << "Syntax Error\n";
}

int main() {
    cout << "Enter code:\n";
    yyparse();
    return 0;
}