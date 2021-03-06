//+------------------------------------------------------------------+
//|                                                    SnakeGame.mq4 |
//|                                       Copyright 2021. Yuriy Vins |
//|                                           yuriy.vins83@gmail.com |
//+------------------------------------------------------------------+
#property strict
//+------------------------------------------------------------------+
//| Global Variables                                                 |
//+------------------------------------------------------------------+
int counter = 0;
int size_x, size_y;
double end_price;
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
{
 //--- create timer
 EventSetTimer(60);
 
 ColorFrame("SnakeField",0,0,292,301);
 end_price = CHART_END; 
 
 
 return(INIT_SUCCEEDED);
}

//+------------------------------------------------------------------+
//| Timer function                                                   |
//+------------------------------------------------------------------+
void OnTimer()
{
 Comment("START GAME!!!  TIMER: "+IntegerToString(counter));
 counter++; 
 
 //RectangleCreate("SnakeField",TimeCurrent()-1000,end_price,TimeCurrent(),end_price); 
}
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
{
 //--- destroy timer
 EventKillTimer();
 
 ObjectsDeleteAll(0,"Snake");
}
//+-------------------------------------------------------------------+
//|    My User functions                                              |
//+-------------------------------------------------------------------+
//+---------------------------------------------------------+
//|    Функция << Цветовая панель с кнопками >>             |
//+---------------------------------------------------------+
void ColorPanel(color clr=clrGray)                                                                      
{                                                                                                                                                                                                         //
//--- Вызов Цветовой панели с кнопками (30 шт.)     
   ColorFrame("ColorFrame",632,26,292,301); //Рамка.                                                                                                                
                                                                                                        
   ColorButton("ButtonFrame_Red",636,30,56,48,clr,"ButtonColor_Red",639,33,50,42,Red);                                            
   ColorButton("ButtonFrame_DarkGray",693,30,56,48,clr,"ButtonColor_DarkGray",696,33,50,42,DarkGray);                             
   ColorButton("ButtonFrame_Green",750,30,56,48,clr,"ButtonColor_Green",753,33,50,42,Green);                                     
   ColorButton("ButtonFrame_Yellow",807,30,56,48,clr,"ButtonColor_Yellow",810,33,50,42,Yellow);                                   
   ColorButton("ButtonFrame_Aqua",864,30,56,48,clr,"ButtonColor_Aqua",867,33,50,42,Aqua);                                        
                                                                                                         
   ColorButton("ButtonFrame_White",636,79,56,48,clr,"ButtonColor_White",639,82,50,42,White);                                     
   ColorButton("ButtonFrame_Indigo",693,79,56,48,clr,"ButtonColor_Indigo",696,82,50,42,Indigo);                                  
   ColorButton("ButtonFrame_Lime",750,79,56,48,clr,"ButtonColor_Lime",753,82,50,42,Lime);                                         
   ColorButton("ButtonFrame_Blue",807,79,56,48,clr,"ButtonColor_Blue",810,82,50,42,Blue);                                                                          
   ColorButton("ButtonFrame_SlateGray",864,79,56,48,clr,"ButtonColor_SlateGray",867,82,50,42,SlateGray);                         
                                                                                                         
   ColorButton("ButtonFrame_Orange",636,128,56,48,clr,"ButtonColor_Orange",639,131,50,42,Orange);                                 
   ColorButton("ButtonFrame_Salmon",693,128,56,48,clr,"ButtonColor_Salmon",696,131,50,42,Salmon);                                
   ColorButton("ButtonFrame_DeepPink",750,128,56,48,clr,"ButtonColor_DeepPink",753,131,50,42,DeepPink);                           
   ColorButton("ButtonFrame_Coral",807,128,56,48,clr,"ButtonColor_Coral",810,131,50,42,Coral);                                   
   ColorButton("ButtonFrame_YellowGreen",864,128,56,48,clr,"ButtonColor_YellowGreen",867,131,50,42,YellowGreen);                 
                                                                                                         
   ColorButton("ButtonFrame_Olive",636,177,56,48,clr,"ButtonColor_Olive",639,180,50,42,Olive);                                    
   ColorButton("ButtonFrame_IndianRed",693,177,56,48,clr,"ButtonColor_IndianRed",696,180,50,42,IndianRed);                        
   ColorButton("ButtonFrame_Tomato",750,177,56,48,clr,"ButtonColor_Tomato",753,180,50,42,Tomato);                                  
   ColorButton("ButtonFrame_Moccasin",807,177,56,48,clr,"ButtonColor_Moccasin",810,180,50,42,Moccasin);                          
   ColorButton("ButtonFrame_SlateBlue",864,177,56,48,clr,"ButtonColor_SlateBlue",867,180,50,42,SlateBlue);                       
                                                                                                        
   ColorButton("ButtonFrame_Teal",636,226,56,48,clr,"ButtonColor_Teal",639,229,50,42,Teal);                                       
   ColorButton("ButtonFrame_MistyRose",693,226,56,48,clr,"ButtonColor_MistyRose",696,229,50,42,MistyRose);                        
   ColorButton("ButtonFrame_DarkRed",750,226,56,48,clr,"ButtonColor_DarkRed",753,229,50,42,DarkRed);                              
   ColorButton("ButtonFrame_Pink",807,226,56,48,clr,"ButtonColor_Pink",810,229,50,42,Pink);                                       
   ColorButton("ButtonFrame_DarkKhaki",864,226,56,48,clr,"ButtonColor_DarkKhaki",867,229,50,42,DarkKhaki);                        
                                                                                                        
   ColorButton("ButtonFrame_Magenta",636,275,56,48,clr,"ButtonColor_Magenta",639,278,50,42,Magenta);                               
   ColorButton("ButtonFrame_BurlyWood",693,275,56,48,clr,"ButtonColor_BurlyWood",696,278,50,42,BurlyWood);                         
   ColorButton("ButtonFrame_Navy",750,275,56,48,clr,"ButtonColor_Navy",753,278,50,42,Navy);                                        
   ColorButton("ButtonFrame_LightGreen",807,275,56,48,clr,"ButtonColor_LightGreen",810,278,50,42,LightGreen);                      
   ColorButton("ButtonFrame_MediumSpringGreen",864,275,56,48,clr,"ButtonColor_MediumSpringGreen",867,278,50,42,MediumSpringGreen);                                                                                                          //
}                                                                                                        
//+--------------------------------------------------------------------------------------------------------+
//|    Функция создает цветовую панель.                                                                    |
//+--------------------------------------------------------------------------------------------------------+
void ColorFrame(string name="ColorFrame",int x=500,int y=10,int width=300,int height=300,color clr=clrGray,color clr_bg = clrNONE,int frame_width=2,int corner=0)      
  { 
   if(clr_bg==clrNONE) clr_bg = ChartBackColorGet(0);                                                                                         
   //--- Создать объект Frame.                                                                    
   ObjectCreate(name,OBJ_RECTANGLE_LABEL,0,0,0);                                           
   //--- Установить координаты объекта.                                                                 
   ObjectSet(name,OBJPROP_XDISTANCE,x);                                               
   ObjectSet(name,OBJPROP_YDISTANCE,y);                                               
   //--- Установить размер рамки.                                                                     
   ObjectSet(name,OBJPROP_XSIZE,width);                                              
   ObjectSet(name,OBJPROP_YSIZE,height);                                             
   //---Установить цвета фона.                                                                        
   ObjectSet(name,OBJPROP_BGCOLOR,clr_bg);                                   
   //--- Установить цвет плоской рамки (в режиме Flat).                                              
   ObjectSet(name,OBJPROP_COLOR,clr);
   //--- Установить тип границы.                                                                      
   ObjectSet(name,OBJPROP_BORDER_TYPE,BORDER_FLAT);                                         
   //--- Установить толщину плоской границы.                                                          
   ObjectSet(name,OBJPROP_WIDTH,frame_width);                                                         
   //--- Установить угол графика, относительно которого будут определяться координаты точки.            
   ObjectSet(name,OBJPROP_CORNER,corner); 
   //--- Отобразить на переднем (false) или заднем (true) плане. 
   ObjectSet(name,OBJPROP_BACK,true); 
   //--- Скрыть (true) или Отобразить (false) имя графического объекта в списке объектов. 
   ObjectSet(name,OBJPROP_HIDDEN,false);                                                      
  }                                                                                             
