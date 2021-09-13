# IO

## 简介

- 标准输入重定向（STDIN，文件描述符为 0）：默认从键盘输入，也可从其他文件或命
令中输入。
- 标准输出重定向（STDOUT，文件描述符为 1）：默认输出到屏幕。
- 错误输出重定向（STDERR，文件描述符为 2）：默认输出到屏幕。

## 重定向

```bash
cmd < file # redirect stdin
cmd << char # redict stdin, eof is char
cmd > file # redirect stdout
cmd >> file # redirect stdout and don't clear the file
cmd 2> file # redirect stderr
cmd 2>> file # redict stderr and don't clear the file
cmd > file1 < file2 # redirect stdin and stderr
```

## pipe

管道可以简单理解为“将上一条命令的输出当作下一条命令的标准输入”

## 字符

通配符

- `*`：匹配零个或者多个字符
- `?`：匹配单个字符

转移字符：

- 反斜杠（`\`）：使反斜杠后面的一个变量变为单纯的字符串。
- 单引号（`''`）：转义其中所有的变量为单纯的字符串。
- 双引号（`""`）：保留其中的变量属性，不进行转义处理。
- 反引号（``）：把其中的命令执行后返回结果。

```bash
Price = 5
echo "Price is $Price"   # Price is 5
echo 'Price is $Price'   # Price is Price
echo "Price is \$$Price" # Price is $5
echo `echo a`            # a
```

注：在 shell 里面，`$$` 表示当前程序的进程 ID 号，上面例子中如果没有使用 `\$`，则输出的是 `Price is xxxPrice`，其中 `xxx` 是进程 ID。
