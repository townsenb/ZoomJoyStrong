/*
    Zoom Joy Strong Lexer
    Ben Townsend
*/


%{
    #include <stdio.h>  

    int numLines = 0;
%}



%%

END                 {printf("\t-END\n");}

;                   {printf("\t-END OF STATEMENT\n");
                     numLines++;
                    }

POINT               {printf("\t-POINT\n");}

LINE                {printf("\t-LINE\n");}

CIRCLE              {printf("\t-CIRLCE\n");}

RECTANGLE           {printf("\t-RECTANGLE\n");}

SET_COLOR           {printf("\t-SET COLOR\n");}

[0-9]+              {printf("\t-INT\n");}

[0-9]+\.[0-9]+      {printf("\t-FLOAT\n");}

[\t | " "]          ;

\n                  {numLines++;}
                    
.                   {printf("\t*ERROR - Line: %d*\n",numLines);}

%%

int main(int argc, char** argv){
    yylex();
    return 0;
}
