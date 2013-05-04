program demo16bitcolor;
uses ptcgraph;

var
    driver: smallint;  // номер драйвера
    mode  : smallint;  // номер графического режима
    x, y, i, color  : integer;  // координаты

begin
    // установка графического режима
    detectgraph(driver, mode);
    initgraph(driver, mode, '');
    color:=0;
    y:=0;
    for i:=0 to 63 do
    begin
        for x:=0 to 1023 do
        begin
            setcolor(color);
            line(x, y, x, y+10);
            inc(color);
        end;
        y:=y+12;
    end;
    readln;
    closegraph;
end.

