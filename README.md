# Vimx64
老早就想自己在 Windows 上编译个 Vim 来玩玩的，只是一直没这个需求，也算是自己懒。

## 编译64位 *Vim*
+ 首先得从 Github 上把 [Vim 的仓库][1] 克隆代码下来。
+ 然后要有 Visual Studio 2015 的编译环境，至于怎么安装，我就不多说了，可以搜索出一大堆东西来。
+ 最后就是编译。我参考了这位德国大大的 [编译脚本][2] （之前都是下载他编译好的），然后写了个自己的 [编译脚本](build.bat)。
	1. **build.bat** 里 `LUA` `PYTHON3` `TCL` 三个变量指向各自的安装路径。
	2. **build.bat** 里 `VIMSRC` 变量是指克隆下来的代码的完整路径。
	3. **build.bat** 里的其他变量请参考源代码里的 [Make_mvc.mak][4] 文件。
+ 我编译好的 [64位 Vim](Vim.7z)，自己上传一份。

## vim 支持库列表
+ ctags (用 Visual Studio 2015 编译，源码来自 [universal-ctags][3])
+ lua 5.3.1 （用 Visual Studio 2015 编译）
+ python 3.5 （官方下载的二进制安装包）
+ tcl 8.6.4 （用 Visual Studio 2015 自行编译）

## 几点说明
+ 我没有安装 Python 2.7，所以没有 python2 的支持。
+ 若启用 xpm 库支持，则在 Visual Studio 2015 的编译过程中库`libXpm.lib`出现链接问题，无法编译出 GUI，故舍去 xpm 库。

## `:ver` 命令输出为

```
VIM - Vi IMproved 7.4 (2013 Aug 10, compiled Sep 30 2015 05:17:25)
MS-Windows 64-bit console version
Included patches: 1-889
Huge version without GUI.  Features included (+) or not (-):
+acl             +eval            +mouse           +syntax
+arabic          +ex_extra        -mouseshape      +tag_binary
+autocmd         +extra_search    +multi_byte      +tag_old_static
-balloon_eval    +farsi           +multi_lang      -tag_any_white
-browse          +file_in_path    -mzscheme        +tcl/dyn
++builtin_terms  +find_in_path    -netbeans_intg   -tgetent
+byte_offset     +float           +path_extra      -termresponse
+cindent         +folding         -perl            +textobjects
+clientserver    -footer          +persistent_undo +title
+clipboard       +gettext/dyn     -postscript      -toolbar
+cmdline_compl   -hangul_input    +printer         +user_commands
+cmdline_hist    +iconv/dyn       +profile         +vertsplit
+cmdline_info    +insert_expand   -python          +virtualedit
+comments        +jumplist        +python3/dyn     +visual
+conceal         +keymap          +quickfix        +visualextra
+cryptv          +langmap         +reltime         +viminfo
+cscope          +libcall         +rightleft       +vreplace
+cursorbind      +linebreak       -ruby            +wildignore
+cursorshape     +lispindent      +scrollbind      +wildmenu
+dialog_con      +listcmds        +signs           +windows
+diff            +localmap        +smartindent     +writebackup
+digraphs        +lua/dyn         +sniff           -xfontset
-dnd             +menu            +startuptime     -xim
-ebcdic          +mksession       +statusline      -xterm_save
+emacs_tags      +modify_fname    -sun_workshop    -xpm_w32
   system vimrc file: "$VIM\vimrc"
     user vimrc file: "$HOME\_vimrc"
 2nd user vimrc file: "$HOME\vimfiles\vimrc"
 3rd user vimrc file: "$VIM\_vimrc"
      user exrc file: "$HOME\_exrc"
  2nd user exrc file: "$VIM\_exrc"
Compilation: cl -c /W3 /nologo  -I. -Iproto -DHAVE_PATHDEF -DWIN32  -DFEAT_SNIFF -DFEAT_CSCOPE       -DWINVER=0x0500 -D_WIN32_WINNT=0x0500  /Fo.\ObjCUHTAMD64/ /Ox -DNDEBUG  /Zl /MT -DFEAT_MBYTE -DDYNAMIC_ICONV -DDYNAMIC_GETTEXT -DFEAT_TCL -DDYNAMIC_TCL -DDYNAMIC_TCL_DLL=\"tcl86.dll\" -DDYNAMIC_TCL_VER=\"8.6\" -DFEAT_LUA -DDYNAMIC_LUA -DDYNAMIC_LUA_DLL=\"lua53.dll\" -DFEAT_PYTHON3 -DDYNAMIC_PYTHON3 -DDYNAMIC_PYTHON3_DLL=\"python35.dll\" -DFEAT_HUGE /Fd.\ObjCUHTAMD64/ /Zi
Linking: link /RELEASE /nologo /subsystem:console oldnames.lib kernel32.lib advapi32.lib shell32.lib gdi32.lib  comdlg32.lib ole32.lib uuid.lib /machine:AMD64   libcmt.lib  user32.lib shell32.lib  /nodefaultlib:lua53.lib    /nodefaultlib:python35.lib   "C:\Dev\Utils\tcl\lib\tclstub86.lib" /PDB:vim.pdb -debug
```

[1]: https://github.com/vim/vim
[2]: https://tuxproject.de/projects/vim/_compile.bat.php
[3]: https://github.com/universal-ctags/ctags.git
[4]: https://github.com/vim/vim/blob/master/src/Make_mvc.mak