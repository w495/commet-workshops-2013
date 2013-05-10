# Семинар № 7 (Тесты)

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
