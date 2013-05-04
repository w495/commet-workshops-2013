(*****************************************************************************
 *
 *  @doc        Чтение из текстового файла. Компактная версия.
 *  @author     Илья w-495 Никитин <w@w-495.ru> 
 *  @date       2013.05.04 11:27:30
 *  @version    1.0
 *
 *****************************************************************************)

program ws06_file_text;

var f:text;
var s:string;

var string_counter: integer;
var max_string_len: integer;
var max_string_number: integer;
var string_len: integer;


begin
    assign(f,'output.txt');
    reset(f);
    string_counter := 0;
    max_string_len := 0;
    max_string_number := 0;
    
    repeat
        string_counter := string_counter + 1;
        readln(f, s);
        string_len := length(s);
        
        if(string_len > max_string_len) then
        begin
            max_string_len := string_len ;
            max_string_number := string_counter;
        end

    until eof(f);
    
     writeln('max_string_len = ', max_string_len, ' max_string_number = ', max_string_number);
        
    close(f);
end.



