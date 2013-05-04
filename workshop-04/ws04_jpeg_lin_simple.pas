(*****************************************************************************
 *
 *  @mainpage   Линеаризация матриц проходом по диагоналям
 *              с юго-запада на северо-восток.
 *              Метод линеаризации, похожий на данный используется
 *              в jpeg-сжатии. Его суть в том, чтобы близкие
 *              в двумерном пространстве пиксели оказались близки 
 *              друг другу после линеаризации. 
 *              При обычном слиянии строк матрицы, это не возможно.
 *
 *              |--[Пометка]--------------------------------------------------|
 *              |   На самом деле, такая хитрая линеаризация используется,    |
 *              |   немного по иной причине. Интересует близость, только      |
 *              |   северо-западного угла, и работа происходит на с пикселями,|
 *              |   а со спектральным представлением изображения.             |
 *              |   Для простоты, такие детали пока будем игнорировать.       |
 *              |   В решении задачи они роли не играют.                      |
 *              |-------------------------------------------------------------|
 *
 *              ( 11 12 13 14 15 )
 *              ( 21 22 23 24 25 )
 *              ( 31 32 33 34 35 )  =>  11, 21, 12, 31, 22, 13, 
 *              ( 41 42 43 44 45 )          41, 32, 23, 14, 51, 42, 
 *              ( 51 52 53 54 55 )              33, 24, 15, 52, 43, 34,
 *                                                  25, 53, 44, 35, 54, 45, 55. 
 *
 *  @section ОПИСАНИЕ
 *      Пример использование: 
 *          |$>./ws04_jpeg_lin_simple
 *          |3 3                <--{пометка: размерность}
 *          |1 2 3              <--{пометка: сама матрица}
 *          |4 5 6
 *          |7 8 9                  
 *          |1 4 2 7 5 3 8 6 9  <--{пометка: линеаризованное представление}
 *
 *      @subsection ЗАДАЧА
 *          Требуется линеаризовать матрицу: пройтись по ее диагоналям
 *          с юго-запада на северо-восток и распечатать значения ячеек.
 *
 *      @subsection АЛГОРИТМ
 *          Проходим по матрице, на каждом новом шаге вычисляем 
 *          координаты новой ячейки по формуле:
 *              point.row       := point.row - 1;
 *              point.column    := point.column + 1;
 *          Если мы достигли самого северного края, то перепрыгиваем на
 *          на начало следующей диагонали. Ее point.column будет равняться 1.
 *          Если мы достигли самого восточного края, то перепрыгиваем на
 *          на начало следующей диагонали. Ее point.row будет равняться,
 *          количеству строк матрицы.
 *          Алгоритм детально описан в функции `point_next`.
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
 *  @file ws04_jpeg_lin_simple.pas
 *      Основной файл программы, линеаризации матриц.
 *
 *  @package ws04_jpeg_lin_simple
 *      Основной модуль программы, линеаризации матриц.
 *
 *  @author     Кирпичев Александр,
 *              Илья w-495 Никитин <w@w-495.ru> 
 *                  (из КО-101С,  кафедра 806, МАИ, «Комета»)
 *  @date       2013.05.01 00:00:03
 *  @version    1.0
 *
 *****************************************************************************)

program ws04_jpeg_lin_simple;

(*****************************************************************************
                ОБЪЯВЛЕНИЯ КОНСТАНТ И ТИПОВ
 *****************************************************************************)

(**
    @const MAXRANGE Максимальный возможный размер вектора
**)
const MAXRANGE = 128;

