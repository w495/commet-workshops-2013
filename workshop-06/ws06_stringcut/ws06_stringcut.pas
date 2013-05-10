(*****************************************************************************
 *
 *  @doc        Операции с файлом: разбиение на строки по заданной ширине. 
 *              Компактная версия.
 *  @author     Илья w-495 Никитин <w@w-495.ru> 
 *  @date       2013.05.05 11:47:51
 *  @version    1.0
 *
 *****************************************************************************)
 
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
        nsteps := (strlen div LIMIT);
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



