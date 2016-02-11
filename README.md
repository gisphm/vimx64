# Vimx64
老早就想自己在 Windows 上编译个 Vim 来玩玩的，只是一直没这个需求，也算是自己懒。

## 编译 64 位 *Vim*
+ 首先得从 Github 上把 [Vim 的仓库][1] 克隆代码下来。
+ 然后要有 Visual Studio 2015 的编译环境，至于怎么安装，我就不多说了，可以搜索出一大堆东西来。
+ 最后就是编译。我参考了这位德国大大的 [编译脚本][2] （之前都是下载他编译好的），然后写了个自己的 [编译脚本](build.bat)。
+ **build.bat** 变量说明
    1. `LUA` `PYTHON3` `TCL` 三个变量指向各自的二进制安装路径。
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
+ 系统里必须要有 [Visual C++ Redistributable for Visual Studio 2015 Update 1][5]。
+ ~~我没有安装 Python 2.7，所以没有 python2 的支持。~~
+ ~~若启用 xpm 库支持，则在 Visual Studio 2015 的`gvim.exe`链接过程中库`libXpm.lib`会出现链接问题，无法编译出 GUI，故舍去 xpm 库。~~
    + 我重新用 Visual Studio 2015 编译了 xpm 库。现在的 GVim 可以打开 xpm 文件了。

## `ctags.exe` 版本信息
```
Universal Ctags 0.0.0, Copyright (C) 2015 Universal Ctags Team
Universal Ctags is derived from Exuberant Ctags.
Exuberant Ctags 5.8, Copyright (C) 1996-2009 Darren Hiebert
  Compiled: Jan 27 2016, 18:46:44
  URL: https://ctags.io/
  Optional compiled features: +win32, +wildcards, +regex, +internal-sort
```

## `gvim.exe` 的 `:ver` 命令输出为

```
VIM - Vi IMproved 7.4 (2013 Aug 10, compiled Feb  11 2016 10:36:01)
MS-Windows 64-bit GUI version with OLE support
Included patches: 1-1301
Huge version with GUI.  Features included (+) or not (-):
+acl                +emacs_tags         +mouse              +syntax
+arabic             +eval               +mouseshape         +tag_binary
+autocmd            +ex_extra           +multi_byte_ime/dyn +tag_old_static
+balloon_eval       +extra_search       +multi_lang         -tag_any_white
+browse             +farsi              -mzscheme           +tcl/dyn
++builtin_terms     +file_in_path       -netbeans_intg      -tgetent
+byte_offset        +find_in_path       +ole                -termresponse
+channel            +float              +path_extra         +textobjects
+cindent            +folding            -perl               +title
+clientserver       -footer             +persistent_undo    +toolbar
+clipboard          +gettext/dyn        -postscript         +user_commands
+cmdline_compl      -hangul_input       +printer            +vertsplit
+cmdline_hist       +iconv/dyn          +profile            +virtualedit
+cmdline_info       +insert_expand      +python/dyn         +visual
+comments           +jumplist           +python3/dyn        +visualextra
+conceal            +keymap             +quickfix           +viminfo
+cryptv             +langmap            +reltime            +vreplace
+cscope             +libcall            +rightleft          +wildignore
+cursorbind         +linebreak          -ruby               +wildmenu
+cursorshape        +lispindent         +scrollbind         +windows
+dialog_con_gui     +listcmds           +signs              +writebackup
+diff               +localmap           +smartindent        -xfontset
+digraphs           +lua/dyn            +sniff              -xim
+directx            +menu               +startuptime        -xterm_save
-dnd                +mksession          +statusline         +xpm_w32
-ebcdic             +modify_fname       -sun_workshop
   system vimrc file: "$VIM\vimrc"
     user vimrc file: "$HOME\_vimrc"
 2nd user vimrc file: "$HOME\vimfiles\vimrc"
 3rd user vimrc file: "$VIM\_vimrc"
      user exrc file: "$HOME\_exrc"
  2nd user exrc file: "$VIM\_exrc"
  system gvimrc file: "$VIM\gvimrc"
    user gvimrc file: "$HOME\_gvimrc"
2nd user gvimrc file: "$HOME\vimfiles\gvimrc"
3rd user gvimrc file: "$VIM\_gvimrc"
    system menu file: "$VIMRUNTIME\menu.vim"
Compilation: cl /favor:blend -c /W3 /nologo  -I. -Iproto -DHAVE_PATHDEF -DWIN32  -DFEAT_SNIF -DFEAT_CSCOPE  -DFEAT_CHANNEL   -DFEAT_XPM_W32   -DWINVER=0x0500 -D_WIN32_WINNT=0x0500  /Fo.\ObjGXOUYHTAMD64/ /Ox /GL -DNDEBUG  /Zl /MT -DFEAT_OLE -DFEAT_MBYTE_IME -DDYNAMIC_IME -DGLOBAL_IME -DFEAT_MBYTE -DFEAT_GUI_W32 -DFEAT_DIRECTX -DDYNAMIC_DIRECTX -DDYNAMIC_ICONV -DDYNAMIC_GETTEXT -DFEAT_TCL -DDYNAMIC_TCL -DDYNAMIC_TCL_DLL=\"tcl86.dll\" -DDYNAMIC_TCL_VER=\"8.6\" -DFEAT_LUA -DDYNAMIC_LUA -DDYNAMIC_LUA_DLL=\"lua53.dll\" -DFEAT_PYTHON -DDYNAMIC_PYTHON -DDYNAMIC_PYTHON_DLL=\"python27.dll\" -DFEAT_PYTHON3 -DDYNAMIC_PYTHON3 -DDYNAMIC_PYTHON3_DLL=\"python35.dll\" -DFEAT_HUGE /Fd.\ObjGXOUYHTAMD64/ /Zi
Linking: link /RELEASE /nologo /subsystem:windows /LTCG:STATUS oldnames.lib kernel32.lib advapi32.lib shell32.lib gdi32.lib  comdlg32.lib ole32.lib uuid.lib /machine:AMD64 gdi32.lib version.lib winspool.lib comctl32.lib advapi32.lib shell32.lib  /machine:AMD64  libcmt.lib oleaut32.lib user32.lib shell32.lib  /nodefaultlib:lua53.lib   /nodefaultlib:python27.lib /nodefaultlib:python35.lib "C:\Dev\Utils\tcl\lib\tclstub86.lib" WSock32.lib xpm\x64\lib\libXpm.lib /PDB:gvim.pdb -debug
```

[1]: https://github.com/vim/vim
[2]: https://tuxproject.de/projects/vim/_compile.bat.php
[3]: https://github.com/universal-ctags/ctags.git
[4]: https://github.com/vim/vim/blob/master/src/Make_mvc.mak
[5]: https://www.microsoft.com/en-us/download/details.aspx?id=49984