(**
    @type   size_t  тип индексов массивов и матриц
            Определяем как отдельный тип,
            на случай, если вдруг, размерности не хватит 
            и его придется заменить. Например на `longint.
    type size_t  = longint; 
**)
type size_t  = word;

(**
    @type   cell_t  тип содержимого матрицы.
            Определяем как отдельный тип,
            на случай, если вдруг придется его заменить.
            Например на `real`.
    type cell_t  = real;
**)
type cell_t  = longint;

(**
    @type   array_t  тип массива из `cell_t`
**)
type array_t  = array[1..MAXRANGE] of cell_t;

(**
    @type   array_t  тип массива из `cell_t`
**)
type matrixcontent_t  = array[1..MAXRANGE] of array_t;

(**
    @type   matrix_t   тип матрицы — содержимое и размерность.
**)
type matrix_t = record
    (**
        @field  content содержимое матрицы
    **)
    content     :matrixcontent_t;
    (**
        @field  nrows   количество строк
    **)
    nrows       :size_t;
    (**
        @field  nrows   количество столбцов
    **)
    ncolumns    :size_t;
end;

(**
    @type   point_t   координаты ячейки, пара (строка, столбец)
**)
type point_t = record
    (**
        @field  row     номер строки ячейки
    **)
    row       :size_t;
    (**
        @field  column  номер столбца ячейки
    **)
    column    :size_t;
end;

(*****************************************************************************
                ОПИСАНИЕ ФУНКЦИЙ И ПРОЦЕДУР
 *****************************************************************************)

(**
    @fn matrix_read 
        Считывает матрицу размером nrows, ncolumns со стандартного ввода
        и возвращает ее.
**)
function matrix_read(): matrix_t;
    var row,                (** номер строки  **)
        column: size_t;     (** номер столбца **)
    var result: matrix_t;   (** входная матрица **)
    begin
        (** считали количество строк матрицы **)
        read(result.nrows);
        (** считали количество столбцов матрицы **)
        read(result.ncolumns);
        for row := 1 to result.nrows do
            for column := 1 to result.ncolumns do
                read(result.content[row][column]);
        matrix_read := result;
    end;

(**
    @fn     matrix_get_cell 
            Возвращает значение ячейки матрицы по координатам ячейки.
    @param  matrix  матрица, для которой считаем координаты.
    @param  point   значения точки;
**)
function matrix_get_cell(matrix: matrix_t; point: point_t): cell_t;
    begin
        matrix_get_cell := (matrix.content[point.row][point.column]);
    end;

(**
    @fn     point_new 
            Инициализирует начальное положение координат ячейки матрицы.
**)
function point_new(): point_t;
    var point :point_t;
    begin
        point.row       := 1;
        point.column    := 1;
        point_new       := point;
    end;
    
(**
    @fn     point_next 
            Возвращает значение следующих координат (точки) ячейки матрицы.
    @param  point   старые координаты ячейки;
    @param  matrix  матрица, для которой считаем координаты.
**)
function point_next(point: point_t; matrix: matrix_t): point_t;
    var newpoint :point_t;
    begin
        if(matrix.ncolumns = point.column) then
        begin
            (** 
                Прыжок вниз: т.к. мы достигли крайней восточной грани.
            **)
            newpoint.row    := matrix.nrows;
            newpoint.column := point.row + 1 ;
        end
        else if(1 = point.row) then
        begin
            (** 
                Прыжок вниз: т.к. мы достигли крайней северной грани.
            **)
            newpoint.row    := point.column + 1;
            newpoint.column := 1;
        end
        else
        begin
            (** 
                Подъем вверх по диагонали с юго-запада на северо-восток.
            **)
            newpoint.row    := point.row - 1;
            newpoint.column := point.column + 1;
        end;
        point_next := newpoint;
    end;
    
(**
    @fn main Производит все вычисления, собранные вместе.
**)
procedure main;
    var matrix       :matrix_t; (** входная матрица  **)
    var point        :point_t;  (** координаты ячейки матрицы **)
    var counter      :size_t;   (** cчетчик шагов **)
    var cell         :cell_t;   (** значение ячейки матрицы **)
    begin
        counter := 0;
        matrix  := matrix_read();
        point   := point_new();
        while (counter < (matrix.nrows * matrix.ncolumns)) do
        begin
            counter := counter + 1;
            cell    := matrix_get_cell(matrix, point);
            write(cell, ' ');
            point   := point_next(point, matrix);
        end;
        writeln();
    end;

(**
    В основном блоке программы происходит только вызов процедуры `main`.
**)
begin
    main();
end.


