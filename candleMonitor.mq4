//+------------------------------------------------------------------+
//|                                                CandleMonitor.mq4 |
//|                                                     KeitumetseCH |
//|                          https://keitumetse.ternitidigital.co.za |
//+------------------------------------------------------------------+
#property copyright ""
#property link      ""
#property version   "1.00"
#property strict
#property indicator_chart_window

#include <CandleMonitorGraphic.mqh>
 
input ENUM_TIMEFRAMES Timeframe = PERIOD_H4; //Candle Timeframe
input string TargetHotKey = "t"; //Target Hotkey
input bool ShowCandleStart = false; //Show Candle Start

bool adjustTarget = false;
double price = 0;
datetime dt = 0;
double target;
bool targetRemoved = true;
 
//VOID INITIALISATION
void init(){
   showCandle();
   
   EventSetTimer(1);
}
//VOID START
void start(){
   double candleHigh = iHigh(0,Timeframe,0); //Get highest price of the current price
   double candleLow = iLow(0,Timeframe,0); //Get lowest price of the current price
   double candleOpen = iOpen(0,Timeframe,0); //Get open price of the current price
   
   double candleHighPoints = NormalizeDouble((candleHigh - candleOpen) / _Point,Digits); //Convert candle high to points
   double candleLowPoints = NormalizeDouble((candleOpen - candleLow) / _Point,Digits); //Convert candle low to points
   double candleSize = NormalizeDouble((candleOpen - Bid) / _Point,Digits); //Convert candle size to points
   
   if(candleOpen > Bid){ //Change indicator colour to red
      candleLowPoints = NormalizeDouble((Bid - candleLow) / _Point,Digits);
      ObjectSetInteger(0,"candleBody",OBJPROP_COLOR,C'255,0,0');
      ObjectSetInteger(0,"topWick",OBJPROP_COLOR,C'255,0,0');
      ObjectSetInteger(0,"bottomWick",OBJPROP_COLOR,C'255,0,0');
   }else{ //Change indicator colour to green
      candleHighPoints = NormalizeDouble((candleHigh - Bid) / _Point,Digits);
      ObjectSetInteger(0,"candleBody",OBJPROP_COLOR,C'0,255,0');
      ObjectSetInteger(0,"topWick",OBJPROP_COLOR,C'0,255,0');
      ObjectSetInteger(0,"bottomWick",OBJPROP_COLOR,C'0,255,0');
   }
 
   ObjectSetString(0,"candleHigh",OBJPROP_TEXT,StringConcatenate(candleHighPoints)); //Show candle high points on charts
   ObjectSetString(0,"candleSize",OBJPROP_TEXT,StringConcatenate(fabs(candleSize))); //Show candle size points on charts
   ObjectSetString(0,"candleLow",OBJPROP_TEXT,StringConcatenate(candleLowPoints)); //Show candle low points on charts
   
   if(ObjectGetDouble(0,"Target Line",OBJPROP_PRICE) != 0){ //Show target in points
      target = NormalizeDouble(ObjectGetDouble(0,"Target Line",OBJPROP_PRICE),Digits);
      targetRemoved = false;
      
      string objName9 = "candleTarget";     
      ObjectCreate(0,objName9,OBJ_EDIT,0,0,0);
      ObjectSetInteger(0,objName9,OBJPROP_XDISTANCE,70); //Set object coordinates
      ObjectSetInteger(0,objName9,OBJPROP_YDISTANCE,195);
      ObjectSetInteger(0,objName9,OBJPROP_XSIZE,60); //Set object size 
      ObjectSetInteger(0,objName9,OBJPROP_YSIZE,25); 
      ObjectSetString(0,objName9,OBJPROP_TEXT,StringConcatenate(fabs(NormalizeDouble((target - Bid) / _Point,Digits)))); //Set the text
      ObjectSetString(0,objName9,OBJPROP_FONT,"Arial"); 
      ObjectSetInteger(0,objName9,OBJPROP_FONTSIZE,9); 
      ObjectSetInteger(0,objName9,OBJPROP_ALIGN,ALIGN_CENTER);
      ObjectSetInteger(0,objName9,OBJPROP_CORNER,CORNER_RIGHT_UPPER); 
      ObjectSetInteger(0,objName9,OBJPROP_READONLY,true); 
      ObjectSetInteger(0,objName9,OBJPROP_COLOR,clrWhite); 
      ObjectSetInteger(0,objName9,OBJPROP_BGCOLOR,C'255,128,0'); 
      ObjectSetInteger(0,objName9,OBJPROP_BORDER_COLOR,C'255,128,0'); 
      ObjectSetInteger(0,objName9,OBJPROP_BACK,false); 
      ObjectSetInteger(0,objName9,OBJPROP_SELECTABLE,false); 
      ObjectSetInteger(0,objName9,OBJPROP_SELECTED,false); 
      ObjectSetInteger(0,objName9,OBJPROP_HIDDEN,true); 
      ObjectSetInteger(0,objName9,OBJPROP_ZORDER,0);
   }else{
      if(!targetRemoved){
         ObjectDelete(0, "candleTarget");  //Delete target from chart
         targetRemoved = true;
      }
   }
}
//-----------------------------------------------------------------------------
void deinit(){ //Delete indicator graphic interface from chart
   ObjectDelete(0, "candleBody");
   ObjectDelete(0, "topWick");
   ObjectDelete(0, "bottomWick");
   ObjectDelete(0, "candleTimeframe");
   ObjectDelete(0, "candleHigh");
   ObjectDelete(0, "candleSize");
   ObjectDelete(0, "candleLow");
   ObjectDelete(0, "indicatorCandleCountdown");
   ObjectDelete(0, "candleTarget");
   ObjectDelete(0, "CurrentCandleStart");
   
   EventKillTimer();
}
//-----------------------------------------------------------------------------
string GetTimeFrame(){ //Convert chart timeframe to string
   switch(Timeframe){
      case 1: return("1 Min");
      case 5: return("5 Min");
      case 15: return("15 Min"); 
      case 30: return("30 Min");
      case 60: return("1 Hour");
      case 240: return("4 Hour");
      case 1440: return("Daily");
      case 10080: return("Weekly"); 
      case 43200: return("Monthly");
      default: return("Null");
   }
}
void OnTimer(){ //Calculate time until candle closes
   datetime currentCandleOpen = iTime(_Symbol,Timeframe,0); //Current candle open time
   datetime currentTime = TimeCurrent(); //Current time
   datetime currentCandleClose = currentCandleOpen + (Timeframe * 60); //Calculate current candle close time
   datetime countdown = currentCandleClose - currentTime; //Countdown
   ObjectSetString(0,"indicatorCandleCountdown",OBJPROP_TEXT,StringConcatenate(TimeToStr(countdown,TIME_SECONDS))); //Set the text 
   
   if(ShowCandleStart){ //Place line on the chart indicating what time the current candle started
      ObjectDelete(0,"CurrentCandleStart");
      ObjectCreate(0,"CurrentCandleStart",OBJ_VLINE,0,currentCandleOpen,0);
      ObjectSetInteger(0,"CurrentCandleStart",OBJPROP_COLOR,C'255,128,0');
      ObjectSetInteger(0,"CurrentCandleStart",OBJPROP_STYLE,STYLE_SOLID);
      ObjectSetInteger(0,"CurrentCandleStart",OBJPROP_WIDTH,2);
   }
}
void OnChartEvent(const int id, const long& lparam, const double& dparam, const string& sparam){
   if(id == CHARTEVENT_CLICK && adjustTarget){
      int x = (int)lparam;
      int y = (int)dparam;
      int window = 0;
      
      if(ChartXYToTimePrice(0,x,y,window,dt,price)){ //Get coordinates of a point on the chart
         ObjectDelete(0,"Target Line");
         ObjectCreate(0,"Target Line",OBJ_HLINE,window,dt,price); //Place target line on the chart
         ObjectSetInteger(0,"Target Line",OBJPROP_COLOR,C'255,128,0');
         ObjectSetInteger(0,"Target Line",OBJPROP_STYLE,STYLE_SOLID);
         ObjectSetInteger(0,"Target Line",OBJPROP_WIDTH,3);
         ChartRedraw(0);
      }
   }
   
   if(id == CHARTEVENT_KEYDOWN){
      short KeyThatWasPressed = TranslateKey((int)lparam); //Get value of the button that was pressed
      
      if(ShortToString(KeyThatWasPressed) == TargetHotKey){ //Check if hotkey has been pressed
         if(!adjustTarget){
            adjustTarget = true;
         }else{
            adjustTarget = false;
         }
      }
   }
}
