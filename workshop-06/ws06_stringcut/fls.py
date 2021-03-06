#! /usr/bin/env python
# --*-- encoding=utf8 --*--

##
##  @mainpage Выравнивает строки текста к заданной длине.
##
##  @section ОПИСАНИЕ
##      Параметры разбиения настраиваются для функции fls.
##      options = {
##          'input_filename':  "input",  # входной файл
##          'output_filename': "output", # выходной файл
##          'splitline':       60,       # длина разбиения
##          'charweight':      2         # размер символа в байтах (для UTF-8,
##                                       #  и других современных кодировок).
##      }
##      Если параметры не указаны, 
##      то берутся по-умолчанию.
##          Входной файл:               stdin.
##          Выходной файл:              stdout.
##          Длина разбиения:            60.
##          Размер символа в байтах:    2.
##      Из входного файла считываются строки произвольной длины
##      и записываются в выходной файл, с выравниванием до заданной длинны,
##      без потери символов строки. При переносе строки, 
##      разбиение происходит по словам, если это оказывается невозможным,
##      (слово длиннее выходной строки) то по символам.
##
##  @section ЛИЦЕНЗИЯ (MIT\MAI)
##      © 2013 Илья w-495 Никитин, кафедра 806, МАИ, «Комета».
##      Данная лицензия разрешает лицам, получившим копию данного
##      программного обеспечения и сопутствующей документации,
##      в дальнейшем именуемыми «Программное Обеспечение»,
##      безвозмездно использовать Программное Обеспечение без ограничений
##      на территории РФ, включая неограниченное право на использование,
##      копирование, изменение, добавление, публикацию, распространение,
##      сублицензирование и/или продажу копий Программного Обеспечения,
##      также как и лицам, которым предоставляется данное
##      Программное Обеспечение, при соблюдении следующих условий:
##          Указанное выше уведомление об авторском праве
##          и данные условия должны быть включены во все копии
##          или значимые части данного Программного Обеспечения.
##      Данное программное обеспечение предоставляется «как есть»,
##      без каких-либо гарантий, явно выраженных или подразумеваемых,
##      включая, но не ограничиваясь гарантиями товарной пригодности,
##      соответствия по его конкретному назначению и отсутствия нарушений прав.
##      ни в каком случае авторы или правообладатели не несут ответственности
##      по искам о возмещении ущерба, убытков или других требований
##      по действующим контрактам, деликтам или иному, возникшим из,
##      имеющим причиной или связанным с программным обеспечением
##      или использованием программного обеспечения
##      или иными действиями с программным обеспечением.
##
##  @file       fls.py  Выравнивает строки текста к заданной длине.
##  @author     Илья w-495 Никитин <w@w-495.ru>
##  @date       2013.04.22 04:08:20
##  @version    1.2
##

# ---------------------------------------------------------------------------
#                          ИМПОРТИРУЕМ ДРУГИЕ МОДУЛИ
# ---------------------------------------------------------------------------

##
## @module sys используем набор системных функций
##
import sys

# ---------------------------------------------------------------------------
#                       ОПИСЫВАЕМ КОНСТАНТЫ ПО УМОЛЧАНИЮ
# ---------------------------------------------------------------------------

##
## @const DEFUAULT_SPLITLINE длина строки (в символах) по-умолчанию
##
DEFUAULT_SPLITLINE = 40;

##
## @const DEFUAULT_SPLITLINE размер символа (в байтах) по-умолчанию
##
DEFUAULT_CHARWEIGHT = 2;

# ---------------------------------------------------------------------------
#                           ОПИСЫВАЕМ ФУНКЦИИ
# ---------------------------------------------------------------------------

##
## @fn      freadline
##          Считывает строку из файла и возвращает ее
##          без завершающего перевода строки (без последнего символа).
## @param   input_file : file
##          входной файл
## @param   options : dict
##          дополнительные параметры (пока не нужны)
##
def freadline(input_file, options = None):
    return input_file.readline()[:-1]

##
## @fn      fwriteline
##          Записывает выходную стоку в файл
##          и добавляет завершающий перевод строки.
## @param   output_file : file
##          выходной файл
## @param   output_string
##          выходная строка
## @param   options : dict
##          дополнительные параметры (пока не нужны)
##
def fwriteline(output_file, output_string, options = None):
    return output_file.write(output_string + '\n')

##
## @fn      readline
##          Считывает строку из файла и возвращает ее
##          без завершающего перевода строки.
## @param   options : dict
##          параметры входного файла
##          options = {
##              "input_filename":        "input.txt",   # имя входного файла
##              "__state.input_file":    <file object>  # входной файл
##          }
##
def readline(options = None):
    # Состояние в котором уже определен входной файл
    input_file = options.get('__state.input_file')
    if (None != input_file):
        return freadline(input_file, options)
    # Состояние в котором еще не определен входной файл
    input_filename = options.get('input_filename')
    if (None != input_filename):
        input_file = open(input_filename, 'r')
        options['__state.input_file'] = input_file;
        return freadline(input_file, options)
    return freadline(sys.stdin, options)

