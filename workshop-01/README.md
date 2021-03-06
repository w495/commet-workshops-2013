# Семинар № 1

Вводный семинар по Pascal.
Посвящен обзору простейших средств языка 
на примере вычисления чисел Фибоначчи 
и инвертировании целого числа.
В исходных файлах приведен пример документирования кода.

# Содержимое
    .
    ├── invert_12345.pas        Инвертирование целого пятизначного числа
    ├── invert_long.pas         Инвертирование целого любой размерности.
    └── ws01_fib                Числа Фибоначчи.
        ├── ws01_fib01.pas      Ошибочная версия.
        ├── ws01_fib02.pas      Рабочая версия.
        ├── ws01_fib02_1.pas    Рабочая версия без временной переменной.
        ├── ws01_fib03.pas      Рабочая версия. Использование константы.
        ├── ws01_fib04.pas      Рабочая версия. Ввод ограничения с клавиатуры.
        ├── ws01_fib05.pas      Рабочая версия. Увеличиваем размерность.
        ├── ws01_fib06.pas      Рабочая версия. Массив.
        ├── ws01_fib07.pas      Рабочая версия. Процедуры.
        └── ws01_fib08.pas      Рабочая версия. Функции.

        
# Возможные проблемы

1. Тестирование проводилось для Free Pascal
2. Некоторые конструкции могут не работать для `PascalABC` или `Turbo Pascal`.
3. Все файлы в кодировке `UTF-8`. 
    Для операционных систем отстающих от жизни (семейство Windows)
    могут открываться с потерей кириллических символов