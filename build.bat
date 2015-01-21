@echo off

if exist vim-win64.7z del vim-win64.7z

if exist vim rd /S /Q vim

git clone --depth=1 https://github.com/gisphm/vim-mirror.git vim

cd vim\src

REM set library versions ...
REM ------------------------------------
set LIBPYTHON2=27
set LIBPYTHON3=34
set LIBLUASHRT=52
set LIBPERLVER=520
set LIBTCLSHRT=86
set LIBTCLLONG=8.6

REM create output directory ...
REM ------------------------------------
mkdir temp\win64

REM ------------------------------------
REM x64 (64-bit) packages
REM ------------------------------------

REM prepare the environment ...
REM ------------------------------------
call "C:\Program Files (x86)\Microsoft Visual Studio 10.0\VC\vcvarsall.bat" amd64

REM compile! (x64)
REM -------------------------------------
nmake /C /S /f Make_mvc.mak clean
nmake /C /S /f Make_mvc.mak CPU=AMD64 DEBUG=no FEATURES=HUGE MBYTE=yes CSCOPE=yes SNIFF=yes IME=yes GIME=yes GUI=yes OLE=yes XPM=.\xpm\x64 NETBEANS=no ICONV=yes GETTEXT=yes WINVER=0x0500 DIRECTX=yes OPTIMIZE=MAXSPEED LUA=C:\Dev\Lua DYNAMIC_LUA=yes LUA_VER=%LIBLUASHRT% PYTHON=C:\Dev\Python\Python27 DYNAMIC_PYTHON=yes PYTHON_VER=%LIBPYTHON2% PYTHON3=C:\Dev\Python\Python34 DYNAMIC_PYTHON3=yes PYTHON3_VER=%LIBPYTHON3% PERL=C:\Dev\perl DYNAMIC_PERL=yes PERL_VER=%LIBPERLVER% TCL=C:\Dev\tcl TCL_VER=%LIBTCLSHRT% TCL_VER_LONG=%LIBTCLLONG% DYNAMIC_TCL=yes
nmake /C /S /f Make_mvc.mak clean
nmake /C /S /f Make_mvc.mak CPU=AMD64 DEBUG=no FEATURES=HUGE MBYTE=yes CSCOPE=yes SNIFF=yes IME=no GIME=no GUI=no OLE=no XPM=.\xpm\x64 DIRECTX=no NETBEANS=no OPTIMIZE=MAXSPEED ICONV=yes GETTEXT=yes WINVER=0x0500 LUA=C:\Dev\Lua DYNAMIC_LUA=yes LUA_VER=%LIBLUASHRT% PYTHON=C:\Dev\Python\Python27 DYNAMIC_PYTHON=yes PYTHON_VER=%LIBPYTHON2% PYTHON3=C:\Dev\Python\Python34 DYNAMIC_PYTHON3=yes PYTHON3_VER=%LIBPYTHON3% PERL=C:\Dev\perl DYNAMIC_PERL=yes PERL_VER=%LIBPERLVER% TCL=C:\Dev\tcl TCL_VER=%LIBTCLSHRT% TCL_VER_LONG=%LIBTCLLONG% DYNAMIC_TCL=yes

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
"%PROGRAMFILES%\7-zip\7z" a -mx=9 -r -bd ..\..\..\..\vim-win64.7z *

cd ..\..\..\..
rd /S /Q vim