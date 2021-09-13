# File

## stat 命令 

stat 命令用于查看文件的具体存储信息和时间等信息。

```bash
stat /path/to/file
```

- Access time：最近访问时间（atime）
- Modify time：最见修改时间（mtime），指的是文件内容的修改时间
- Change time：最近改动时间（ctime），最近修改 inode 的时间

当使用 `cd` 访问目录，或者 `cat` 访问文件的时候，atime 会发生改变

当在目录添加文件/目录，或者编辑文件后，mtime 会发生改变，由于这些操作会影响目录/文件的大小，所以 ctime 也会跟着改变。但并不是所有修改文件都会影响 mtime 和 ctime。

使用 chmod 等方法修改目录/文件的属性，ctime 会发生改变。

## touch

作用：用于创建空白文件或者设置文件的时间。

常见参数

- `-a`：仅修改“读取时间”（atime, access time）
- `-m`：仅修改“修改时间”（mtime, modification time）
- `-d`：同时修改 atime 和 mtime

**后面再查查**

## cp

全称：copy

作用：用于复制文件或者目录

常见参数

- `-p`：preserve，保留原始文件的属性
- `-d`：--no-dereference，若对象为“链接文件”，则保留该“链接文件”的属性
- `-r`：递归复制文件，用于复制目录

```bash
cp src_file.ext /path/to/dest_file.ext
cp src_file.ext /path/to/dest_dir
cp -r src_dir /path/to/dest_dir
cp -r src_dir /paht/to/dest_dir/
```

## mv

全称：move

作用：用来移动（剪切）文件

```bash
mv src_file.ext /path/to/dest_file.ext
mv src_file.ext /path/to/dest_dir
mv src_dir /path/to/dest_dir
mv src_dir /paht/to/dest_dir/
```

## rm

全称：remove

作用：用来删除文件

常见参数

- `-r`：递归删除文件，用于删除目录
- `-f`：force，默认情况下，使用 `rm` 都会进行提示，`-f` 表示强制删除

```bash
rm -r dir
rm file
```

## dd

作用：用于按照指定大小和个数的数据块来复制文件或转换文件。

常见参数

- `if`：输入的文件名称
- `of`：输出的文件名称
- `bs`：设置每个块的大小
- `count`：设置块的个数

常见用法：

1. 将光驱设备中的光盘制成 iso 文件

```bash
dd if=/dev/cdrom of=xx.iso
```

2. 设置交换文件

## file

作用：用来查看文件的类型

## find

常用参数

-name 匹配名称
-perm 匹配权限（mode 为完全匹配，-mode 为包含即可）
-user 匹配所有者
-group 匹配所有组
-mtime -n +n 匹配修改内容的时间（-n 指 n 天以内，+n 指 n 天以前）
-atime -n +n 匹配访问文件的时间（-n 指 n 天以内，+n 指 n 天以前）
-ctime -n +n 匹配修改文件权限的时间（-n 指 n 天以内，+n 指 n 天以前）
-nouser 匹配无所有者的文件
-nogroup 匹配无所有组的文件
-newer f1 !f2 匹配比文件 f1 新但比 f2 旧的文件
--type b/d/c/p/l/f 匹配文件类型（后面的字幕参数依次表示块设备、目录、字符设备、管道、
链接文件、文本文件）
-size 
匹配文件的大小（+50KB 为查找超过 50KB 的文件，而-50KB 为查找小于
50KB 的文件）
-prune 忽略某个目录
-exec …… {}\; 后面可跟用于进一步处理搜索结果的命令（下文会有演示）

