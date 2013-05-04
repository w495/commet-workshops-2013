program triafractal;

{$ifdef linux}
    uses ptcgraph, crt;
{$endif}
{$ifdef windows}
    uses graph, crt;
{$endif}

type
  ttriapoints = array[0..3] of pointtype; // координаты для рисования треугольника
  
// рекурсивная процедура для рисования треугольников 
// внутри заданного треугольника
// параметры:
//    points - координаты внешнего треугольника
//    n - уровень вложенности процедуры
procedure triangle1(points: ttriapoints; n: integer);
var
  points1: ttriapoints;
begin
  if n>0 then
  begin
    delay(200);
    setcolor(random(14)+1); // случайный цвет рисования. чёрный нам, естественно, не нужен
    
    // вычисление новых координат треугольника
    points1[0].x:=(points[1].x+points[0].x) div 2;
    points1[0].y:=(points[1].y+points[0].y) div 2;
    points1[1].x:=(points[2].x+points[0].x) div 2;
    points1[1].y:=(points[2].y+points[0].y) div 2;
    points1[2].x:=(points[1].x+points[2].x) div 2;
    points1[2].y:=(points[1].y+points[2].y) div 2;
    points1[3].x:=points1[0].x;
    points1[3].y:=points1[0].y;
    
    drawpoly(4, points1);    // рисование треугольника
    
    triangle1(points1, n-1); // рекурсивный вызов для рисования внутри
  end;
end;

var
  driver: smallint;  // номер драйвера
  mode  : smallint;  // номер графического режима
  points: ttriapoints;

begin
  randomize;
  // установка графического режима
  driver:=vga;
  mode:=vgahi;
  initgraph(driver, mode, '');
  
  // большой треугольник
  points[0].x:=0;
  points[0].y:=400;
  points[1].x:=600;
  points[1].y:=400;
  points[2].x:=300;
  points[2].y:=0;
  points[3].x:=points[0].x;
  points[3].y:=points[0].y;
  drawpoly(4, points);
  triangle1(points, 6);
  
  // верхний треугольник
  points[0].x:=150;
  points[0].y:=200;
  points[1].x:=450;
  points[1].y:=200;
  points[2].x:=300;
  points[2].y:=0;
  points[3].x:=points[0].x;
  points[3].y:=points[0].y;
  triangle1(points, 6);  
                       
  // левый треугольник
  points[0].x:=0;
  points[0].y:=400;
  points[1].x:=300;
  points[1].y:=400;
  points[2].x:=150;
  points[2].y:=200;
  points[3].x:=points[0].x;
  points[3].y:=points[0].y;
  triangle1(points, 6);

  // правый треугольник
  points[0].x:=300;
  points[0].y:=400;
  points[1].x:=600;
  points[1].y:=400;
  points[2].x:=450;
  points[2].y:=200;
  points[3].x:=points[0].x;
  points[3].y:=points[0].y;
  triangle1(points, 6);

  readln;
  closegraph;
end.