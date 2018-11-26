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

command:    POINT INT INT              		{if($2 <= WIDTH && $2 >=0 && $3 <= HEIGHT && $3 >= 0){
	   											point($2,$3);
											 }else{
												printf("\t*OUT OF BOUNDS\n");
											 }}

       |    LINE INT INT INT INT        	{if($2 <= WIDTH && $2 >=0 && $3 <= HEIGHT && $3 >= 0
											 && $4 <= WIDTH && $4 >=0 && $5 <= HEIGHT && $5 >= 0){
												line($2,$3,$4,$5);
											 }else{
												printf("\t*OUT OF BOUNDS\n");
											 }}
											
       |    CIRCLE INT INT INT          	{if(($4 + $2 <= WIDTH) && ($2 - $4 >= 0)
											 && ($4 + $3 <= HEIGHT) && ($3 - $4 >= 0)){
												circle($2,$3,$4);
											 }else{
												printf("\t*OUT OF BOUNDS\n");
											 }}

	   |    RECTANGLE INT INT INT INT   	{if($2 <= WIDTH && $2 >=0 && $3 <= HEIGHT && $3 >= 0
											 && $4 <= WIDTH && $4 >=0 && $5 <= HEIGHT && $5 >= 0){
												rectangle($2,$3,$4,$5);
											}else{
												printf("\t*OUT OF BOUNDS\n");
											 }}
       
	   |    SET_COLOR INT INT INT       	{if($2 <= 255 && $2 >= 0 && $3 <= 255 && $3 >= 0 
											 && $4 <= 255 && $4 >= 0){
												set_color($2,$3,$4);
											}else{
												printf("\t*OUT OF BOUNDS\n");
											 }}
											;

%%

int main(){
    setup();
	yyparse();
	finish();
    return 0;
}


void yyerror(const char* msg){
    fprintf(stderr, "*ERROR: %s*\n",msg);
}