//+---------------------------------------------------------------------------------+
//|    Функция создает кнопкy для выбора цвета.                                     |
//+---------------------------------------------------------------------------------+ 
   void ColorButton(//Параметры границ кнопки.
                    string button_frame="ButtonFrame",
                    int border_x=500,
                    int border_y=50,
                    int border_width=50,
                    int border_height=40,
                    color button_frame_color=clrBlue,
                    //Параметры кнопки. 
                    string button="ButtonColor",
                    int button_x=503,
                    int button_y=52,
                    int button_width=45,
                    int button_height=35,
                    color button_color=clrRed,
                    int corner=0
                    )                     
   {                                                                                  
   //--- Создать рамку для кнопки.                                                     
   ObjectCreate(0,button_frame,OBJ_BUTTON,0,0,0);                                           
   //--- Установить координаты рамки для кнопки.                                                     
   ObjectSetInteger(0,button_frame,OBJPROP_XDISTANCE,border_x);                                
   ObjectSetInteger(0,button_frame,OBJPROP_YDISTANCE,border_y);                                
   //--- Установить площадь рамки для кнопки.                                                         
   ObjectSetInteger(0,button_frame,OBJPROP_XSIZE,border_width);                                    
   ObjectSetInteger(0,button_frame,OBJPROP_YSIZE,border_height);                                   
   //--- Установить цвет фона.                                                             
   ObjectSetInteger(0,button_frame,OBJPROP_BGCOLOR,button_frame_color);
   //--- Установить цвет границ.                                                          
   //ObjectSetInteger(0,button_frame,OBJPROP_BORDER_COLOR,ChartBackColorGet(0)); //Без этого параметра выглядит красивее.              
   //--- Установить текст.                                                                 
   ObjectSetString(0,button_frame,OBJPROP_TEXT," ");                                               
   //--- Отобразить на переднем (false) или заднем (true) плане.                           
   ObjectSetInteger(0,button_frame,OBJPROP_BACK,false);  
    //--- Установить угол графика, относительно которого будут определяться координаты точки.            
   ObjectSetInteger(0,button_frame,OBJPROP_CORNER,corner); 
   //--- Отобразить на переднем (false) или заднем (true) плане. 
   ObjectSetInteger(0,button_frame,OBJPROP_BACK,false); 
   //--- Скрыть (true) или Отобразить (false) имя графического объекта в списке объектов. 
   ObjectSetInteger(0,button_frame,OBJPROP_HIDDEN,false);  
                                      
   //--- Создать кнопку.                                           
   ObjectCreate(0,button,OBJ_BUTTON,0,0,0);                                            
   //--- Установить координаты кнопки.                                                    
   ObjectSetInteger(0,button,OBJPROP_XDISTANCE,button_x);                                
   ObjectSetInteger(0,button,OBJPROP_YDISTANCE,button_y);                                
   //--- Установить размер кнопки.                                                        
   ObjectSetInteger(0,button,OBJPROP_XSIZE,button_width);                                   
   ObjectSetInteger(0,button,OBJPROP_YSIZE,button_height);                                   
   //--- Установить цвет фона.                                                             
   ObjectSetInteger(0,button,OBJPROP_BGCOLOR,button_color);                                   
   //--- Установить цвет границы.                                                          
   ObjectSetInteger(0,button,OBJPROP_BORDER_COLOR,ChartBackColorGet(0));               
   //--- Установить текст.                                                                 
   ObjectSetString(0,button,OBJPROP_TEXT," ");                                           
    //--- Установить угол графика, относительно которого будут определяться координаты точки.            
   ObjectSetInteger(0,button,OBJPROP_CORNER,corner); 
   //--- Отобразить на переднем (false) или заднем (true) плане. 
   ObjectSetInteger(0,button,OBJPROP_BACK,false); 
   //--- Скрыть (true) или Отобразить (false) имя графического объекта в списке объектов. 
   ObjectSetInteger(0,button,OBJPROP_HIDDEN,false);                                      
   //--- Перевести кнопку в заданное состояние.                                            
   ObjectSetInteger(0,button,OBJPROP_STATE,false); 
                                         
   } 
