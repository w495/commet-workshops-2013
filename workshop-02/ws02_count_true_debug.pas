(*****************************************************************************
 *
 *  @mainpage Подсчет количества элементов массива.
 *
 *  @section ОПИСАНИЕ
 *      Подсчитывает максимальное количество подряд 
 *      стоящих элементов логического массива, имеющих значение `true`.
 *      Массив создается в программе, так что каждый элемент кратный  
 *      `FILLARRAY_FACTOR`. становится `false`, остальные `true`.
 *      Размер массива задан константой `MAXSIZE`.      
 *      Программа выводит подробное журнал своих действий.
 *      
 *      @subsection ЗАДАЧА
 *          Подсчитать максимальное количество подряд 
 *          стоящих элементов логического массива, имеющих значение `true`.
 *
 *      @subsection АЛГОРИТМ
 *          После заполнения массива. Выполняем следующий алгоритм:
 *              Заводим 2 счетчика:
 *                  1) количество подряд идущих `true` в массиве;
 *                  2) максимальное количество подряд идущих `true` в массиве.
 *              Проходим по массиву.
 *                  Если значение в ячейке равно `true`,
 *                  то увеличиваем количество подряд идущих `true` на 1.
 *                  Иначе сбрасываем счетчик до 0.
 *                  Увеличении количества подряд идущих `true` проверяем, 
 *                  не стал ли оно больше чем максимальное.
 *                  Если стало, то принимаем текущее количество `true`
 *                  за максимальное.
 *              Продолжаем пока не пройдем весь массив.
 *              Выводи максимальное количество подряд идущих `true`.
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
 *  @file ws02_count_true_debug.pas
 *      Основной файл программы, именно его и нужно компилировать.
 *
 *  @package ws02_count_true_debug
 *      Основной модуль программы, умножения матриц.
 *
 *  @author     Cуворов Михаил,
 *              Илья w-495 Никитин <w@w-495.ru> 
 *                  (из КО-101С,  кафедра 806, МАИ, «Комета»)
 *  @date       2013.03.02 16:57:10
 *  @version    1.2
 *
 *****************************************************************************)

program ws02_count_true_debug;

(*****************************************************************************
                ОБЪЯВЛЕНИЯ КОНСТАНТ И ТИПОВ
 *****************************************************************************)

(**
    @const  MAXSIZE Максимальный возможный размер массива.
**)
const MAXSIZE = 1024;

(**
    @const  FILLARRAY_FACTOR   делитель для заполнения массива 
            внутри функции fillarray.
**)
const FILLARRAY_FACTOR = 17;

