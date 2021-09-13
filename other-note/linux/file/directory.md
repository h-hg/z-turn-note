# 文件

在 Linux 中，一切皆为文件。目录（文件夹）也是文件。

## pwd

全称：print working directory

作用：打印当前目录的路径

## cd

全称：change directory

- `.`：当前目录
- `..`：父目录
- `~`：HOME 目录
- `-`：上一次所在的目录

例子：

```bash
cd /path/to/directory
cd ~username # change to home of username
cd -
```

## ls

常用常数

- `-a`：all，所有文件，包含隐藏文件
- `-l`：list，参数可以查看文件的属性、大小等详细信息
- `-h`：human readable，让文件的大小容易看

如果想要查看目录属性信息，则需要额外添加一个`-d` 参数。例如，可使用如下命令查看 `/etc` 目录的权限与属性信息：

```bash
ls -ld /etc
```

如果 `/etc` 被省略的话，默认查看当前目录的信息。


## mkdir

全称：make directory

常见选项

- `-p`：`--parents`，递归创建出具有嵌套叠层关系的文件目录

```bash
mkdir dir
mkdir -p dir/subdir
```


