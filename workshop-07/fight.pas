(*****************************************************************************
 *
 *  @doc        Графика: простейшая компьютерная игра.
 *              Компактная версия.
 *  @author     Илья w-495 Никитин <w@w-495.ru> 
 *  @date       2013.05.09 01:35:10
 *  @version    1.0
 *
 *****************************************************************************)
 
program fight;

{$ifdef LINUX}
    uses ptcgraph, ptccrt;
{$endif}
{$ifdef WINDOWS}
    uses graph, crt;
{$endif}

const DELTA_X = 10;
const DELTA_Y = 10;


function inttostr(i: integer): string;
    var tmpstring: string;
    begin
        tmpstring := '';
        str(i, tmpstring);
        inttostr := tmpstring;
    end;
    
(** 
    @fn sightpoint_draw рисует прицел.
    @param x        координата прицела по оси x;
    @param y        координата прицела по оси y;
    @param radius   размер прицела;
    @param color    цвет прицела;
**)
procedure sightpoint_draw(x, y, radius, color: integer);
    begin
            setcolor(color);
            setlinestyle(solidln, 0, normwidth);
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
            outtextxy(
                x + 10,
                y + 5,
                ' x: ' + IntToStr(x) + 
                ' y: ' + IntToStr(y)
            );
            circle(x,y,radius div 2);
    end;


(** 
    @fn target_draw рисует цель.
    @param x        координата цели по оси x;
    @param y        координата цели по оси y;
    @param radius   размер цели;
    @param color    цвет цели;
**)
procedure target_draw(x, y, radius, color: integer);
    begin
        setcolor(color);
        setlinestyle(solidln, 0, thickwidth);
        rectangle(
            x + radius,
            y + radius,
            x - radius,
            y - radius
        );
        outtextxy(
            x + radius + 10,
            y + radius + 5,
            ' x: ' + IntToStr(x) + 
            ' y: ' + IntToStr(y) + 
            ' r: ' + IntToStr(radius ) 
        );
    end;


(** 
    @fn grid_draw   рисует сетку.
**)
procedure grid_draw();
    var dx, step: integer;
    begin
        step := 40;
        setcolor(darkgray);
        setlinestyle(dottedln, 0, normwidth);
        
        for dx := 0 to round(getmaxx / step ) do 
        begin
            line(
                step  * dx,
                0,
                step  * dx,
                getmaxy
            );
        end;
        
        for dx := 0 to round(getmaxy / step ) do 
        begin
            line(
                0,
                step * dx,
                getmaxx,
                step * dx
            );
        end;
        
        step := 80;
        setcolor(darkgray);
        setlinestyle(dashedln, 0, normwidth);
        
        for dx := 0 to round(getmaxx / step ) do 
        begin
            line(
                step  * dx,
                0,
                step  * dx,
                getmaxy
            );
        end;
        
        for dx := 0 to round(getmaxy / step ) do 
        begin
            line(
                0,
                step * dx,
                getmaxx,
                step * dx
            );
        end;
        

        step := 160;
        setcolor(darkgray);
        setlinestyle(centerln, 0, thickwidth);
        
        for dx := 0 to round(getmaxx / step ) do 
        begin
            line(
                step  * dx,
                0,
                step  * dx,
                getmaxy
            );
        end;
        
        for dx := 0 to round(getmaxy / step ) do 
        begin
            line(
                0,
                step * dx,
                getmaxx,
                step * dx
            );
        end;

    end;

    
