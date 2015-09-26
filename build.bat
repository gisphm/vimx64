@ECHO OFF

if exist vim-win64.7z del vim-win64.7z

REM set library versions ...
REM ------------------------------------
REM set LIBPYTHON2=27
set LIBPYTHON3=35
set LIBLUASHRT=53
set LIBTCLSHRT=86
set LIBTCLLONG=8.6

SET VIM_SRC=C:\WorkSpaces\buildvim\vim

CD /D %VIM_SRC%

git clean -xdf

git checkout master -f
git pull

CD /D %VIM_SRC%\src

REM create output directory ...
REM ------------------------------------
IF NOT EXIST temp\win64 mkdir temp\win64

REM prepare the environment ...
REM ------------------------------------
call "C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\vcvarsall.bat" amd64

SET CPU=AMD64
SET DEBUG=no
SET FEATURES=HUGE
SET MBYTE=yes
SET CSCOPE=yes
SET SNIFF=yes
SET IME=yes
SET NETBEANS=no
SET ICONV=yes
SET GETTEXT=yes
SET WINVER=0x0500
SET OPTIMIZE=MAXSPEED
SET LUA=C:\Dev\Utils\lua
SET DYNAMIC_LUA=yes
SET LUA_VER=%LIBLUASHRT%
REM SET PYTHON=C:\Dev\Python\Python27
REM SET DYNAMIC_PYTHON=yes
REM SET PYTHON_VER=%LIBPYTHON2%
SET PYTHON3=C:\Users\phmfk\AppData\Local\Programs\Python\Python35
SET DYNAMIC_PYTHON3=yes
SET PYTHON3_VER=%LIBPYTHON3%
SET TCL=C:\Dev\Utils\tcl
SET TCL_VER=%LIBTCLSHRT%
SET TCL_VER_LONG=%LIBTCLLONG%
SET DYNAMIC_TCL=yes
SET XPM=no
SET SDK_INCLUDE_DIR=C:\Program Files (x86)\Microsoft SDKs\Windows\v7.1A\Include
SET MSVCVER=14.0

REM compile! (x64)
REM -------------------------------------
nmake /C /S /f Make_mvc.mak clean
nmake /C /S /f Make_mvc.mak IME=yes GIME=yes GUI=yes OLE=yes DIRECTX=yes
nmake /C /S /f Make_mvc.mak clean
nmake /C /S /f Make_mvc.mak IME=no GIME=no GUI=no OLE=no DIRECTX=no

REM keep up the right directory structure
REM -------------------------------------
robocopy ..\runtime\ temp\win64 /MIR
copy ..\vimtutor.* temp\win64
copy xxd\xxd.exe temp\win64
copy *.exe temp\win64
copy vimtbar.dll temp\win64
copy README.txt temp\win64

mkdir temp\win64\GVimExt
mkdir temp\win64\VisVim

copy gvimext\*.dll temp\win64\gvimext\
copy gvimext\*.inf temp\win64\gvimext\
copy gvimext\*.reg temp\win64\gvimext\
copy gvimext\README.txt temp\win64\gvimext\

copy VisVim\*.txt temp\win64\VisVim\
copy VisVim\*.dll temp\win64\VisVim\
copy VisVim\*.bat temp\win64\VisVim\

REM cleanup
REM ------------------------------------
del temp\win64\vimlogo.*
del temp\win64\*.png
del temp\win64\vim??x??.*

REM pack it!
REM ------------------------------------
cd temp\win64
"%PROGRAMFILES%\7-Zip\7z" a -mx=9 -r -bd ..\..\..\..\vim-win64.7z *

CD /D %VIM_SRC%\src
RMDIR /S /Q temp

@ECHO ON