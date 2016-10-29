# Vimx64
老早就想自己在 Windows 上编译个 Vim 来玩玩的，只是一直没这个需求，也算是自己懒。

## 编译 64 位 *Vim*
+ 首先得从 Github 上把 [Vim 的仓库][1] 克隆代码下来。
+ 然后要有 Visual Studio 2015 的编译环境，至于怎么安装，我就不多说了，可以搜索出一大堆东西来。
+ 最后就是编译。我参考了这位德国大大的 [编译脚本][2] （之前都是下载他编译好的），然后写了个自己的 [编译脚本](build.bat)。
+ **build.bat** 变量说明
    1. `LUA` `PYTHON` `TCL` 三个变量指向各自的二进制安装路径。
    2. `VIM_SRC` 是指克隆下来的 Vim 源代码的完整路径。
    2. `ZIP_DIR` 是指最终的 `vim-win64.7z` 的放置路径。
    3. 其他变量请参考源代码里的 [Make_mvc.mak][4] 文件。
+ 我编译好的 [64 位 Vim](vim-win64.7z)，自己上传一份。

## vim 支持库列表
+ ctags （用 Visual Studio 2015 编译，源码来自 [universal-ctags][3])
+ lua 5.3.2 （用 Visual Studio 2015 编译）
+ python 2.7.11 （官方下载的最新版本二进制安装包）
+ python 3.5.1 （官方下载的最新版本二进制安装包）
+ tcl 8.6.4 （用 Visual Studio 2015 自行编译）

## 几点说明
+ 压缩包里已经自带有最新版本的 `ctags.exe` `lua53.dll` `tcl86.dll`。
+ 系统里必须要有 [Visual C++ Redistributable for Visual Studio 2015 Update 3][5]。
+ 使用 `Windows 10 SDK (ver. 10.0.14393.0)` 构建。
+ `Win32.mak` 来自 `Windows 7.1A SDK`。
+ ~~我没有安装 Python 2.7，所以没有 python2 的支持。~~
+ ~~若启用 xpm 库支持，则在 Visual Studio 2015 的`gvim.exe`链接过程中库`libXpm.lib`会出现链接问题，无法编译出 GUI，故舍去 xpm 库。~~
    + 我重新用 Visual Studio 2015 编译了 xpm 库。现在的 GVim 可以打开 xpm 文件了。

## `ctags.exe` 版本信息
```
Universal Ctags 0.0.0, Copyright (C) 2015 Universal Ctags Team
Universal Ctags is derived from Exuberant Ctags.
Exuberant Ctags 5.8, Copyright (C) 1996-2009 Darren Hiebert
  Compiled: Oct 30 2016, 05:16:09
  URL: https://ctags.io/
  Optional compiled features: +win32, +wildcards, +regex, +internal-sort
```

## `gvim.exe` 的 `:ver` 命令输出为

