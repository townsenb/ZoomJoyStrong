%{
    #include <stdio.h>  
%}

%%

END                 {printf("-END");}

;                   {printf("-END OF STATEMENT");}

POINT               {printf("-POINT");}

LINE                {printf("-LINE");}

CIRLCE              {printf("-CIRLCE");}

RECTANGLE           {printf("-RECTANGLE");}

SET_COLOR           {printf("-SET COLOR");}

[0-9]+              {printf("-INT");}

[0-9]+\.[0-9]+      {printf("-FLOAT");}

" " | \t | \n       {printf("-IGNORE")}

.                   {printf("-INVALID");}

%%

int main(int argc, char** argv){
    yylex();
    return 0;
}
