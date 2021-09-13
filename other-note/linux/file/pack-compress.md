# 打包与压缩

## 简介

讲之前，先了解两个概念

- 打包（归档）：指将一大堆文件或目录合并一个总的文件，总的文件的大小等于那一大堆文件的总和。
- 压缩：则是将一个大文件通过压缩算法变成一个小文件。

这可能与 windows 的压缩软件有些不存，这些软件的压缩包含了打包和压缩两个过程。GNU 工具在设计上具有简洁的特点，一个工具就专心做一件事，这也是为什么在 Linux 中打包与压缩是分开的原因吧。

## 常见程序

Linux 中常见的打包和压缩程序

|程序|格式|备注|
|:-:|:-:|:-:|
|`tar`|`.tar`|打包程序，原生功能不包括压缩功能|
|`compress`|`.Z`|unix 档案压缩程序|
|`zip`|`.zip`|通用的压缩容器程序，支持多种压缩算法，主要基于 DEFLATE|
|`gzip`|`.gz`|GNUzip 的缩写，可以看作是 `zip` 的 GNU 版本的实现，算法基于 DEFLATE|
|`bzip2`|`.bz2`||
|`7z`|`.7z`|通用的压缩容器程序，支持多种压缩算法，主要使用 lzma/lzma2 算法|
|`lzma`|`.lzma`|使用 lzma 算法|
|`xz`|`.xz`|使用 lzma/lzma2 算法，基于 `7z` 的 `LZMA SDK` 开发|
|`tar` + `compress`|`.tar.Z`|
|`tar` + `gzip`|`.tar.gz`||
|`tar` + `bzip2`|`.tar.bz2`||
|`tar` + `lzma`|`.tar.lzma`||
|`tar` + `xz`|`.tar.xz`||
|`rar`|`.rar`|商业软件，压缩算法属于商业，解压算法公开|

说明：

- 上面列举的程序中，只有 `tar` 是打包程序，其他均为压缩程序（或者具备压缩功能）。
- `compress`、`gzip`、`bzip2`、`lzma` 和 `xz` 这几个类 Unix 压缩程序，只接受单个文件，也就是没有包含打包功能。
- `zip`、`7z` 和 `rar` 都具有归案和压缩的功能。
- `.zip` 是一种很流行的格式，被广泛在安卓的 `.apk` 格式、java 的 `.jar`、电子书的 `.epub` 等等。
- 可以简单认为 `gzip`（这是由于一开始 `zip` 是共享软件才诞生） 是 Linux 版本的 `zip`，`xz` 是 Linux 版本的 `7z`。

在 Linux 上如何选择：

- `compress` 是一个相当古老的 unix 档案压缩指令，后被 `gzip` 取代
- `rar` 属于商业软件，一般也不推荐。
- `zip` 由于诞生较早，有较多设计上的缺陷，例如没有规定文件名的编码，容易乱码。
- `zip` 和 `7z` 都不能保留 unix 风格的文件权限，这也是在 unix 风格系统上很少使用这两个程序的原因之一
- `gz` 在压缩率和压缩时间上拥有良好的平衡，也是最常见的。`xz` 是一代压缩，拥有更好的压缩率，但是相对要慢很多。
- `bzip2` 算是 linux 压缩历史上，过渡时期的产物，性能也介于 `gz` 和 `xz` 之间，一般来说不需要考虑它。
- 可以认为 `lzma` 是 `xz` 的老版本，不推荐使用。

总的来说，在 Linux 上一般选择 `gzip` 和 `xz`

## tar

### 常用参数

第一选项：指定操作方式，必须存在一个，不能同时使用

- `-c`：create，创建归档文件
- `-x`：extract，解压归档文件
- `-t`：list，列出归档文件的内容列表
- `-A`：append，追加文件（只对未压缩的归档文件有效）
- `-r`：replace，向归档文件中添加（替换）文件（只对未压缩的归档文件有效）
- `-u`：update，更新归档文件中的内容（只对未压缩的归档文件有效）
- `-d`：diff，比较归档文件和文件之间的差异

压缩选项

|选项|程序|格式|
|:-:|:-:|:-:|
|`-Z`|`compress`|`.Z`|
|`-z`|`gzip`|`.gz`|
|`-j`|`bzip2`|`.bz2`|
|`-a`|`lzma`|`.lzma`|
|`-J`|`xz`|`.xz`|

通用选项

- `-v`：verbose，输出详细信息
- `-f`：file，指定输出文件名
- `-w`：交互模式

其他选项

- `-C`：指定解压目录

### 使用

.tar

```bash
# pack
tar -cvf dest.tar src1 src2 ...
# unpack
tar -xvf dest.tar
```

.tar.Z

```bash
# pack and compress
tar -cZvf dest.tar.Z src1 src2 ...
# unpack
tar -xZvf dest.tar.Z
```

.tar.gz

```bash
# pack and compress
tar -czvf dest.tar.gz src1 src2 ...
# unpack
tar -xzvf dest.tar.gz
```

.tar.bz2

```bash
# pack and compress
tar -cjvf dest.tar.bz2 src1 src2 ...
# unpack
tar -xjvf dest.tar.bz2
```

.tar.lzma

