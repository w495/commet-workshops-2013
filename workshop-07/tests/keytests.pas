uses ptccrt;

var c : char;
    i : longint;
begin
c := #0;

while c <> #27 do
  begin
  while not keypressed() do
    begin
    clrscr;
    writeln('not pressing anything');
    delay(500);
    end;
  i:=0;
  while keypressed() do
    begin
    clrscr;
    c:=readkey();
    if(c=#0) then
      c:=readkey();
    inc(i);
    writeln(c,' ', i);
    delay(300);
    end;
  end
end.