(**
    @type   size_t  тип индексов массивов и матриц
            Определяем как отдельный тип,
            на случай, если вдруг, размерности не хватит 
            и его придется заменить. Например на `longint.
    type size_t  = longint; 
**)
type size_t  = word;

(**
    @type   contents_t  тип содержимого матрицы.
            Определяем как отдельный тип,
            на случай, если вдруг придется его заменить.
            Например на `(1, 0)`.
**)
type contents_t  = boolean;

(**
    @type   array_t  тип массива из contents_t (boolean)
**)
type boolean_array_t = array[1..MAXSIZE] of contents_t;

(*****************************************************************************
                ОПИСАНИЕ ФУНКЦИЙ И ПРОЦЕДУР
 *****************************************************************************)

(**
    @fn fillarray 
        Возвращает массив размерности msize.
        Заполняет его значениями `true` и `false`,
        так, что каждый элемент кратный 
        FILLARRAY_FACTOR становится `false`, остальные `true`.
    @param msize размер заполняемого массива.
**)
function fillarray(msize :size_t): boolean_array_t;
    (**
        @var counter   счетчик для прохода по массиву.
    **)
    var     counter     :size_t;
    (**
        @var value массив, который требуется заполнить.
    **)
    var     value    :contents_t;
    (**
        @var boolean_array массив, который требуется заполнить.
    **)
    var boolean_array   :boolean_array_t;
    begin
        (** 
            Проходим по массиву и для каждого
            элемента вычисляем чему он равен.
        **)
        for counter := 1 to MAXSIZE do begin
            (** 
                Если остаток от деления номера элемента counter 
                на FILLARRAY_FACTOR равен нулю 
                (т.е. counter кратен FILLARRAY_FACTOR),
                    то boolean_array[counter] = false;
                если остаток не равен нулю,
                    то boolean_array[counter] = false;
            **)
            value := (0 = (counter mod FILLARRAY_FACTOR));
            boolean_array[counter] := not value;
        end;
        fillarray := boolean_array
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
        @var    counter   
                счетчик для прохода по массиву.
    **)
    var counter         :size_t;
    (**
        @var    ntrues
                количество подряд идущих true в массиве.
    **)
    var ntrues      :size_t;
    (**
        @var    ntrues_max  
                максимальное количество подряд идущих true в массиве.
    **)
    var ntrues_max  :size_t;
    (**
        @var    boolean_array 
                булевский массив, указанный в задании.
    **)
    var boolean_array   :boolean_array_t;
    begin
        ntrues      := 0;
        ntrues_max  := 0;

        (** 
            Заполняем массив некоторым образом.
            См описание функции fillarray.
        **)
        boolean_array := fillarray(MAXSIZE);
        
        (** 
            Проходим по массиву
        **)
        for counter:= 1 to MAXSIZE do begin
            (* выводим отладочное сообщение: 
                чтобы проверить, 
                какое значение лежит в ячейке массива.
            *)
            writeln(
                '    debug: boolean_array[', 
                counter , 
                '] = ',
                boolean_array[counter],
                ':'
            );
            (** 
                Если значение в ячейке равно true,
                то увеличиваем счетчик ntrues на 1.
                Иначе сбрасываем счетчик до 0.
                    Может оказаться что массив имеет вид,
                        [true, false, true, true, false]
                    В этом случае ntrues после обхода всего массив
                    будет равен 0, т.к. последнее значение равно false.
                    Для решения этой проблемы мы ввели ntrues_max,
                    в который мы помещаем максимальное значение ntrues.
            **)
            if(true = boolean_array[counter]) then
            begin
                (* выводим отладочное сообщение 
                    чтобы проверить, чему равно старое значение ntrues
                *)
                writeln(
                    '    debug:      old ntrues = ',  
                    ntrues, ';'
                );
                (* выводим отладочное сообщение 
                     чтобы проверить, 
                     чему равно старое значение ntrues_max
                *)
                writeln(
                    '    debug:      old ntrues_max = ',  
                    ntrues_max, ';'
                );
                
                (**
                    увеличиваем счетчик ntrues на 1
                **)
                ntrues := ntrues + 1;
                
                (* выводим отладочное сообщение 
                    чтобы проверить, чему равно новое значение `ntrues`
                *)
                writeln(
                    '    debug:      new ntrues = ',  
                    ntrues, ';'
                );
                (* выводим отладочное сообщение 
                    чтобы проверить, больше ли новое значение `ntrues`,
                    чем ntrues_max или нет.
                *)
                writeln(
                    '    debug:      ntrues > ntrues_max = ',  
                    (ntrues > ntrues_max), ';'
                );
                
                (** 
                    Если ntrues больше чем ntrues_max,
                    то это значение ntrues запоминаем в ntrues_max.
                **)
                if ntrues > ntrues_max then
                    ntrues_max := ntrues;

                (* выводим отладочное сообщение 
                    чтобы проверить, чему равно новое значение `ntrues_max`
                *)
                writeln(
                    '    debug:      new ntrues_max = ',  
                    ntrues_max, ';'
                );
            end
            else
            begin
                (* выводим отладочное сообщение 
                    чтобы проверить, чему равно старое значение `ntrues`
                *)
                writeln(
                    '    debug:      old ntrues = ',  
                    ntrues, ';'
                );
                (* выводим отладочное сообщение 
                     чтобы проверить, чему равно старое значение `ntrues_max`
                *)
                writeln(
                    '    debug:      old ntrues_max = ',  
                    ntrues_max, ';'
                );
                
                ntrues := 0;
                
                (* выводим отладочное сообщение 
                    чтобы проверить, чему равно новое значение `ntrues`
                *)
                writeln(
                    '    debug:      new ntrues = ',  
                    ntrues, ';'
                );
                (* выводим отладочное сообщение 
                    чтобы проверить, чему равно новое значение `ntrues_max`
                *)
                writeln(
                    '    debug:      new ntrues = ',  
                    ntrues_max, ';'
                );
            end
        end;
        (* печатаем ответ задачи. *)
        writeln('    debug: ANSWER: ',  ntrues_max, '.');
        
        writeln(ntrues_max);
    end;

(**
    В основном блоке программы происходит только вызов процедуры `main`.
**)
begin
    main();
end.