```
VIM - Vi IMproved 8.0 (2016 Sep 12, compiled Oct 30 2016 05:19:58)
MS-Windows 64-bit GUI version 带 OLE 支持
包含补丁: 1-54
巨型版本 带图形界面。  可使用(+)与不可使用(-)的功能:
+acl                +eval               +mouse              +syntax
+arabic             +ex_extra           +mouseshape         +tag_binary
+autocmd            +extra_search       +multi_byte_ime/dyn +tag_old_static
+balloon_eval       +farsi              +multi_lang         -tag_any_white
+browse             +file_in_path       -mzscheme           +tcl/dyn
++builtin_terms     +find_in_path       -netbeans_intg      -termguicolors
+byte_offset        +float              +num64              -tgetent
+channel            +folding            +ole                -termresponse
+cindent            -footer             +packages           +textobjects
+clientserver       +gettext/dyn        +path_extra         +timers
+clipboard          -hangul_input       -perl               +title
+cmdline_compl      +iconv/dyn          +persistent_undo    +toolbar
+cmdline_hist       +insert_expand      -postscript         +user_commands
+cmdline_info       +job                +printer            +vertsplit
+comments           +jumplist           +profile            +virtualedit
+conceal            +keymap             +python/dyn         +visual
+cryptv             +lambda             +python3/dyn        +visualextra
+cscope             +langmap            +quickfix           +viminfo
+cursorbind         +libcall            +reltime            +vreplace
+cursorshape        +linebreak          +rightleft          +wildignore
+dialog_con_gui     +lispindent         -ruby               +wildmenu
+diff               +listcmds           +scrollbind         +windows
+digraphs           +localmap           +signs              +writebackup
+directx            +lua/dyn            +smartindent        -xfontset
-dnd                +menu               +startuptime        -xim
-ebcdic             +mksession          +statusline         +xpm_w32
+emacs_tags         +modify_fname       -sun_workshop       -xterm_save
     系统 vimrc 文件: "$VIM\vimrc"
     用户 vimrc 文件: "$HOME\_vimrc"
 第二用户 vimrc 文件: "$HOME\vimfiles\vimrc"
 第三用户 vimrc 文件: "$VIM\_vimrc"
      用户 exrc 文件: "$HOME\_exrc"
  第二用户 exrc 文件: "$VIM\_exrc"
    系统 gvimrc 文件: "$VIM\gvimrc"
    用户 gvimrc 文件: "$HOME\_gvimrc"
第二用户 gvimrc 文件: "$HOME\vimfiles\gvimrc"
第三用户 gvimrc 文件: "$VIM\_gvimrc"
       defaults file: "$VIMRUNTIME\defaults.vim"
        系统菜单文件: "$VIMRUNTIME\menu.vim"
编译方式: cl /favor:blend -c /W3 /nologo  -I. -Iproto -DHAVE_PATHDEF -DWIN32  -DFEAT_CSCOPE -DFEAT_JOB_CHANNEL -DFEAT_XPM_W32 -DWINVER=0x0500 -D_WIN32_WINNT=0x0500 /Fo.\ObjGXOUYHTAMD64/ -DHAVE_STDINT_H /Ox /GL -DNDEBUG /Zl /MT -DFEAT_OLE -DFEAT_MBYTE_IME -DDYNAMIC_IME -DGLOBAL_IME -DFEAT_MBYTE -DFEAT_GUI_W32 -DFEAT_DIRECTX -DDYNAMIC_DIRECTX -DDYNAMIC_ICONV -DDYNAMIC_GETTEXT -DFEAT_TCL -DDYNAMIC_TCL -DDYNAMIC_TCL_DLL=\"tcl86.dll\" -DDYNAMIC_TCL_VER=\"8.6\" -DFEAT_LUA -DDYNAMIC_LUA -DDYNAMIC_LUA_DLL=\"lua53.dll\" -DFEAT_PYTHON -DDYNAMIC_PYTHON -DDYNAMIC_PYTHON_DLL=\"python27.dll\" -DFEAT_PYTHON3 -DDYNAMIC_PYTHON3 -DDYNAMIC_PYTHON3_DLL=\"python35.dll\" -DFEAT_HUGE /Fd.\ObjGXOUYHTAMD64/ /Zi
链接方式: link /RELEASE /nologo /subsystem:windows /LTCG:STATUS oldnames.lib kernel32.lib advapi32.lib shell32.lib gdi32.lib  comdlg32.lib ole32.lib uuid.lib /machine:AMD64 gdi32.lib version.lib   winspool.lib comctl32.lib advapi32.lib shell32.lib  /machine:AMD64  libcmt.lib oleaut32.lib user32.lib  /nodefaultlib:lua53.lib   /nodefaultlib:python27.lib /nodefaultlib:python35.lib   "C:\Dev\Utils\tcl\lib\tclstub86.lib" WSock32.lib xpm\x64\lib-vc14\libXpm.lib /PDB:gvim.pdb -debug
```

[1]: https://github.com/vim/vim
[2]: https://tuxproject.de/projects/vim/_compile.bat.php
[3]: https://github.com/universal-ctags/ctags.git
[4]: https://github.com/vim/vim/blob/master/src/Make_mvc.mak
[5]: https://www.microsoft.com/en-us/download/details.aspx?id=53587
