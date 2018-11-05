
%{
    #include <stdio.h>
    #include "zoomjoystrong.h"
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

command:    POINT num num               {point($2,$3);}
       |    LINE num num num num        {line($2,$3,$4,$5);}
       |    CIRCLE num num num          {circle($2,$3,$4);}
       |    RECTANGLE num num num num   {rectangle($2,$3,$4,$5);}
       |    SET_COLOR num num num       {set_color($2,$3,$4);}
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
    fprintf(stderr, "*ERROR: %s*\n",msg);
}