(** 
    @fn draw_scene рисует сцену целиком.
        
        Сначала рисуем цель, с помощью `target_draw`.
        Потом рисуем прицел (`sightpoint_draw`).
        Делаем задержку по времени, чтобы пользователь 
        успел увидеть сцену. Скрываем цель, с помощью `target_draw`.
        Скрываем прицел (`sightpoint_draw`).
   
    @param sightpoint_x         координата прицела по оси x; 
    @param sightpoint_y         координата прицела по оси y;
    @param sightpoint_r         размер прицела;
    @param sightpoint_fcolor    видимый цвет прицела;
    @param sightpoint_bcolor    невидимый цвет прицела;
    @param target_x             координата цели по оси x;
    @param target_y             координата цели по оси y;
    @param target_r             размер цели;
    @param target_fcolor        видимый цвет прицела;
    @param target_bcolor,       невидимый цвет прицела;
**)
procedure draw_scene(
    sightpoint_x, 
    sightpoint_y, 
    sightpoint_r, 
    sightpoint_fcolor, 
    sightpoint_bcolor,
    
    target_x, 
    target_y, 
    target_r, 
    target_fcolor, 
    target_bcolor,
    
    time: integer
);
    begin
        grid_draw();
        
        target_draw(
            target_x, 
            target_y, 
            target_r, 
            target_fcolor
        );
        sightpoint_draw(
            sightpoint_x, 
            sightpoint_y, 
            sightpoint_r, 
            sightpoint_fcolor
        );
        (** 
            Задержка по времени.
            Встроенная функция.
        **)
        delay(time);

        target_draw(
            target_x, 
            target_y, 
            target_r, 
            target_bcolor
        );
        sightpoint_draw(
            sightpoint_x, 
            sightpoint_y, 
            sightpoint_r, 
            sightpoint_bcolor
        );
    end;

procedure game;
    var sightpoint_x, 
        sightpoint_y, 
        sightpoint_r, 
        sightpoint_fcolor, 
        sightpoint_bcolor,
        target_x, 
        target_y, 
        target_r, 
        target_fcolor,
        target_bcolor,
        delay_time : integer;
    var key : char;
    var target_iskilled: boolean;
    begin
        sightpoint_x        :=  100;
        sightpoint_y        :=  100;
        sightpoint_r        :=  10;
        delay_time          :=  20;
        sightpoint_fcolor   := green;
        sightpoint_bcolor   := black;
        
        target_x        := 200;
        target_y        := 200; 
        target_r        := 10;
        target_fcolor   := red; 
        target_bcolor   := black;
        target_iskilled := false;
        key := #0;

        while key <> #27 do
        begin
            (** 
                Если цель жива, то заставляем ее шевелиться.
            **)
            if (not target_iskilled) then
            begin
                target_x :=  target_x  + (random(5)-random(5)); 
                target_y :=  target_y  + (random(5)-random(5));
                target_r :=  10  + (random(2)-random(2));
            end;
            sightpoint_fcolor   := green;
            sightpoint_r        := 10;
            delay_time          := 20;

            if keypressed() then
            begin
                key:=readkey();
                case key of
                    'H' :
                        sightpoint_y := sightpoint_y - DELTA_Y;
                    'P' :
                        sightpoint_y := sightpoint_y + DELTA_Y;
                    'K' : 
                        sightpoint_x := sightpoint_x - DELTA_X;
                    'M' : 
                        sightpoint_x := sightpoint_x + DELTA_X;
                    'w' : 
                        sightpoint_y := sightpoint_y - DELTA_Y;
                    's' : 
                        sightpoint_y := sightpoint_y + DELTA_Y;
                    'a' : 
                        sightpoint_x := sightpoint_x - DELTA_X;
                    'd' : 
                        sightpoint_x := sightpoint_x + DELTA_X;
                    ' ' : 
                        begin
                            sightpoint_fcolor   := lightred;
                            sightpoint_r        := 20;
                            delay_time          := 100;
                            (** 
                                Условие попадания в цель.
                                Координаты прицела прицела,
                                оказываются внутри цели.
                            **)
                            if(     ((target_x - target_r) < sightpoint_x)
                                and (sightpoint_x < (target_x + target_r))
                                and ((target_y - target_r) < sightpoint_y)
                                and (sightpoint_y < (target_y + target_r))
                            ) then
                            begin
                                target_fcolor   := blue; 
                                target_iskilled := true;
                            end
                        end
                end;
            end;
            draw_scene(
                sightpoint_x, 
                sightpoint_y, 
                sightpoint_r, 
                sightpoint_fcolor, 
                sightpoint_bcolor, 
                target_x, 
                target_y, 
                target_r, 
                target_fcolor, 
                target_bcolor,
                delay_time
            );
        end;
    end;


var driver, mode : integer;
begin
    randomize;
    driver:=vga;
    mode:=vgahi;
    initgraph(driver, mode, '');
    game();
    closegraph();
end.
