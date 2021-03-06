(*****************************************************************************
 *
 *  @doc        Графика: окружность, движущаяся случайным образом.
 *              Компактная версия.
 *  @author     Илья w-495 Никитин <w@w-495.ru> 
 *  @date       2013.05.09 01:30:51
 *  @version    1.0
 *
 *****************************************************************************)
 
program randomcircle;

{$ifdef LINUX}
    uses ptcgraph, ptccrt;
{$endif}
{$ifdef WINDOWS}
    uses graph, crt;
{$endif}

var x, y, r, t, driver, mode : integer;
begin
    driver:=vga;
    mode:=vgahi;
    
    initgraph(driver, mode, '');
    randomize;

    delay(400);
    
    x:=300;
    y:=180;
    r:=20;
    t:=10;
    
    repeat
        setcolor(white);
        circle(x,y,r); 
        delay(t);
        setcolor(black);
        circle(x,y,r);
        
        x:= x + (random(5)-random(5));
        y:= y + (random(5)-random(5));
        writeln('x = ', x, ' y = ', y, ' r = ', r, ' t = ', t);
        r:= abs(10 + (random(2)-random(2)));
        t:= abs(20 + (random(20)-random(20)));
        {перемещаемся немного направо}
    until (
        (x > getmaxx) or
        (y > getmaxy) or
        (x < 0) or
        (y < 0) or
        keypressed()
    );

    delay(400);
    
    
    closegraph
end.
