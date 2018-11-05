/*
    Zoom Joy Strong Lexer
    Ben Townsend
*/


%{
    #include <stdio.h>  
    #include "zjs.tab.h"
    int numLines = 0;
%}



%%

[END|end]                   {return END;}

;                           {return EOL;}

[POINT|point]               {return POINT;}

[LINE|line]                 {return LINE;}

[CIRCLE|circle]             {return CIRCLE;}

[RECTANGLE|rectangle|rect]  {return RECTANGLE;}

[SET_COLOR|set_color]       {return SET_COLOR;}

[0-9]+                      {return INT;}

[0-9]+\.[0-9]+              {return FLOAT;}

[\t | " "]                  ;

\n                          {numLines++;}
                    
.                           {printf("\t*ERROR - Line: %d*\n",numLines);}

%%
