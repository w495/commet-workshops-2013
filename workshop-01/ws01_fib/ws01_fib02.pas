(*****************************************************************************
 *
 *  @mainpage Числа Фибоначчи. Рабочая версия.
 *
 *  @section ОПИСАНИЕ
 *      Выводит на экран числа Фибоначчи с первого по десятое.
 *
 *      @subsection ЗАДАЧА
 *          Требуется вывести на экран числа Фибоначчи с первого по десятое,
 *          в формате
 *              `номер` -> `число`
 *          Каждая пара (`номер`, `число`) должны быть на отдельной строке.
 *          В лабораторных работах здесь требуется указать номер лабораторной
 *          и номер варианта.
 *
 *      @subsection АЛГОРИТМ
 *          В цикле по вычисляем числа Фибоначчи по определению:
 *              φ(1) = 1;
 *              φ(2) = 1;
 *              φ(n) = φ(n-1) + φ(n-2), n ≥ 3.
 *
 *  @section ЛИЦЕНЗИЯ (GPL)
 *      Данная программа является свободным программным обеспечением;
 *      вы можете распространять и/или изменять его в соответствии
 *      с условиями лицензии GPL, опубликованной
 *      Free Software Foundation либо Лицензии второй версии,
 *      либо (по вашему выбору) любой более поздней версии.
 *      Эта программа распространяется в надежде, что она будет полезной,
 *      но БЕЗ КАКИХ-ЛИБО ГАРАНТИЙ, даже без подразумеваемых гарантий
 *      КОММЕРЧЕСКОЙ ЦЕННОСТИ или ПРИГОДНОСТИ ДЛЯ КОНКРЕТНЫХ ЦЕЛЕЙ.
 *      Смотрите GNU General Public License для более подробной информации
 *      на http://www.gnu.org/copyleft/gpl.html
 *
 *  @file ws01_fib02.pas
 *      Основной файл программы, именно его и нужно компилировать.
 *
 *  @package ws01_fib02
 *      Основной модуль программы,
 *      выводит на экран числа Фибоначчи с первого по десятое.
 *      Рабочая версия программы.
 *
 *  @author     Илья w-495 Никитин <w@w-495.ru>
 *  @date       2013.02.21 13:10:01
 *  @version    0.2.0
 *
 *****************************************************************************)

program ws01_fib02;

(*****************************************************************************
                ОБЪЯВЛЕНИЯ КОНСТАНТ И ПЕРЕМЕННЫХ
 *****************************************************************************)

(**
    @var    counter Счетчик цикла
            counter ∈ integer = [-32768, 32767];
            integer занимает 2 байта.
**)
var counter : integer;

(**
    @var    curr    Текущее значение числа Фибоначчи, на данной итерации.
            curr    ∈ integer = [-32768, 32767];
            integer занимает 2 байта.
**)
var curr    : integer;

(**
    @var    prev    Предыдущее значение числа Фибоначчи, на данной итерации.
            prev    ∈ integer = [-32768, 32767];
            integer занимает 2 байта.
**)
var prev    : integer;

(**
    @var    temp    Временная переменная для обмена значениями.
            temp    ∈ integer = [-32768, 32767];
            integer занимает 2 байта.
**)
var temp    : integer;

(*****************************************************************************
                АЛГОРИТМИЧЕСКАЯ ЧАСТЬ ПРОГРАММЫ
 *****************************************************************************)

begin
    (**
        Присваиваем предыдущему значению 1.
    **)
    prev := 1;
    (**
        Присваиваем текущему значению 1.
    **)
    curr := 1;
    (**
        Выводим первое и второе числа Фибоначчи.
    **)
    writeln(1, ' -> ', 1);
    writeln(2, ' -> ', 1);
    (**
        В цикле присваиваем переменной `curr` сумму старого значения `curr` 
        и значение `prev`. А `prev` присваиваем старое значение `curr`.
        Таким образом мы сдвигаем `prev` и `curr` по нашей последовательности.
        Логически `prev` всегда остается предыдущим,
        а `curr` текущем числом Фибоначчи.
    **)
    for counter := 3 to 10 do begin
        (**
            В `temp` запоминаем предыдущее состояние `curr`.
            Иначе мы его потеряем, так как значение `curr` меняется.
        **)
        temp := curr;
        curr := prev + curr;
        prev := temp;
        (**
            Выводим очередную пару (`номер`, `число`).
        **)
        writeln(counter, ' ->  ', curr);
    end
end.