//+-------------------------------------------------------------------------------------------------------+
//|    Функция создает кнопкy.                                                                            |
//+-------------------------------------------------------------------------------------------------------+
void Button(string name="Button",int x=0,int y=0,int width=50,int height=18,int corner=CORNER_LEFT_UPPER,
            string text="Button",string tooltip="",string font="Arial",int font_size=9,
            color clr_text=clrAqua,color clr_background=clrNONE,color clr_border=clrGray,bool state=false) 
{
 if(ObjectFind(0,name)==-1) 
  {
    ObjectCreate(0,name,OBJ_BUTTON,0,0,0);                    //Создать кнопку.
    ObjectSetInteger(0,name,OBJPROP_XDISTANCE,x);             //Установить координату Х.
    ObjectSetInteger(0,name,OBJPROP_YDISTANCE,y);             //Установить координату Y.
    ObjectSetInteger(0,name,OBJPROP_XSIZE,width);             //Установить ширину.
    ObjectSetInteger(0,name,OBJPROP_YSIZE,height);            //Установить высоту.
    ObjectSetInteger(0,name,OBJPROP_CORNER,corner);           //Установить угол привязки.
    ObjectSetString(0,name,OBJPROP_TEXT,text);                //Установить текст внутри кнопки.
    ObjectSetString(0,name,OBJPROP_TOOLTIP,tooltip);          //Установить подсказку при наведении мыши на кнопку.
    ObjectSetString(0,name,OBJPROP_FONT,font);                //Установить шрифт текста внутри кнопки.
    ObjectSetInteger(0,name,OBJPROP_FONTSIZE,font_size);      //Установить размер шрифта текста внутри кнопки.
    ObjectSetInteger(0,name,OBJPROP_COLOR,clr_text);          //Установить цвет текста внутри кнопки.
    ObjectSetInteger(0,name,OBJPROP_BGCOLOR,clr_background);  //Установить цвет фона самой кнопки.  
    ObjectSetInteger(0,name,OBJPROP_BORDER_COLOR,clr_border); //Установить цвет границы (рамки) у кнопки.
    ObjectSetInteger(0,name,OBJPROP_BACK,false);              //Отобразить на переднем (false) или заднем (true) плане. 
    ObjectSetInteger(0,name,OBJPROP_STATE,state);             //Перевести кнопку в заданное состояние (нажата или отжата). 
    ObjectSetInteger(0,name,OBJPROP_HIDDEN,false);            //Скрыть (true) или отобразить (false) имя графического объекта в списке объектов.
  }
 }                                                                                        