##
## @fn      writeline
##          Считывает строку из файла и возвращает ее
##          без завершающего перевода строки.
## @param   output_string
##          выходная строка
## @param   options : dict
##          параметры выходного файла
##          options = {
##              "input_filename":        "output.txt",  # имя выходного файла
##              "__state.input_file":    <file object>  # выходной файл
##          }
##
def writeline(output_string, options = None):
    #
    output_file = options.get('__state.output_file')
    if (None != output_file):
        return fwriteline(output_file, output_string, options)
    #
    output_filename = options.get('output_filename')
    if (None != output_filename):
        output_file  = open(output_filename, 'w')
        options['__state.output_file'] = output_file
        return fwriteline(output_file, output_string, options)
    return fwriteline(sys.stdout, output_string, options)


##
## @fn      splitstring 
##          Разбивает строку на заданное число символов.
## @param   inputsting : string 
##          входная строка
## @param   options : dict 
##          параметры разбиения
##          options = {,
##              "splitline":    60, # длина разбиения
##              "charweight:    2   # размер символа в байтах
##          }
##          Если параметр options не указан, 
##          то берутся по-умолчанию.
##              Длина разбиения:            60.
##              Размер символа в байтах:    2.
##
def splitstring(inputsting, options = None):
    ## размер символа в байтах
    charweight = options.get('charweight',  DEFUAULT_CHARWEIGHT)
    ## длина разбиения в символах
    splitline  = options.get('splitline',   DEFUAULT_SPLITLINE)
    ## длина разбиения в байтах
    splitbyte  = splitline * charweight
    ## разбиваем строку на слова (по пробелу)
    words = inputsting.split()
    ## узнаем сколько всего слов в строке
    lenwords = len(words)
    ## для всех слов добавляем пробел, 
    ## ибо мы его убрали при разбиении
    for nwords in xrange(lenwords):
        words[nwords] = words[nwords] + " "
    ## заведем счетчик общей длины слов (в байтах)
    counter = 0
    ## для слов строки последовательно вычисляем их суммарную длину
    for nwords in xrange(lenwords):
        counter += len(words[nwords])
        ## если она больше чем `splitbyte`
        ## то пройденные слова без одного последнего слова,
        ## и есть наша искомая строка.
        if(counter > splitbyte):
            ## искомая строка, 
            ## объединяем слова из списка слов,
            ## в одну строку.
            result  = "".join(words[:nwords-1])
            ## остаток исходной строки
            ## объединяем слова из списка слов,
            ## в одну строку.
            rest    = "".join(words[nwords-1:])
            ## со словами мы работали с учетом завершающих пробелов
            ## Т.к. result является отдельной строкой,
            ## то хорошо бы убрать завершающий пробел на его конце.
            return (result[:-1] , rest)
    ## Если поделить строку на основе слов не удалось,
    ## то делим ее просто по символам.
    return (inputsting[:splitbyte], inputsting[splitbyte :])

##
## @fn      fls Выравнивает строки текста к заданной длине.
## @param   options : dict 
##          параметры разбиения
##          options = {
##              'input_filename':   "input.txt",    # входной файл
##              'output_filename':  "output.txt",   # выходной файл
##              'splitline':    60,             # длина разбиения
##              'charweight':    2              # размер символа в байтах
##          }
##          Если параметры не указаны, 
##          то берутся по-умолчанию.
##              Входной файл:               stdin.
##              Выходной файл:              stdout.
##              Длина разбиения:            60.
##              Размер символа в байтах:    2.
##
def fls(options = None):
    rest = "";
    ## читаем строку
    rline = readline(options)
    while(rline):
        ## складываем с остатком прошлого разбиения
        xline = rest + rline;
        ## разбиваем сумму на 2 части: строка нужного размера,
        ## и остаток разбиения
        (result, rest) = splitstring(xline, options)
        ## записываем первый элемент разбиения
        writeline(result, options)
        ## читаем строку
        rline = readline(options)
    ## Если больше нет строк, но есть остаток, 
    ## то до тех пор пока он есть,
    while("" != rest):
        ## разбиваем старый остаток на 2 части: строка нужного размера,
        ## и остаток разбиения
        (result, rest) = splitstring(rest, options)
        ## записываем первый элемент разбиения
        writeline(result, options)

# ---------------------------------------------------------------------------
#                       ТОЧКА ВХОДА ПРОГРАММЫ
#           тоже самое что и главный блок `begin ... end.` в Pascal
# ---------------------------------------------------------------------------

if '__main__' == __name__:
    fls({
        'input_filename':"input.txt",
        'output_filename': "output.txt"
    })
