(*****************************************************************************
 *
 *  @doc        Графика: геометрические фигуры.
 *              Компактная версия.
 *  @author     Илья w-495 Никитин <w@w-495.ru> 
 *  @date       2013.05.09 01:20:23
 *  @version    1.0
 *
 *****************************************************************************)
 
program geometry;

{$ifdef LINUX}
    uses ptcgraph, crt;
{$endif}
{$ifdef WINDOWS}
    uses graph, crt;
{$endif}

var driver: smallint;
var mode: smallint;

begin
    driver:=vga;
    mode:=vgahi;
    
    initgraph(driver, mode, '');
    {** 
        Рисуем окружность
    **}
    setcolor(red);
    circle(100,80,16);
    delay(400);

    PutPixel(50,100,White);
    setcolor(yellow);
    Rectangle(150,150,50,200); {правый верхний и левый нижний углы}
    Circle(200,100,50);
    {окружность}
    Line(100,50,250,150);
    {отрезок прямой}


    readln;
    closegraph;
end.