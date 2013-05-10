# Семинар № 7 (тесты)

Тесты графической системы.
Тесты для PascalABC.NET работать не будут.
Нормально работают для компилятора Free Pascal для ОС Linux\Unix.
Возможно, будут работать для Turbo Pascal в Windows.

# Содержимое

    .
    ├── demo16bitcolor.pas  Тест цветовой схемы.
    ├── getgmode.pas        Тест графического режима.
    ├── gmodeinfo.pas       Список графических режимов.
    ├── keytests.pas        Тест клавиатуры.
    └── triafractal.pas     Фрактал ковер Серпинского.

# Установка Graph

## Unix

`graph` по умолчанию нет. Вместо него лучше использовать `ptcgraph`.
Ниже описано, что нужно сделать для этого.

### i686

    sudo su -
    ln -s /usr/lib/libXxf86vm.so.1.0.0      /usr/lib/libXxf86vm.so
    ln -s /usr/lib/libXxf86dga.so.1.0.0     /usr/lib/libXxf86dga.so

### x86_64

    sudo su -
    ln -s /usr/lib64/libXxf86vm.so.1.0.0    /usr/lib64/libXxf86vm.so
    ln -s /usr/lib64/libXxf86dga.so.1.0.0   /usr/lib64/libXxf86dga.so

# Windows

Если графическая библиотека не подключилась автоматически,
и не удается ее прописать в настройках компилятора,
то можно скопировать папку с библиотекой `graph` в папку, 
где расположен сам компилятор.
