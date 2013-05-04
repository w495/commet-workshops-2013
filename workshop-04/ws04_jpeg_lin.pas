(*****************************************************************************
 *
 *  @doc    Линеаризация матриц проходом по диагоналям
 *          змейкой, с юго-запада на северо-восток 
 *          и с северо-востока на югозапад.
 *          Метод линеаризации, похожий на данный используется
 *          в jpeg-сжатии. Его суть в том, чтобы близкие
 *          в двумерном пространстве пиксели оказались близки 
 *          друг другу после линеаризации. 
 *          При обычном слиянии строк матрицы,s это не возможно.
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
 *  @file ws04_jpeg_lin.pas
 *      Основной файл программы, линеаризации матриц.
 *
 *  @package ws04_jpeg_lin
 *      Основной модуль программы, линеаризации матриц.
 *
 *  @author     Илья w-495 Никитин <w@w-495.ru> 
 *                  (из КО-101С,  кафедра 806, МАИ, «Комета»)
 *  @date       2013.05.01 00:00:03
 *  @version    2.0
 *
 *****************************************************************************)

program ws04_jpeg_lin;

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
    @type   array_t  тип массива из cell_t
**)
type array_t  = array[1..MAXRANGE] of cell_t;

(**
    @type   array_t  тип массива из cell_t
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


(**
    @type   direction_t   направление обхода
**)
type direction_t = (
    from_southwest_to_northeast,
    from_northeast_to_southwest
);


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
    @fn     point_is_equal 
            Возвращает равенство точек.
            Точки равны если все их координаты равны.
**)
function point_is_equal(xpoint, ypoint: point_t): boolean;
    begin
        point_is_equal := ((xpoint.row = xpoint.column) 
            and (xpoint.column = ypoint.column));
    end;

(**
    @fn     point_next 
            Возвращает значение следующих координат (точки) ячейки матрицы.
    @param  oldpoint        старые  координаты ячейки;
    @param  currentpoint    текущие координаты ячейки;
    @param  matrix          матрица, для которой считаем координаты.
**)
function point_next(oldpoint, currentpoint: point_t; matrix: matrix_t): point_t;
    var newpoint :point_t;
    begin
        (** 
            ... Напишите самостоятельно.
        **)
        point_next := newpoint;
    end;

(**
    @fn main Производит все вычисления, собранные вместе.
**)
procedure main;
    var matrix          :matrix_t;  (** входная матрица  **)
    var oldpoint        :point_t;   (** старые координаты ячейки матрицы **)
    var currentpoint    :point_t;   (** текущие координаты ячейки матрицы **)
    var tmppoint        :point_t;   (** переменная для обмена координат **)
    var counter         :size_t;    (** cчетчик шагов **)
    var cell            :cell_t;    (** значение ячейки матрицы **)
    begin
        counter         := 0;
        matrix          := matrix_read();
        oldpoint        := point_new();
        currentpoint    := point_new();
        while (counter < (matrix.nrows * matrix.ncolumns)) do
        begin
            counter  := counter + 1;
            cell     := matrix_get_cell(matrix, currentpoint);
            write(cell, ' ');
            tmppoint        := currentpoint;
            currentpoint    := point_next(oldpoint, currentpoint, matrix);
            oldpoint        := tmppoint;
        end;
        writeln();
    end;

(**
    В основном блоке программы происходит только вызов процедуры `main`.
**)
begin
    main();
end.


