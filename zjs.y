/*
	Ben Townsend
*/

%{
    #include <stdio.h>
    #include "zoomjoystrong.h"
    void yyerror(const char* msg);
    int yylex();
%}

%union{
	int iVal;
	float fVal;
}

%token END
%token EOL
%token <iVal> INT
%token <fVal> FLOAT
%token POINT
%token LINE
%token CIRCLE
%token RECTANGLE
%token SET_COLOR


%%

program:    expr_list
            ;

expr_list:  expr
         |  expr_list expr
            ;

expr:       command EOL
            ;

command:    POINT INT INT              	{printf("\tpoint %d %d\n",$2,$3);point($2,$3);}
       |    LINE INT INT INT INT        {printf("\tline %d %d %d %d\n",$2,$3,$4,$5);line($2,$3,$4,$5);}
       |    CIRCLE INT INT INT          {printf("\tcircle\n");circle($2,$3,$4);}
       |    RECTANGLE INT INT INT INT   {printf("\trectangle\n");rectangle($2,$3,$4,$5);}
       |    SET_COLOR INT INT INT       {printf("\tset color\n");set_color($2,$3,$4);}
			;
         

%%

int main(){
    setup();
	yyparse();
    return 0;
}


void yyerror(const char* msg){
    fprintf(stderr, "*ERROR: %s*\n",msg);
}