//+-------------------------------------------+
//| Функция получает цвет фона графика        |
//+-------------------------------------------+
color ChartBackColorGet(const long chart_id=0)                                        
  {                                                                                    
   //--- Подготовить переменную для получения цвета                                       
   long result=clrNONE;                                                                
   //--- Сбросить значение ошибки                                                         
   ResetLastError();                                                                  
   //--- Получить цвет фона графика                                                      
   if(!ChartGetInteger(chart_id,CHART_COLOR_BACKGROUND,0,result))                    
     {                                                                                
      //--- Вывести сообщение об ошибке в журнал.                                     
      Print(__FUNCTION__+", Error Code = ",GetLastError());                           
     }                                                                                
   //--- Вернуть значение свойства графика.                                                
   return((color)result);                                                             
  }
//--- Функция cоздает пользовательский MessageBox.
/*void CustomMessageBox(int x=400,int y=10,string headline = "",string message1="", string message2="",int count_timer=15)
{
 int width=300,height=200;
 static int count_tick; count_tick++;
 f.graphics.ColorFrame("Custom_MessageBox_1",x,y,width,height,clrGray,clrLightGray,1);
 f.graphics.ColorFrame("Custom_MessageBox_2",x+10,y+30,width-20,height-40,clrSilver,clrGainsboro,1);
 f.graphics.ColorFrame("Custom_MessageBox_3",x+10,y+30,width-20,height-70,clrNONE,clrWhite,1);
 f.graphics.Button("Custom_ButtonClose",x+255,y+3,35,25,clrFireBrick,clrGray);
 f.graphics.Text("Custom_Close",x+268,y+7,0,"X",11,clrWhite);
 f.graphics.Button("Custom_ButtonOk",x+120,y+162,65,25,clrLightGray,clrGray);
 f.graphics.Text("Custom_Ok",x+140,y+166,0,"OK",11,clrBlack);
 f.graphics.Text("Custom_HeadLine",x+55,y+7,0,headline,11,clrBlack);
 f.graphics.Text("Custom_Message1",x+66,y+75,0,message1,11,clrBlack);
 f.graphics.Text("Custom_Message2",x+66,y+97,0,message2,11,clrBlack);
 if(count_tick>count_timer)//Действие при работе в функции OnTick().
 {
  ObjectsDeleteAll(0,"Custom_");
  count_tick = 0; 
 }
}*/

