(*****************************************************************************
 *
 *  @doc        Различные примеры работы со строками.
 *  @author     Илья w-495 Никитин <w@w-495.ru> 
 *  @date       2013.05.01 23:20:42
 *  @version    1.2
 *
 *****************************************************************************)

program ws05_string_examples;


procedure main;
    var s1      :string;
    var s2      :string;
    var s3      :string;
    var s4      :string;
    var s5      :string;
    var ibr_i   :integer;
    var ibr_r   :real;
    var code    :byte;
    var k       :integer;
    var x       :real;
    var str      :string;
    begin
        (** 
            Создаем 2 строки.
        **)
        s1  :=  'mos';
        s2  :=  'cow';
        
        (** 
            Сложим 2 стоки,
            => получили `'moscow'`.
        **)
        s3  :=  s1 + s2;
        writeln('s3 = s1 + s2 = ', s3);
        
        (** 
            Сложим 2 стоки,
            => получили `'moscow'`.
        **)
        s3  :=  concat(s1, s2);
        writeln('s3 = concat(s1, s2) = ', s3);
        
        (** 
            Узнаем длину строки 's3',
            => получили `6`.
        **)
        k :=  length(s3);
        writeln('k = length(s3) = ', k);
        
        (** 
            Узнаем индекс подстроки `'m'`
            => получили `1`.
        **)
        k   :=  pos('m', s3);
        writeln('k = pos(''m'', s3) = ', k);
        
        (** 
            Узнаем индекс подстроки `'M'`
            => получили `0` (нет такой буквы).
        **)
        k   :=  pos('M', s3);
        writeln('k = pos(''M'', s3) = ', k);
        
        (** 
            Узнаем индекс подстроки `s2` (`'cow'`)
            => получили `4`.
        **)
        k   :=  pos(s2, s3);
        writeln('k = pos(s2, s3) = ', k);
        
        (** 
            Узнаем индекс подстроки `'na'` в строке `'banana'`.
            =>  получили `3`.
            Примечание: 
                ищется только первое вхождение.
        **)
        k   :=  pos('na','banana');
        writeln('k = pos(''na'',''banana'') = ', k);
        
        (** 
            Скопируем часть строки `s3` 4 символа, начиная с 3.
            => получили `'scow'`.
        **)
        s4  :=  copy(s3, 3, 4); 
        writeln('s4 = copy(s3, 3, 4) = ', s4);
        
        (** 
            Удалим из строки `s4` 1 символ, начиная с 1.
            => получили `'cow'`.
        **)
        delete(s4, 1, 1);
        writeln('delete(s4, 1, 1); s4 = ', s4);
        
        (** 
            Удалим из строки `s3` 3 символа, начиная с 2.
            => получили `'mow'`.
        **)
        delete(s3, 2, 3);
        writeln('delete(s3, 1, 1); s3 = ', s3);
        
        (** 
            Вставим стоку `s3` в строку `s4`, начиная с третьей позиции.
            Результат записывается в `s4`. `insert('mow', 'cow', 3);`
            =>  получили `'comoww'`,
                подробнее: 'co(mow)w'.
        **)
        insert(s3, s4, 3);
        writeln('insert(s3, s4, 3); s4 = ', s4);
        
        (** 
            Вставим стоку `s4` в строку `s3`, начиная с третьей позиции.
            Результат записывается в `s3`. `insert('comoww', 'mow', 3);`
            =>  получили `'mocomowww'`.
                подробнее: 'mo(comoww)w'.
        **)
        insert(s4, s3, 3);
        writeln('insert(s4, s3, 3); s3 = ', s3);
        
        (** 
            Вставим стоку `'middle-'` в строку `s5` (`'start-end.'`), 
            начиная с седьмой позиции. Результат записывается 
            в `s5`. `insert('middle-', 'start-end.', 7);`
            =>  получили `'start-middle-end.'`,
                подробнее: 'start-(middle-)end.'.
        **)
        s5 := 'start-end.';
        writeln('s5 = ', s5);
        insert('middle-', s5, 7);
        writeln('insert(''middle-'', s5, 7); s5 = ', s5);
        
        (********************************************************************* 
            Процедура `val(st,ibr,code)` преобразует значение `st` 
            в величину целочисленного или вещественного типа и помещает
            значение в переменную `ibr`. значение `st` не должно содержать 
            незначащих пробелов в начале и в конце. 
            `code` целочисленная переменная. Если во время операции 
            преобразования ошибки не обнаружено, значение `code` равно нулю,
            если ошибка обнаружена, `code` будет содержать номер позиции
            первого ошибочного символа, а значение `ibr` не определено. 
        *********************************************************************)
        
        
        val('2013', ibr_i, code);
        
        writeln(
            'val(''2013'', ibr_i, code);', 
            ' ibr_i = ', ibr_i, 
            ' code = ', code
        );
        
        val('0.33', ibr_r, code);
        
        writeln(
            'val(''0.33'', ibr_r, code);', 
            ' ibr_r = ', ibr_r, 
            ' code = ', code
        );

        val('1.5', ibr_r, code);
        
        writeln(
            'val(''1.5'', ibr_r, code);', 
            ' ibr_r = ', ibr_r, 
            ' code = ', code
        );

        val('1.5', ibr_i, code);
        
        writeln(
            'val(''1.5'', ibr_i, code);', 
            ' ibr_i = ', ibr_i, 
            ' code = ', code
        );
        
        val(' 2013 ', ibr_i, code);
        
        writeln(
            'val('' 2013 '', ibr_i, code);', 
            ' ibr_i = ', ibr_i, 
            ' code = ', code
        );
        
        val('20-13', ibr_i, code);
        
        writeln(
            'val(''20-13'', ibr_i, code);', 
            ' ibr_i = ', ibr_i, 
            ' code = ', code
        );
        
        (********************************************************************* 
            Форматирование вывода
        *********************************************************************)
        k := 234;
        
        writeln(' k    = (', k, ')');
        
        writeln(' k:2  = (', k:2, ')');
        writeln(' k:4  = (', k:4, ')');
        writeln(' k:6  = (', k:6, ')');
        writeln(' k:8  = (', k:8, ')');
        writeln(' k:10 = (', k:10, ')');
        
        k := -234;
        
        writeln(' k    = (', k, ')');
        
        writeln(' k:2  = (', k:2, ')');
        writeln(' k:4  = (', k:4, ')');
        writeln(' k:6  = (', k:6, ')');
        writeln(' k:8  = (', k:8, ')');
        writeln(' k:10 = (', k:10, ')');
        
        x := 234.12;
        
        writeln(' x    = (', x, ')');
        
        writeln(' x:2  = (', x:2, ')');
        writeln(' x:8  = (', x:8, ')');
        writeln(' x:10 = (', x:10, ')');
        writeln(' x:14 = (', x:14, ')');
        writeln(' x:20 = (', x:20, ')');
        
        x := -234.12;
        
        writeln(' x    = (', x, ')');
        
        writeln(' x:2  = (', x:2, ')');
        writeln(' x:8  = (', x:8, ')');
        writeln(' x:10 = (', x:10, ')');
        writeln(' x:14 = (', x:14, ')');
        writeln(' x:20 = (', x:20, ')');
        
        x := 234.12;
        
        writeln(' x      = (', x, ')');
        
        writeln(' x:2:1  = (', x:2:0, ')');
        writeln(' x:2:1  = (', x:2:1, ')');
        writeln(' x:2:2  = (', x:2:2, ')');
        writeln(' x:2:3  = (', x:2:3, ')');

        writeln(' x:6:1  = (', x:6:0, ')');
        writeln(' x:6:1  = (', x:6:1, ')');
        writeln(' x:6:2  = (', x:6:2, ')');
        writeln(' x:6:3  = (', x:6:3, ')');

        writeln(' x:10:1  = (', x:10:0, ')');
        writeln(' x:10:1  = (', x:10:1, ')');
        writeln(' x:10:2  = (', x:10:2, ')');
        writeln(' x:10:3  = (', x:10:3, ')');
        
        x := -234.12;
        
        writeln(' x      = (', x, ')');
        
        writeln(' x:2:1  = (', x:2:0, ')');
        writeln(' x:2:1  = (', x:2:1, ')');
        writeln(' x:2:2  = (', x:2:2, ')');
        writeln(' x:2:3  = (', x:2:3, ')');

        writeln(' x:6:1  = (', x:6:0, ')');
        writeln(' x:6:1  = (', x:6:1, ')');
        writeln(' x:6:2  = (', x:6:2, ')');
        writeln(' x:6:3  = (', x:6:3, ')');

        writeln(' x:10:1  = (', x:10:0, ')');
        writeln(' x:10:1  = (', x:10:1, ')');
        writeln(' x:10:2  = (', x:10:2, ')');
        writeln(' x:10:3  = (', x:10:3, ')');
 
        str := '*';
        
        writeln(' str    = (', str, ')');
        
        writeln(' str:2  = (', str:2, ')');
        writeln(' str:4  = (', str:4, ')');
        writeln(' str:6  = (', str:6, ')');
        writeln(' str:8  = (', str:8, ')');
        writeln(' str:10 = (', str:10, ')');

        str := 'abc';
        
        writeln(' str    = (', str, ')');
        
        writeln(' str:2  = (', str:2, ')');
        writeln(' str:4  = (', str:4, ')');
        writeln(' str:6  = (', str:6, ')');
        writeln(' str:8  = (', str:8, ')');
        writeln(' str:10 = (', str:10, ')');
    end;

begin
    main();
end.



