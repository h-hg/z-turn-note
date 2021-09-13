# Text Eidt

## cat

全称：concatenate

作用：cat 命令用于查看纯文本文件（内容较少的）

常用参数

- `-n`：number，显示行号

```bash
cat [options] file
```

## more

作用：more 命令用于查看纯文本文件（内容较多的）
特点：显示已经阅读的百分比

映射：

- `<Space>` / `<Enter>`：向下翻页

## head

作用：head 命令用于查看纯文本文档的前 N 行

常用参数

- `-n`：number，指定前几行

```bash
head [options] file
```

## tail

作用：命令用于查看纯文本文档的后 N 行或持续刷新内容

常用参数：

- `-n`：number，指定后几行
- `-f`：follow，用于输出文件追加的内容

tail 命令最强悍的功能是可以持续刷新一个文件的内容，当想要实时查看最新日志文件时，这特别有用，此时的命令格式为“tail -f 文件名”：

## tr

全称：text replace

书里介绍很简单

```bash
tr [origin text] [destination text]
```

```bash
tr src_text dest_text < file.txt # replace src_text in file.txt with dest_text, and print the result in the stdout
```

## wc

全称：word count

作用：wc 命令用于统计指定文本的行数、字数、字节数

常见参数

- `-l`：只显示行数
- `-w`：只显示单词数
- `-c`：只显示字节数

```bash
wc [args] /path/to/file
```

## cut

cut 命令用于按“列”提取文本字符，格式为“cut [参数] 文本”。
在 Linux 系统中，如何准确地提取出最想要的数据，这也是我们应该重点学习的内容。一般而言，按基于“行”的方式来提取数据是比较简单的，只需要设置好要搜索的关键词即可。但是如果按列搜索，不仅要使用-f 参数来设置需要看的列数，还需要使用-d 参数来设置间隔符号。
passwd 在保存用户数据信息时，用户信息的每一项值之间是采用冒号来间隔的，接下来我们使用
下述命令尝试提取出 passwd 文件中的用户名信息，即提取以冒号（：）为间隔符号的第一列内容：

```bash
cut -d: -f1 /etc/passwd
```

![Linux Cut](https://www.cnblogs.com/dong008259/archive/2011/12/09/2282679.html)

## diff

常见参数

- `--brief`：仅输出比较文件在内容上是否一样
- `-c`：输出比较文件在具体上的不同

## grep

常见参数

- `-b`：将二进制文件当作文本文件来搜索
- `-c`：仅显示找到的行数
- `-i`：忽略大小写
- `-n`：显示行号
- `-v`：反向选择，即仅列出没有“关键字”的行

```bash
grep [args] str /path/to/file
```