//+-----------------------------------------------------------------------------------+ 
//| Функция создает прямоугольник по заданным координатам (координаты времени и цены) | 
//+-----------------------------------------------------------------------------------+ 
void RectangleCreate(string          name="Rectangle",  // имя прямоугольника   
                     datetime        time1=0,           // время первой точки 
                     double          price1=0,          // цена первой точки 
                     datetime        time2=0,           // время второй точки 
                     double          price2=0,          // цена второй точки 
                     color           clr=clrRed,        // цвет прямоугольника 
                     ENUM_LINE_STYLE style=STYLE_SOLID, // стиль линий прямоугольника 
                     int             width=1,           // толщина линий прямоугольника 
                     bool            fill=false,        // заливка прямоугольника цветом 
                     bool            back=false,        // на заднем плане 
                     bool            hidden=true)       // скрыт в списке объектов 
                     {
                      //--- Cоздать прямоугольник по заданным координатам 
                      ObjectCreate(0,name,OBJ_RECTANGLE,0,time1,price1,time2,price2);
                      //--- Установить цвет прямоугольника 
                      ObjectSetInteger(0,name,OBJPROP_COLOR,clr); 
                      //--- Установить стиль линий прямоугольника 
                      ObjectSetInteger(0,name,OBJPROP_STYLE,style); 
                      //--- Установить толщину линий прямоугольника 
                      ObjectSetInteger(0,name,OBJPROP_WIDTH,width); 
                      //--- Включить (true) или Отключить (false) режим заливки прямоугольника 
                      ObjectSetInteger(0,name,OBJPROP_FILL,fill); 
                      //--- Отобразить на переднем (false) или заднем (true) плане 
                      ObjectSetInteger(0,name,OBJPROP_BACK,back);  
                      //--- Скрыть (true) или Отобразить (false) имя графического объекта в списке объектов 
                      ObjectSetInteger(0,name,OBJPROP_HIDDEN,hidden);
                     }

