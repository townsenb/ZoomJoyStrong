
%{
    #include <stdio.h>
    void yyerror(const char* msg);
    int yylex();
%}

%token END
%token EOL
%token INT
%token FLOAT
%token POINT
%token LINE
%token CIRCLE
%token RECTANGLE
%token SET_COLOR

%%

program:    expr_list END
            ;

expr_list:  expr
         |  expr_list expr
            ;

expr:       command EOL
            ;

command:    POINT num num
       |    LINE num num num num
       |    CIRCLE num num num
       |    RECTANGLE num num num num
       |    SET_COLOR num num num
            ;
            
num:        INT
   |        FLOAT
            ;
%%

int main(){
    yyparse();
    return 0;
}

void yyerror(const char* msg){
    fprintf(stderr, "*ERROR %s*\n",msg);
}