```bash
# pack and compress
tar -cavf dest.tar.lzma src1 src2 ...
# unpack
tar -xavf dest.tar.lzma
```

.tar.xz

```bash
# pack and compress
tar -cJvf dest.tar.xz src1 src2 ...
# unpack
tar -xJvf dest.tar.xz
```

## `.Z`

`.Z` 使用 `compress` 进行压缩，`uncompress` 进行解压

`uncompress` 等于 `compress -d`

```bash
# compress
compress src
# uncompress
compress -d src.Z
```

## `.gz`

`.gz` 使用 `gzip` 进行压缩，`gunzip` 进行解压

`gunzip` 等于 `gzip -d`

```bash
# compress
gzip src
# uncompress
gzip -d src.gz
```

- `-c`：将压缩数据输出到标准输出中，并保留源文件。
- `-d`：对压缩文件进行解压缩。
- `-r`：递归压缩指定目录下以及子目录下的所有文件。
- `-v`：对于每个压缩和解压缩的文件，显示相应的文件名和压缩比。
- `-l`：对每一个压缩文件，显示以下字段：压缩文件的大小；未压缩文件的大小；压缩比；未压缩文件的名称。
- `-number`：`number` 用于指定压缩等级，从 1 到 9，数字越大，压缩等级越高。

在使用 gzip 命令压缩文件时，源文件会消失，从而生成压缩文件。这时候如果不想让源文件消失，可以使用先标准输出，再重定向标准输出。

```bash
gzip -c src > dest.gz
```

## `.lzma`

`.lzma` 使用 `lzma` 进行压缩，`unlzma` 进行解压

`unlzma` 等于 `lzma -d`

lzma 等同于 xz –format=lzma

## `.bz2`

`.bz2` 使用 `bzip2` 进行压缩，`bunzip2` 进行解压

`bunzip2` 等同于 `bzip2 -d`

```bash
# compress
bzip2 src
# uncompress
bzip2 -d src.bz2
```

## `.xz`

`.xz` 使用 `xz` 进行压缩，`unxz` 进行解压

`unxz` 等于 `xz -d`

## `.zip`

由于 zip 格式没有规定编码，在中文 Windows 上压缩的文件在 Linux 上可能出现乱码的情况，故并不推荐按照如下直接安装原版的 `unzip`。

```bash
sudo pacman -S zip unzip-iconv
```

`unzip-iconv` 在 `unzip` 的基础上加入 `-I` 和 `-O` 选项。

### zip

常用选项：

- `-r`：递归压缩目录
- `-m`：文件压缩后，删除原文件
- `-v`：显示详细的压缩过程
- `-q`：在压缩时不显示命令的执行过程
- `-number`：`number` 为压缩级别，数字越大，压缩效果越好，时间越长。
- `-u`：更新压缩文件

例子：

```bash
zip dest.zip src1 src2
zip -r dest.zip src1/*
```

### unzip

常用选项：

- `-d`：将压缩文件解压到指定目录下。
- `-n`：解压时并不覆盖已经存在的文件。
- `-o`：解压时覆盖已经存在的文件，并且无需用户确认。
- `-v`：查看压缩文件的详细信息，包括压缩文件中包含的文件大小、文件名以及压缩比等，但并不做解压操作。
- `-t`：测试压缩文件有无损坏，但并不解压。
- `-x`：解压文件，但不包含文件列表中指定的文件。

例子：

```bash
unzip dest.zip -d dir/
zip -O GBK windows.zip
```

## `.7z`

安装：

```bash
sudo pacman -S p7zip
```

常用的第一选项

- `a`：添加文件/目录到压缩包中（压缩包不存在则是创建压缩包）
- `d`：从压缩包中删除文件
- `l`：列出压缩包的内容
- `rn`：重命名压缩包里的文件
- `t`：测试压缩包的完整性
- `u`: 更新压缩包里面的文件
- `x`：解压，按照压缩包里面的路径解压

通用选项：

- `-o`：指定输出目录
- `-r`：递归子目录

例子

```bash
7z a dest.7z src1 src2
7z x dest.7z -o dir/
```

## `.rar`

直接安装 rar 包就包含了 `rar` 和 `unrar` 两个程序了。

```bash
sudo pacman -S rar
```

### rar

常见的第一选项：

- `a`：添加文件/目录到压缩包中（压缩包不存在则是创建压缩包）
- `d`：从压缩包中删除文件
- `l`：列出压缩包的内容
- `rn`：重命名压缩包里的文件
- `t`：测试压缩包的完整性
- `u`: 更新压缩包里面的文件
- `x`：解压，按照压缩包里面的路径解压

例子：

```bash
rar a dest.rar src1 src2
rar d dest.rar file
rar x dest.rar /path/to/extract/
```

### unrar

貌似直接使用 `rar` 即可。

## 参考资料

- [Linux(四)：Linux的打包和压缩详解](https://www.cnblogs.com/TheGCC/p/14228439.html)
- [常见压缩格式的区别，及 Linux 下的压缩相关指令](https://www.cnblogs.com/kirito-c/p/8970652.html)
- [为什么 Linux 要用 tar.gz，很少用 7Z 或 ZIP？ - LdBeth的回答 - 知乎](https://www.zhihu.com/question/335911358/answer/755424668)

