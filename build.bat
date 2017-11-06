@echo OFF

SET cur_dir=%cd%

IF NOT EXIST cmakefiles_gcc mkdir cmakefiles_gcc
cd cmakefiles_gcc

cmake -G "MinGW Makefiles" .. || goto ERROR
mingw32-make -j8 || goto ERROR

cd %cur_dir%
goto :EOF

:ERROR
cd %cur_dir%
echo "FAILED. Errors were during building"
exit /B 1
