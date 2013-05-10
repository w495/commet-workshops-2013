program getgmode;

{$ifdef LINUX}
    uses ptcgraph, ptccrt;
{$endif}
{$ifdef WINDOWS}
    uses graph, crt;
{$endif}

const DELTA_X = 10;
const DELTA_Y = 10;


procedure sightpoint(x, y, radius, frontcolor, backcolor, time: integer);
    begin
        setcolor(frontcolor);
        line(
            x,
            y - radius ,
            x,
            y + radius
        );
        line(
            x-radius,
            y,
            x + radius,
            y 
        );
        circle(x,y,radius div 2);
        delay(time);
        setcolor(backcolor);
        line(
            x,
            y - radius ,
            x,
            y + radius
        );
        line(
            x-radius,
            y,
            x + radius,
            y 
        );
        
        circle(x,y,radius div 2);
    end;
    

var 
    mouse_x,
    mouse_y,
    x, 
    y, 
    r, 
    t, 
    color, 
    driver, 
    mode : integer;

var c : char;
    i : longint;
    
begin
    driver:=vga;
    mode:=vgahi;
    
    initgraph(driver, mode, '');

    delay(400);
    
    x:=100;
    y:=100;
    r:=10;
    t:=50;
    color := green;

    c := #0;

    while c <> #27 do
    begin
        while not keypressed() do
        begin
            color := green;
            r:= 10;
            t:=50;
            sightpoint(x, y, r, color, black, t);
        end;
        i:=0;
        while keypressed() do
        begin
            c:=readkey();
            inc(i);
            writeln(c,' =  ', ord(c), ' = ', i);
            case c of
                'H' :
                    y := y - DELTA_Y;
                'P' :
                    y := y + DELTA_Y;
                'K' : 
                    x := x - DELTA_X;
                'M' : 
                    x := x + DELTA_X;
                'w' : 
                    y := y - DELTA_Y;
                's' : 
                    y := y + DELTA_Y;
                'a' : 
                    x := x - DELTA_X;
                'd' : 
                    x := x + DELTA_X;
                ' ' : 
                    begin
                        color := lightred;
                        r:= 20;
                        t:=100;
                    end
            end;
            
            sightpoint(x, y, r, color, black, t);
        end;
    end;

    
    closegraph
end.
