program getgmode;

{$ifdef LINUX}
    uses ptcgraph;
{$endif}
{$ifdef WINDOWS}
    uses graph;
{$endif}

var driver: smallint;
var mode: smallint;

begin
    detectgraph(driver, mode);
    writeln('driver: ', driver, ', graphical mode: ', mode);
    initgraph(driver, mode, '');
    writeln(
        'resolution: ', 
            getmaxx + 1,'x',getmaxy + 1, 
        ', colors: ', 
            getmaxcolor + 1
    );
    readln;
    closegraph;
end.