program ws06_stringcut;

const LIMIT = 50;

var strlen   : integer;
var nsteps   : integer;
var step       : integer;
var str       : string;
var newstr    : string;
var inputfile   : text;
var outputfile  : text;

begin
    assign(inputfile,    'input.txt');
    assign(outputfile,   'output.txt');

    reset(inputfile);
    rewrite(outputfile);

    while( not eof(inputfile) ) do 
    begin
        readln(inputfile, str);
        strlen := length(str);
        nsteps := (strlen div LIMIT); // 2
        for step := 1 to nsteps do 
        begin
            newstr  :=  copy(str, 1 + (LIMIT * (step - 1)), LIMIT); 
            writeln(outputfile, newstr);
        end;
        newstr  :=  copy(str, 1 + LIMIT * nsteps, strlen mod LIMIT);
        writeln(outputfile, newstr);
    end;

    close(inputfile);
    close(outputfile);
end.



