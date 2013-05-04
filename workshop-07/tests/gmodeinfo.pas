program gmodeinfo;

{$ifdef linux}
    uses ptcgraph;
{$endif}
{$ifdef windows}
    uses graph;
{$endif}


var
    modeinfo: pmodeinfo; // сюда будет заносится информация о видеорежимах
    rez: string;
  
begin
    modeinfo:=queryadapterinfo;
    if modeinfo=nil then
        writeln('не удалось получить информацию у видеоадаптера...')
    else
    begin
        writeln('№ драйвера ', '№ режима ', 'разрешение ', 'цветов ');
        writeln('------------------------------------------------------------');
        while modeinfo^.next<>nil do
        begin
            write(modeinfo^.drivernumber:10);
            write(modeinfo^.modenumber:9);
            // write(' "'+modeinfo^.modename+'"':22);
            rez:=inttostr(modeinfo^.maxx+1)+'x'+inttostr(modeinfo^.maxy+1);
            write(rez:11);
            writeln(modeinfo^.maxcolor:7);
            modeinfo:=modeinfo^.next;
        end;
        readln;
    end;
end.