//+------------------------------------------------------------------+ 
//| Создает прямоугольную метку                                      | 
//+------------------------------------------------------------------+ 
bool RectLabelCreate(const long             chart_ID=0,               // ID графика 
                     const string           name="RectLabel",         // имя метки 
                     const int              sub_window=0,             // номер подокна 
                     const int              x=0,                      // координата по оси X 
                     const int              y=0,                      // координата по оси Y 
                     const int              width=50,                 // ширина 
                     const int              height=18,                // высота 
                     const color            back_clr=C'236,233,216',  // цвет фона 
                     const ENUM_BORDER_TYPE border=BORDER_FLAT,     // тип границы 
                     const ENUM_BASE_CORNER corner=CORNER_LEFT_UPPER, // угол графика для привязки 
                     const color            clr=clrRed,               // цвет плоской границы (Flat) 
                     const ENUM_LINE_STYLE  style=STYLE_SOLID,        // стиль плоской границы 
                     const int              line_width=1,             // толщина плоской границы 
                     const bool             back=false,               // на заднем плане 
                     const bool             selection=false,          // выделить для перемещений 
                     const bool             hidden=true,              // скрыт в списке объектов 
                     const long             z_order=0)                // приоритет на нажатие мышью 
  { 
//--- сбросим значение ошибки 
   ResetLastError(); 
//--- создадим прямоугольную метку 
   if(!ObjectCreate(chart_ID,name,OBJ_RECTANGLE_LABEL,sub_window,0,0)) 
     { 
      Print(__FUNCTION__, 
            ": не удалось создать прямоугольную метку! Код ошибки = ",GetLastError()); 
      return(false); 
     } 
//--- установим координаты метки 
   ObjectSetInteger(chart_ID,name,OBJPROP_XDISTANCE,x); 
   ObjectSetInteger(chart_ID,name,OBJPROP_YDISTANCE,y); 
//--- установим размеры метки 
   ObjectSetInteger(chart_ID,name,OBJPROP_XSIZE,width); 
   ObjectSetInteger(chart_ID,name,OBJPROP_YSIZE,height); 
//--- установим цвет фона 
   ObjectSetInteger(chart_ID,name,OBJPROP_BGCOLOR,back_clr); 
//--- установим тип границы 
   ObjectSetInteger(chart_ID,name,OBJPROP_BORDER_TYPE,border); 
//--- установим угол графика, относительно которого будут определяться координаты точки 
   ObjectSetInteger(chart_ID,name,OBJPROP_CORNER,corner); 
//--- установим цвет плоской рамки (в режиме Flat) 
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr); 
//--- установим стиль линии плоской рамки 
   ObjectSetInteger(chart_ID,name,OBJPROP_STYLE,style); 
//--- установим толщину плоской границы 
   ObjectSetInteger(chart_ID,name,OBJPROP_WIDTH,line_width); 
//--- отобразим на переднем (false) или заднем (true) плане 
   ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back); 
//--- включим (true) или отключим (false) режим перемещения метки мышью 
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTABLE,selection); 
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTED,selection); 
//--- скроем (true) или отобразим (false) имя графического объекта в списке объектов 
   ObjectSetInteger(chart_ID,name,OBJPROP_HIDDEN,hidden); 
//--- установим приоритет на получение события нажатия мыши на графике 
   ObjectSetInteger(chart_ID,name,OBJPROP_ZORDER,z_order); 
//--- успешное выполнение 
   return(true); 
  }  
  
//+------------------------------------------------------------------+ 
//| Создает вертикальную линию                                       | 
//+------------------------------------------------------------------+ 
bool VLineCreate(const long            chart_ID=0,        // ID графика 
                 const string          name="VLine",      // имя линии 
                 const int             sub_window=0,      // номер подокна 
                 datetime              time=0,            // время линии 
                 const color           clr=clrRed,        // цвет линии 
                 const ENUM_LINE_STYLE style=STYLE_SOLID, // стиль линии 
                 const int             width=1,           // толщина линии 
                 const bool            back=false,        // на заднем плане 
                 const bool            selection=false,    // выделить для перемещений 
                 const bool            hidden=true,       // скрыт в списке объектов 
                 const long            z_order=0)         // приоритет на нажатие мышью 
  { 
//--- если время линии не задано, то проводим ее через последний бар 
   if(!time) 
      time=TimeCurrent(); 
//--- сбросим значение ошибки 
   ResetLastError(); 
//--- создадим вертикальную линию 
   if(!ObjectCreate(chart_ID,name,OBJ_VLINE,sub_window,time,0)) 
     { 
      Print(__FUNCTION__, 
            ": не удалось создать вертикальную линию! Код ошибки = ",GetLastError()); 
      return(false); 
     } 
//--- установим цвет линии 
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr); 
//--- установим стиль отображения линии 
   ObjectSetInteger(chart_ID,name,OBJPROP_STYLE,style); 
