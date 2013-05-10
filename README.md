# Что это?

Материалы к семинарам по курсу «Алгоритмические языки программирования» (АЯП).
Преподаются на основе изучения языка Pascal.
© 2013 КО-101С, кафедра 806, МАИ, «Комета»

# Структура

## workshop-01

Вводный семинар по Pascal.
Посвящен обзору простейших средств языка 
на примере вычисления чисел Фибоначчи 
и инвертировании целого числа.
В исходных файлах приведен пример документирования кода.

## workshop-02

Посвящен работе с массивами и логическим типом.
Подсчет максимального количества подряд стоящих элементов логического массива, 
имеющих значение `true`. Приведены три версии программы.

## workshop-03

Работа с матрицами. Умножение матриц.

## workshop-04

Работа со структурами (записями).
Умножения матриц произвольной размерности.
Линеаризации матриц по диагоналям (jpeg).

## workshop-05

Работа со строками на примере поиска лишних закрывающихся скобок.

## workshop-06

Работа с файлами.

## workshop-07

Графика. Динамические картинки.

# Содержимое
    .
    |-- README.md
    |-- workshop-01
    |   |-- invert_12345.pas
    |   |-- invert_long.pas
    |   |-- README.md
    |   `-- ws01_fib
    |       |-- ws01_fib01.pas
    |       |-- ws01_fib02_1.pas
    |       |-- ws01_fib02.pas
    |       |-- ws01_fib03.pas
    |       |-- ws01_fib04.pas
    |       |-- ws01_fib05.pas
    |       |-- ws01_fib06.pas
    |       |-- ws01_fib07.pas
    |       `-- ws01_fib08.pas
    |-- workshop-02
    |   |-- README.md
    |   |-- ws02_count_true_compact.pas
    |   |-- ws02_count_true_debug.pas
    |   `-- ws02_count_true.pas
    |-- workshop-03
    |   |-- README.md
    |   |-- ws03_matrix_1.pas
    |   |-- ws03_matrix_1.win.cp1251.pas
    |   `-- ws03_matrix_1.win.utf-8.pas
    |-- workshop-04
    |   |-- README.md
    |   |-- ws04_jpeg_lin.pas
    |   |-- ws04_jpeg_lin_simple.pas
    |   `-- ws04_multmatrix.pas
    |-- workshop-05
    |   |-- README.md
    |   |-- ws05_brackets_via_string.pas
    |   |-- ws05_brackets_with_eof.pas
    |   |-- ws05_brackets_with_eoln.pas
    |   `-- ws05_string_examples.pas
    |-- workshop-06
    |   |-- input.txt
    |   |-- output.txt
    |   |-- README.md
    |   |-- ws06_brackets
    |   |   |-- input.txt
    |   |   |-- output.txt
    |   |   |-- README.md
    |   |   `-- ws06_brackets_with_eof.pas
    |   |-- ws06_file_dre.pas
    |   |-- ws06_file_read.pas
    |   |-- ws06_file_write.pas
    |   `-- ws06_stringcut
    |       |-- fls.py
    |       |-- input.txt
    |       |-- output.txt
    |       |-- README.md
    |       `-- ws06_stringcut.pas
    `-- workshop-07
        |-- fight.pas
        |-- geometry.pas
        |-- img
        |   |-- demo16bitcolor.png
        |   |-- fight.png
        |   |-- keycircle.png
        |   |-- math.png
        |   |-- README.md
        |   `-- triafractal.png
        |-- keycircle.pas
        |-- math.pas
        |-- movecircle.pas
        |-- randomcircle.pas
        |-- README.md
        `-- tests
            |-- demo16bitcolor.pas
            |-- getgmode.pas
            |-- gmodeinfo.pas
            |-- keytests.pas
            |-- README.md
            `-- triafractal.pas
            


# Возможные проблемы

1. Тестирование проводилось для Free Pascal
2. Некоторые конструкции могут не работать для `PascalABC` или `Turbo Pascal`.
3. Все файлы в кодировке `UTF-8`. 
    Для операционных систем отстающих от жизни (семейство Windows)
    могут открываться с потерей кириллических символов