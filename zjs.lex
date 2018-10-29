/*
    Zoom Joy Strong Lexer
    Ben Townsend
*/


%{
    #include <stdio.h>  

    int numLines = 0;
%}



%%

END                 {printf("-END\n");}

;                   {printf("-END OF STATEMENT\n");
                     numLines++;
                    }

POINT               {printf("-POINT\n");}

LINE                {printf("-LINE\n");}

CIRLCE              {printf("-CIRLCE\n");}

RECTANGLE           {printf("-RECTANGLE\n");}

SET_COLOR           {printf("-SET COLOR\n");}

[0-9]+              {printf("-INT\n");}

[0-9]+\.[0-9]+      {printf("-FLOAT\n");}

[\t | " "]          ;

\n                  {numLines++;}
                    
.                   {printf("*ERROR - Line: %d\n",numLines);}

%%

int main(int argc, char** argv){
    yylex();
    return 0;
}