//--- установим толщину линии 
   ObjectSetInteger(chart_ID,name,OBJPROP_WIDTH,width); 
//--- отобразим на переднем (false) или заднем (true) плане 
   ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back); 
//--- включим (true) или отключим (false) режим перемещения линии мышью 
//--- при создании графического объекта функцией ObjectCreate, по умолчанию объект 
//--- нельзя выделить и перемещать. Внутри же этого метода параметр selection 
//--- по умолчанию равен true, что позволяет выделять и перемещать этот объект 
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTABLE,selection); 
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTED,selection); 
//--- скроем (true) или отобразим (false) имя графического объекта в списке объектов 
   ObjectSetInteger(chart_ID,name,OBJPROP_HIDDEN,hidden); 
//--- установим приоритет на получение события нажатия мыши на графике 
   ObjectSetInteger(chart_ID,name,OBJPROP_ZORDER,z_order); 
//--- успешное выполнение 
   return(true); 
  }
//+------------------------------------------------------------------+ 
//| Создает линию тренда по заданным координатам                     | 
//+------------------------------------------------------------------+ 
bool TrendLineCreate(const long            chart_ID=0,        // ID графика 
                 const string          name="TrendLine",  // имя линии 
                 const int             sub_window=0,      // номер подокна 
                 datetime              time1=0,           // время первой точки 
                 double                price1=0,          // цена первой точки 
                 datetime              time2=0,           // время второй точки 
                 double                price2=0,          // цена второй точки 
                 const color           clr=clrRed,        // цвет линии 
                 const ENUM_LINE_STYLE style=STYLE_SOLID, // стиль линии 
                 const int             width=1,           // толщина линии 
                 const bool            back=false,        // на заднем плане 
                 const bool            selection=true,    // выделить для перемещений 
                 const bool            ray_right=false,   // продолжение линии вправо 
                 const bool            hidden=true,       // скрыт в списке объектов 
                 const long            z_order=0)         // приоритет на нажатие мышью 
  { 
//--- сбросим значение ошибки 
   ResetLastError(); 
//--- создадим трендовую линию по заданным координатам 
   if(!ObjectCreate(chart_ID,name,OBJ_TREND,sub_window,time1,price1,time2,price2)) 
     { 
      Print(__FUNCTION__, 
            ": не удалось создать линию тренда! Код ошибки = ",GetLastError()); 
      return(false); 
     } 
//--- установим цвет линии 
   ObjectSetInteger(chart_ID,name,OBJPROP_COLOR,clr); 
//--- установим стиль отображения линии 
   ObjectSetInteger(chart_ID,name,OBJPROP_STYLE,style); 
//--- установим толщину линии 
   ObjectSetInteger(chart_ID,name,OBJPROP_WIDTH,width); 
//--- отобразим на переднем (false) или заднем (true) плане 
   ObjectSetInteger(chart_ID,name,OBJPROP_BACK,back); 
//--- включим (true) или отключим (false) режим перемещения линии мышью 
//--- при создании графического объекта функцией ObjectCreate, по умолчанию объект 
//--- нельзя выделить и перемещать. Внутри же этого метода параметр selection 
//--- по умолчанию равен true, что позволяет выделять и перемещать этот объект 
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTABLE,selection); 
   ObjectSetInteger(chart_ID,name,OBJPROP_SELECTED,selection); 
//--- включим (true) или отключим (false) режим продолжения отображения линии вправо 
   ObjectSetInteger(chart_ID,name,OBJPROP_RAY_RIGHT,ray_right); 
//--- скроем (true) или отобразим (false) имя графического объекта в списке объектов 
   ObjectSetInteger(chart_ID,name,OBJPROP_HIDDEN,hidden); 
//--- установим приоритет на получение события нажатия мыши на графике 
   ObjectSetInteger(chart_ID,name,OBJPROP_ZORDER,z_order); 
//--- успешное выполнение 
   return(true); 
  }                                              
//+------------------------------------------------------------------+
