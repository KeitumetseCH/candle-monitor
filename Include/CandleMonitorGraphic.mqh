//+------------------------------------------------------------------+
//|                                         CandleMonitorGraphic.mqh |
//|                                                  Terniti Digital |
//|                                      http://ternitidigital.co.za |
//+------------------------------------------------------------------+
#property copyright "Terniti Digital"
#property link      "http://ternitidigital.co.za"
#property strict

void showCandle(){
   string objName1 = "candleBody";
   ObjectCreate(0,objName1,OBJ_RECTANGLE_LABEL,0,0,0);
   ObjectSetInteger(0,objName1,OBJPROP_XDISTANCE,70); //Set object coordinates 
   ObjectSetInteger(0,objName1,OBJPROP_YDISTANCE,70); 
   ObjectSetInteger(0,objName1,OBJPROP_XSIZE,60); //Set object size 
   ObjectSetInteger(0,objName1,OBJPROP_YSIZE,70);
   ObjectSetInteger(0,objName1,OBJPROP_BGCOLOR,C'0,0,0'); 
   ObjectSetInteger(0,objName1,OBJPROP_BORDER_TYPE,BORDER_FLAT); 
   ObjectSetInteger(0,objName1,OBJPROP_CORNER,CORNER_RIGHT_UPPER);
   ObjectSetInteger(0,objName1,OBJPROP_COLOR,C'153,50,204');
   ObjectSetInteger(0,objName1,OBJPROP_STYLE,STYLE_SOLID); 
   ObjectSetInteger(0,objName1,OBJPROP_WIDTH,2); 
   ObjectSetInteger(0,objName1,OBJPROP_BACK,false); 
   ObjectSetInteger(0,objName1,OBJPROP_SELECTABLE,false); 
   ObjectSetInteger(0,objName1,OBJPROP_SELECTED,false); 
   ObjectSetInteger(0,objName1,OBJPROP_HIDDEN,true); 
   ObjectSetInteger(0,objName1,OBJPROP_ZORDER,0);
   
   string objName2 = "topWick";
   ObjectCreate(0,objName2,OBJ_RECTANGLE_LABEL,0,0,0);
   ObjectSetInteger(0,objName2,OBJPROP_XDISTANCE,43); //Set object coordinates 
   ObjectSetInteger(0,objName2,OBJPROP_YDISTANCE,40); 
   ObjectSetInteger(0,objName2,OBJPROP_XSIZE,4); //Set object size 
   ObjectSetInteger(0,objName2,OBJPROP_YSIZE,30);
   ObjectSetInteger(0,objName2,OBJPROP_BGCOLOR,C'0,0,0'); 
   ObjectSetInteger(0,objName2,OBJPROP_BORDER_TYPE,BORDER_FLAT); 
   ObjectSetInteger(0,objName2,OBJPROP_CORNER,CORNER_RIGHT_UPPER);
   ObjectSetInteger(0,objName2,OBJPROP_COLOR,C'153,50,204');
   ObjectSetInteger(0,objName2,OBJPROP_STYLE,STYLE_SOLID); 
   ObjectSetInteger(0,objName2,OBJPROP_WIDTH,2); 
   ObjectSetInteger(0,objName2,OBJPROP_BACK,false); 
   ObjectSetInteger(0,objName2,OBJPROP_SELECTABLE,false); 
   ObjectSetInteger(0,objName2,OBJPROP_SELECTED,false); 
   ObjectSetInteger(0,objName2,OBJPROP_HIDDEN,true); 
   ObjectSetInteger(0,objName2,OBJPROP_ZORDER,0);
   
   string objName3 = "bottomWick";
   ObjectCreate(0,objName3,OBJ_RECTANGLE_LABEL,0,0,0);
   ObjectSetInteger(0,objName3,OBJPROP_XDISTANCE,43); //Set object coordinates
   ObjectSetInteger(0,objName3,OBJPROP_YDISTANCE,139); 
   ObjectSetInteger(0,objName3,OBJPROP_XSIZE,4); //Set object size 
   ObjectSetInteger(0,objName3,OBJPROP_YSIZE,30);
   ObjectSetInteger(0,objName3,OBJPROP_BGCOLOR,C'0,0,0'); 
   ObjectSetInteger(0,objName3,OBJPROP_BORDER_TYPE,BORDER_FLAT); 
   ObjectSetInteger(0,objName3,OBJPROP_CORNER,CORNER_RIGHT_UPPER);
   ObjectSetInteger(0,objName3,OBJPROP_COLOR,C'153,50,204');
   ObjectSetInteger(0,objName3,OBJPROP_STYLE,STYLE_SOLID); 
   ObjectSetInteger(0,objName3,OBJPROP_WIDTH,2); 
   ObjectSetInteger(0,objName3,OBJPROP_BACK,false); 
   ObjectSetInteger(0,objName3,OBJPROP_SELECTABLE,false); 
   ObjectSetInteger(0,objName3,OBJPROP_SELECTED,false); 
   ObjectSetInteger(0,objName3,OBJPROP_HIDDEN,true); 
   ObjectSetInteger(0,objName3,OBJPROP_ZORDER,0);
   
   string objName4 = "candleTimeframe";     
   ObjectCreate(0,objName4,OBJ_EDIT,0,0,0);
   ObjectSetInteger(0,objName4,OBJPROP_XDISTANCE,64); //Set object coordinates 
   ObjectSetInteger(0,objName4,OBJPROP_YDISTANCE,72);
   ObjectSetInteger(0,objName4,OBJPROP_XSIZE,50); //Set object size  
   ObjectSetInteger(0,objName4,OBJPROP_YSIZE,20); 
   ObjectSetString(0,objName4,OBJPROP_TEXT,GetTimeFrame()); //Set the text 
   ObjectSetString(0,objName4,OBJPROP_FONT,"Arial"); 
   ObjectSetInteger(0,objName4,OBJPROP_FONTSIZE,9); 
   ObjectSetInteger(0,objName4,OBJPROP_ALIGN,ALIGN_CENTER); 
   ObjectSetInteger(0,objName4,OBJPROP_CORNER,CORNER_RIGHT_UPPER);
   ObjectSetInteger(0,objName4,OBJPROP_READONLY,true); 
   ObjectSetInteger(0,objName4,OBJPROP_COLOR,clrWhite); 
   ObjectSetInteger(0,objName4,OBJPROP_BGCOLOR,C'0,0,0'); 
   ObjectSetInteger(0,objName4,OBJPROP_BORDER_COLOR,C'0,0,0'); 
   ObjectSetInteger(0,objName4,OBJPROP_BACK,false); 
   ObjectSetInteger(0,objName4,OBJPROP_SELECTABLE,false); 
   ObjectSetInteger(0,objName4,OBJPROP_SELECTED,false); 
   ObjectSetInteger(0,objName4,OBJPROP_HIDDEN,true); 
   ObjectSetInteger(0,objName4,OBJPROP_ZORDER,0);
   
   string objName5 = "candleHigh";     
   ObjectCreate(0,objName5,OBJ_EDIT,0,0,0);
   ObjectSetInteger(0,objName5,OBJPROP_XDISTANCE,70); //Set object coordinates
   ObjectSetInteger(0,objName5,OBJPROP_YDISTANCE,20);
   ObjectSetInteger(0,objName5,OBJPROP_XSIZE,60); //Set object size  
   ObjectSetInteger(0,objName5,OBJPROP_YSIZE,25); 
   ObjectSetString(0,objName5,OBJPROP_TEXT,"0"); //Set the text
   ObjectSetString(0,objName5,OBJPROP_FONT,"Arial"); 
   ObjectSetInteger(0,objName5,OBJPROP_FONTSIZE,9); 
   ObjectSetInteger(0,objName5,OBJPROP_ALIGN,ALIGN_CENTER); 
   ObjectSetInteger(0,objName5,OBJPROP_CORNER,CORNER_RIGHT_UPPER);
   ObjectSetInteger(0,objName5,OBJPROP_READONLY,true); 
   ObjectSetInteger(0,objName5,OBJPROP_COLOR,clrWhite); 
   ObjectSetInteger(0,objName5,OBJPROP_BGCOLOR,C'0,0,0'); 
   ObjectSetInteger(0,objName5,OBJPROP_BORDER_COLOR,C'0,0,0'); 
   ObjectSetInteger(0,objName5,OBJPROP_BACK,false); 
   ObjectSetInteger(0,objName5,OBJPROP_SELECTABLE,false); 
   ObjectSetInteger(0,objName5,OBJPROP_SELECTED,false); 
   ObjectSetInteger(0,objName5,OBJPROP_HIDDEN,true); 
   ObjectSetInteger(0,objName5,OBJPROP_ZORDER,0);
   
   string objName6 = "candleSize";     
   ObjectCreate(0,objName6,OBJ_EDIT,0,0,0);
   ObjectSetInteger(0,objName6,OBJPROP_XDISTANCE,64); //Set object coordinates 
   ObjectSetInteger(0,objName6,OBJPROP_YDISTANCE,92);
   ObjectSetInteger(0,objName6,OBJPROP_XSIZE,50); //Set object size  
   ObjectSetInteger(0,objName6,OBJPROP_YSIZE,25); 
   ObjectSetString(0,objName6,OBJPROP_TEXT,"0"); //Set the text
   ObjectSetString(0,objName6,OBJPROP_FONT,"Arial"); 
   ObjectSetInteger(0,objName6,OBJPROP_FONTSIZE,9); 
   ObjectSetInteger(0,objName6,OBJPROP_ALIGN,ALIGN_CENTER); 
   ObjectSetInteger(0,objName6,OBJPROP_CORNER,CORNER_RIGHT_UPPER);
   ObjectSetInteger(0,objName6,OBJPROP_READONLY,true); 
   ObjectSetInteger(0,objName6,OBJPROP_COLOR,clrWhite); 
   ObjectSetInteger(0,objName6,OBJPROP_BGCOLOR,C'0,0,0'); 
   ObjectSetInteger(0,objName6,OBJPROP_BORDER_COLOR,C'0,0,0'); 
   ObjectSetInteger(0,objName6,OBJPROP_BACK,false); 
   ObjectSetInteger(0,objName6,OBJPROP_SELECTABLE,false); 
   ObjectSetInteger(0,objName6,OBJPROP_SELECTED,false); 
   ObjectSetInteger(0,objName6,OBJPROP_HIDDEN,true); 
   ObjectSetInteger(0,objName6,OBJPROP_ZORDER,0);
   
   string objName7 = "candleLow";     
   ObjectCreate(0,objName7,OBJ_EDIT,0,0,0);
   ObjectSetInteger(0,objName7,OBJPROP_XDISTANCE,70); //Set object coordinates
   ObjectSetInteger(0,objName7,OBJPROP_YDISTANCE,165);
   ObjectSetInteger(0,objName7,OBJPROP_XSIZE,60); //Set object size 
   ObjectSetInteger(0,objName7,OBJPROP_YSIZE,25); 
   ObjectSetString(0,objName7,OBJPROP_TEXT,"0"); //Set the text
   ObjectSetString(0,objName7,OBJPROP_FONT,"Arial"); 
   ObjectSetInteger(0,objName7,OBJPROP_FONTSIZE,9); 
   ObjectSetInteger(0,objName7,OBJPROP_ALIGN,ALIGN_CENTER);
   ObjectSetInteger(0,objName7,OBJPROP_CORNER,CORNER_RIGHT_UPPER); 
   ObjectSetInteger(0,objName7,OBJPROP_READONLY,true); 
   ObjectSetInteger(0,objName7,OBJPROP_COLOR,clrWhite); 
   ObjectSetInteger(0,objName7,OBJPROP_BGCOLOR,C'0,0,0'); 
   ObjectSetInteger(0,objName7,OBJPROP_BORDER_COLOR,C'0,0,0'); 
   ObjectSetInteger(0,objName7,OBJPROP_BACK,false); 
   ObjectSetInteger(0,objName7,OBJPROP_SELECTABLE,false); 
   ObjectSetInteger(0,objName7,OBJPROP_SELECTED,false); 
   ObjectSetInteger(0,objName7,OBJPROP_HIDDEN,true); 
   ObjectSetInteger(0,objName7,OBJPROP_ZORDER,0);
   
   string objName8 = "indicatorCandleCountdown";     
   ObjectCreate(0,objName8,OBJ_EDIT,0,0,0);
   ObjectSetInteger(0,objName8,OBJPROP_XDISTANCE,64); //Set object coordinates
   ObjectSetInteger(0,objName8,OBJPROP_YDISTANCE,113);
   ObjectSetInteger(0,objName8,OBJPROP_XSIZE,50); //Set object size 
   ObjectSetInteger(0,objName8,OBJPROP_YSIZE,25); 
   ObjectSetString(0,objName8,OBJPROP_TEXT,"00:00:00"); //Set the text
   ObjectSetString(0,objName8,OBJPROP_FONT,"Arial"); 
   ObjectSetInteger(0,objName8,OBJPROP_FONTSIZE,9); 
   ObjectSetInteger(0,objName8,OBJPROP_ALIGN,ALIGN_CENTER);
   ObjectSetInteger(0,objName8,OBJPROP_CORNER,CORNER_RIGHT_UPPER); 
   ObjectSetInteger(0,objName8,OBJPROP_READONLY,true); 
   ObjectSetInteger(0,objName8,OBJPROP_COLOR,clrWhite); 
   ObjectSetInteger(0,objName8,OBJPROP_BGCOLOR,C'0,0,0'); 
   ObjectSetInteger(0,objName8,OBJPROP_BORDER_COLOR,C'0,0,0'); 
   ObjectSetInteger(0,objName8,OBJPROP_BACK,false); 
   ObjectSetInteger(0,objName8,OBJPROP_SELECTABLE,false); 
   ObjectSetInteger(0,objName8,OBJPROP_SELECTED,false); 
   ObjectSetInteger(0,objName8,OBJPROP_HIDDEN,true); 
   ObjectSetInteger(0,objName8,OBJPROP_ZORDER,0);
}