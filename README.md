По мотивам http://www.mariobadr.com/using-clang-tidy-with-cmake-36.html

### Другой вариант:
1. Создать **compile_commands.json**
    ```
    cd yaml-cpp_test\cmakefiles_gcc
    cmake -G "MinGW Makefiles" -DCMAKE_EXPORT_COMPILE_COMMANDS=ON ..
    ````
1. Открыть **compile_commands.json**
1. Открыть файл **includes_CXX.rsp**, указанный в строке ***command*** файла **compile_commands.json**
1. Заменить в файле **compile_commands.json** путь до файла **includes_CXX.rsp** на содержимое файла **includes_CXX.rsp**
1. Вызвать скрипт run-clang-tidy.py
    ```
    "D:\Program Files\LLVM\share\clang\run-clang-tidy.py" -p .
    ```
1. PROFIT
