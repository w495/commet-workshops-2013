program getgmode;

{$ifdef LINUX}
    uses ptcgraph, crt;
{$endif}
{$ifdef WINDOWS}
    uses graph, crt;
{$endif}

var x, y, r, t, driver, mode : integer;
begin
    driver:=vga;
    mode:=vgahi;
    
    initgraph(driver, mode, '');

    delay(400);
    
    x:=100;
    y:=100;
    r:=10;
    t:=5;
    
    repeat
        repeat
            setcolor(white);
            circle(x,y,r); {рисуем белую окружность}
            delay(t);
            setcolor(black);
            circle(x,y,r); {рисуем черную окружность}
            x:=x+1
            {перемещаемся немного направо}
        until x > 360;
        
        repeat
            setcolor(white);
            circle(x,y,r); {рисуем белую окружность}
            delay(t);
            setcolor(black);
            circle(x,y,r); {рисуем черную окружность}
            y:=y+1
            {перемещаемся немного направо}
        until y > 360;
        
        repeat
            setcolor(white);
            circle(x,y,r); {рисуем белую окружность}
            delay(t);
            setcolor(black);
            circle(x,y,r); {рисуем черную окружность}
            x:=x-1;
            r:=r+1
            {перемещаемся немного направо}
        until x < 100;
        
        repeat
            setcolor(white);
            circle(x,y,r); {рисуем белую окружность}
            delay(t);
            setcolor(black);
            circle(x,y,r); {рисуем черную окружность}
            y:=y-1;
            r:=r-1
            {перемещаемся немного направо}
        until y < 100;
        t := t - 1;
    until t < 0;
    
    delay(400);
    
    
    closegraph
end.
