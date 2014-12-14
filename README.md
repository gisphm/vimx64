# Vimx64
老早就想自己在windows上编译个vim来玩玩的，只是一直没这个需求，也算是自己懒。

## 拉取*vim*
首先得下个[__tortoisehg__](http://mercurial.selenic.com/downloads)，自选平台，估计得用迅雷加速一下。

然后找个空的文件夹（最好路径里不要有中文，不然不知道会有什么奇怪的问题）或者新建一个，从google code上克隆
[vim的仓库](https://code.google.com/p/go)。当然，如果确实有问题（比如被墙什么的），也可以从[我的vim镜像](https://git.oschina.net/huanming/Vim.git)里克隆。

再后面就是要有vs2010的编译环境了，至于怎么安装，我就不多说了，可以搜索出一大堆东西来。

最后就是编译。我参考了[这位德国大大的编译脚本](https://tuxproject.de/projects/vim/_compile.bat.php)（之前都是下载他编译好的），然后写了个自己的[编译脚本](compile.bat)。

我编译好的[64位vim](vim-win64.7z)，自己上传一份。