(*****************************************************************************
 *
 *  @doc        Операции с файлом: удаление, переименование. Компактная версия.
 *  @author     Илья w-495 Никитин <w@w-495.ru> 
 *  @date       2013.05.04 10:47:51
 *  @version    1.1
 *
 *****************************************************************************)
 
program ws06_file_dre;

var
    f   :file;
    ch  :string;
    st  :string;
begin
    write('Enter file name: ');
    readln(st);
    assign(f,st);
    write('delete (d), rename (r), exit (e)');
    readln(ch);
    case ch of
        'D','d':
            erase(f);
        'R','r':
            begin
                write('Enter new name: ');
                readln(st);
                rename(f,st);
            end;
        'E','e': 
            halt(1);
    end;
end.
