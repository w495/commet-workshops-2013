(*****************************************************************************
 *
 *  @doc        Графика: графики функций.
 *              Компактная версия.
 *  @author     Илья w-495 Никитин <w@w-495.ru> 
 *  @date       2013.05.09 01:40:00
 *  @version    1.0
 *
 *****************************************************************************)
 
program math;

{$ifdef LINUX}
    uses ptcgraph, ptccrt;
{$endif}
{$ifdef WINDOWS}
    uses graph, crt;
{$endif}

const DELTA_X = 10;
const DELTA_Y = 10;


function i2s(i: integer): string;
    var tmpstring: string;
    begin
        tmpstring := '';
        str(i, tmpstring);
        i2s := tmpstring;
    end;

(** 
    @fn grid_draw   рисует сетку.
**)
procedure grid_draw(step : integer);
    var dx      : integer;
    var dy      : integer;
    var stepx   : integer;
    var stepy   : integer;
    var offsetx : integer;
    var offsety : integer;
    begin
        setcolor(darkgray);
        setlinestyle(dashedln, 0, normwidth);

        stepx := round(getmaxx / step);
        stepy := round(getmaxy / step);
        offsetx := -15;
        offsety :=  5;
        
        for dx := 0 to stepx  do 
        begin
            line(
                step  * dx,
                0,
                step  * dx,
                getmaxy
            );
            outtextxy(
                step * dx + offsetx,
                round(getmaxy / 2) + offsety,
                i2s(dx - round(stepx / 2))
            );
        end;
        for dy := 0 to round(getmaxy / step ) do 
        begin
            line(
                0,
                step * dy,
                getmaxx,
                step * dy
            );
            outtextxy(
                round(getmaxx / 2) + offsetx,
                step * dy  + offsety,
                i2s(- dy + round(stepy / 2))
            );
        end;

        setcolor(darkgray);
        setlinestyle(solidln, 0, thickwidth);
        line(
            round(getmaxx / 2),
            0,
            round(getmaxx / 2),
            getmaxy
        );

        setcolor(darkgray);
        setlinestyle(solidln, 0, thickwidth);
        line(
            0,
            round(getmaxy / 2),
            getmaxx,
            round(getmaxy / 2)
        );
        

    end;
    
    

function fun(x : real) : real;
    begin
        fun := x*x*x;
    end;

procedure fun_draw(step : integer);
    var dx : integer;
    var curr_newx : real;
    var next_newx : real;
    begin
        for dx := -round(getmaxx/2) to round(getmaxx/2) do 
        begin
            curr_newx   := (dx / step );
            next_newx   := ((dx+1) / step );
            moveto(
                round(dx + getmaxx / 2),  
                round(getmaxy / 2 - step  * fun(curr_newx ))
            );
            lineto(
                round((dx+1) + getmaxx / 2),  
                round(getmaxy / 2 - step  * fun(next_newx))
            );
        end;
    end;


procedure fun1_draw(step : integer);
    var dx : integer;
    var curr_newx : real;
    var next_newx : real;
    function myfun(x : real) : real;
        begin
            myfun := x*x;
        end;
    begin
        for dx := -round(getmaxx/2) to round(getmaxx/2) do 
        begin
            curr_newx   := (dx / step );
            next_newx   := ((dx+1) / step );
            moveto(
                round(dx + getmaxx / 2),  
                round(getmaxy / 2 - step  * myfun(curr_newx ))
            );
            lineto(
                round((dx+1) + getmaxx / 2),  
                round(getmaxy / 2 - step  * myfun(next_newx))
            );
        end;
    end;

procedure fun2_draw(step : integer);
    var dx : integer;
    var curr_newx : real;
    var next_newx : real;
    function myfun(x : real) : real;
        begin
            myfun := sin(x);
        end;
    begin
        for dx := -round(getmaxx/2) to round(getmaxx/2) do 
        begin
            curr_newx   := (dx / step );
            next_newx   := ((dx+1) / step );
            moveto(
                round(dx + getmaxx / 2),  
                round(getmaxy / 2 - step  * myfun(curr_newx ))
            );
            lineto(
                round((dx+1) + getmaxx / 2),  
                round(getmaxy / 2 - step  * myfun(next_newx))
            );
        end;
    end;


procedure fun3_draw(step : integer);
    var dx : integer;
    var curr_newx : real;
    var next_newx : real;
    function myfun(x : real) : real;
        begin
            myfun := cos(x);
        end;
    begin
        for dx := -round(getmaxx/2) to round(getmaxx/2) do 
        begin
            curr_newx   := (dx / step );
            next_newx   := ((dx+1) / step );
            moveto(
                round(dx + getmaxx / 2),  
                round(getmaxy / 2 - step  * myfun(curr_newx ))
            );
            lineto(
                round((dx+1) + getmaxx / 2),  
                round(getmaxy / 2 - step  * myfun(next_newx))
            );
        end;
    end;
    

procedure fun4_draw(step : integer);
    var dx : integer;
    var curr_newx : real;
    var next_newx : real;
    function myfun(x : real) : real;
        begin
            myfun := exp(x);
        end;
    begin
        for dx := -round(getmaxx/2) to round(getmaxx/4) do 
        begin
            curr_newx   := (dx / step );
            next_newx   := ((dx+1) / step );
            moveto(
                round(dx + getmaxx / 2),  
                round(getmaxy / 2 - step  * myfun(curr_newx ))
            );
            lineto(
                round((dx+1) + getmaxx / 2),  
                round(getmaxy / 2 - step  * myfun(next_newx))
            );
        end;
    end;

procedure fun5_draw(step : integer);
    var dx : integer;
    var curr_newx : real;
    var next_newx : real;
    function myfun(x : real) : real;
        begin
            myfun := - 1 / exp(x);
        end;
    begin
        for dx := -round(getmaxx/4) to round(getmaxx/2) do 
        begin
            curr_newx   := (dx / step );
            next_newx   := ((dx+1) / step );
            moveto(
                round(dx + getmaxx / 2),  
                round(getmaxy / 2 - step  * myfun(curr_newx ))
            );
            lineto(
                round((dx+1) + getmaxx / 2),  
                round(getmaxy / 2 - step  * myfun(next_newx))
            );
        end;
    end;
    
(** 
    @fn draw_scene рисует сцену целиком.
**)
procedure draw_scene(step: integer);
    begin
        grid_draw(step);
        setlinestyle(solidln, 0, thickwidth);
        
        setcolor(green);
        fun_draw(step);
        
        setcolor(red);
        fun1_draw(step);

        setcolor(yellow);
        fun2_draw(step);

        setcolor(blue);
        fun3_draw(step);

        setcolor(white);
        fun4_draw(step);

        fun5_draw(step);

    end;

procedure graph(step: integer);
    var key : char;
    begin
        key := #0;
        while key <> #27 do
        begin
            if keypressed() then
                key:=readkey();
            draw_scene(step);
            delay(500)
        end;
    end;


var driver, mode : integer;
begin
    randomize;
    driver:=vga;
    mode:=vgahi;
    initgraph(driver, mode, '');
    graph(40);
    closegraph();
end.
