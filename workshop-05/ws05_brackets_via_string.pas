(*****************************************************************************
 *
 *  @mainpage Поиск лишних закрывающихся скобок. Решение через строку.
 *
 *  @section ОПИСАНИЕ
 *      Принимает на стандартный ввод любую стоку.
 *      Если в строке встречаются открывающиеся и закрывающиеся скобки,
 *      то закрывающиеся скобки для которой нет открывающихся, заменяет на 
 *      знаки вопроса. Основная проблема этой программы в том, 
 *      что в большинстве версий Pascal работает правильно, 
 *      только если размер строки не превышает 255 символов.
 *
 *      @subsection ЗАДАЧА
 *          Каждую закрывающую скобку `)`, для которой 
 *          нет парной открывающей `(`, заменить на `?`.
 *
 *      @subsection АЛГОРИТМ
 *          1) Считать строку со стандартного ввода.
 *          2) Завести счетчики для `(` и `)`.
 *          3) Для каждого символа стоки :
 *              *   выяснить равен он `(` или `)`;
 *              *   увеличить соответствующий счетчик;
 *              *   если число правых скобок оказывается больше,
 *                  то заменяем текущий символ ( ')' ) на знак вопроса.
 *          4) Выводим получившуюся строку.
 *
 *      @subsection ПРОБЛЕМА
 *          Может работать только со строками не более 255 символов.
 *
 *  @section ЛИЦЕНЗИЯ (MIT\MAI)
 *      © 2013 КО-101С, кафедра 806, МАИ, «Комета»
 *      Данная лицензия разрешает лицам, получившим копию данного
 *      программного обеспечения и сопутствующей документации,
 *      в дальнейшем именуемыми «Программное Обеспечение»,
 *      безвозмездно использовать Программное Обеспечение без ограничений
 *      на территории РФ, включая неограниченное право на использование,
 *      копирование, изменение, добавление, публикацию, распространение,
 *      сублицензирование и/или продажу копий Программного Обеспечения,
 *      также как и лицам, которым предоставляется данное
 *      Программное Обеспечение, при соблюдении следующих условий:
 *          Указанное выше уведомление об авторском праве
 *          и данные условия должны быть включены во все копии
 *          или значимые части данного Программного Обеспечения.
 *      Данное программное обеспечение предоставляется «как есть»,
 *      без каких-либо гарантий, явно выраженных или подразумеваемых,
 *      включая, но не ограничиваясь гарантиями товарной пригодности,
 *      соответствия по его конкретному назначению и отсутствия нарушений прав.
 *      ни в каком случае авторы или правообладатели не несут ответственности
 *      по искам о возмещении ущерба, убытков или других требований
 *      по действующим контрактам, деликтам или иному, возникшим из,
 *      имеющим причиной или связанным с программным обеспечением
 *      или использованием программного обеспечения
 *      или иными действиями с программным обеспечением.
 *
 *  @file ws05_brackets_via_string.pas
 *      Основной файл программы, именно его и нужно компилировать.
 *
 *  @package ws05_brackets_via_string
 *      Основной модуль программы.
 *
 *  @author     Кирпичев Александр,
 *              Илья w-495 Никитин <w@w-495.ru> 
 *                  (из КО-101С,  кафедра 806, МАИ, «Комета»)
 *  @version    1.1
 *
 *****************************************************************************)

program ws05_brackets_via_string;

(*****************************************************************************
                ОБЪЯВЛЕНИЯ КОНСТАНТ И ТИПОВ
 *****************************************************************************)

(**
    @type   size_t  тип для счетчиков и индексов символов в строке.
            Определяем как отдельный тип,
            на случай, если вдруг, размерности не хватит 
            и его придется заменить. Например на `longint`.
    type size_t  = longint; 
**)
type size_t  = integer;


(**
    @var    my_number_of_left_brackets 
            глобальный счетчик открытых (левых) скобок.
**)
var my_number_of_left_brackets: size_t;

(**
    @var    my_number_of_right_brackets
            глобальный счетчик закрытых (правых) скобок.
**)
var my_number_of_right_brackets: size_t;

(*****************************************************************************
                ОПИСАНИЕ ФУНКЦИЙ И ПРОЦЕДУР
 *****************************************************************************)

(**
    @fn my_function
        проверяет чему равен входной символ,
        и если это лишняя закрывающаяся скобка,
        то заменяет его на знак вопроса, и возвращает его.
    @param my_character входной символ.
    @returns            обработанный символ.
**)
function my_function(my_character: char) : char;
    begin
        (**
            Если входной символ левая скобка,
                просто увеличиваем счетчик левых скобок.
        **)
        if('(' = my_character) then
            my_number_of_left_brackets := my_number_of_left_brackets + 1;
        (**
            Если входной символ правая скобка,
                увеличиваем счетчик правых скобок,
                сравниваем число правых скобок и левых скобок,
                и если число правых оказывается больше,
                то заменяем текущий символ ( `)` ) на знак вопроса.
        **)
        if(')' = my_character) then
        begin
            my_number_of_right_brackets := my_number_of_right_brackets + 1;
            (**
                Если число правых скобок оказывается больше,
                то заменяем текущий символ ( `)` ) на знак вопроса.
            **)
            if (my_number_of_right_brackets > my_number_of_left_brackets) then
                my_character := '?';
        end;
        (**
            Возвращаем текущий символ.
        **)
        my_function := my_character;
    end;

(**
    @fn main
        Производит все вычисления, собранные вместе.
        Основная процедура программы.
        Выделение кода программы из основного блока 
        в отдельную процедуру полезен тем,
        что позволяет независимо использовать переменные.
        Так мы избавляемся от глобальных переменных,
        и используем только локальные переменные процедуры.
            1) Не запутаемся в большой программе что есть, что.
            2) Не будет пересечения пространств имен.
            3) Проще искать ошибки.
**)
procedure main;
    (** 
        @var my_input_string        входная строка.
    **)
    var my_input_string:        string;
    (** 
        @var my_input_string_length длина входной строки.
    **)
    var my_input_string_length: size_t;
    (** 
        @var my_counter             счетчик символов входной строки.
    **)
    var my_counter:             size_t;
    begin
        (**
            Считываем строку.
            В большинстве систем считывается только 255 символов.
        **)
        readln(my_input_string);
        (**
            Вычисляем длину сроки.
        **)
        my_input_string_length := length(my_input_string);
        (**
            Задаем счетчикам нулевое значение.
        **)
        my_number_of_left_brackets  := 0;
        my_number_of_right_brackets := 0;
        (**
            Проходим по строке и обрабатываем каждый ее символ
            в соответствии с функцией `my_function'.
        **)
        for my_counter := 1 to my_input_string_length do
            my_input_string[my_counter] := 
                my_function(my_input_string[my_counter]);
        (**
            Выводим результат обработки.
        **)
        writeln(my_input_string);
    end;

(**
    В основном блоке программы происходит только вызов процедуры `main`.
**)
begin
    main();
end.



