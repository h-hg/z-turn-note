# 关于

GDB（GNU Debugger）是UNIX及UNIX-like下的强大调试工具，可以调试ada, c, c++, asm, minimal, d, fortran, objective-c, go, java,pascal等语言。本文主要介绍 gcc/g++ 在命令行下如何进行调试。

## 步骤

1. 编译程序，加入 `-g` 选项，表示保留调试信息

```bash
gcc -g hello.c -o hello
```

2. 启动程序进行调试

```bash
gdb hello
```

3. 使用调试指令进行调试

## 调试指令

### 运行

|命令|简记|备注|
|:-:|:-:|:-:|
|`run`|`r`|开始运行，到断点停下，若没有断点，一直运行|
|`continue`|`c`|继续运行，到断点停下|
|`next`|`n`|执行当前行语句，不会进入函数内部|
|`step`|`s`|执行当前行语句，会进行函数内部|
|`util`||运行程序直到退出循环体|
|`util number`||运行直到第 `number` 行|
|`finish`||运行程序直到当前函数完成返回，并打印函数返回时的堆栈地址和返回值及参数值等信息。|
|`call func(args)`||调用程序中可见的函数，并传递“参数”，如：`call f(1)`|
|`quit`|`q`|退出gdb|

如果程序需要传递运行参数，可以使用如下指令。

```gdb
run arg1 arg2
# or
set args arg1 arg2
```

### 断点

|命令|简记|备注|
|:-:|:-:|:-:|
|`break`|`b`|用来设置断点|

- 查看已设置的断点

```bash
info breakpoints
# or
info b
```

- 设置断点

```bash
# syntax 1
b [file:]line_number [condition] 
# eg
b hello.c:10 if a == 2

# syntax 2
b [file:]function_name
# eg
b hello.c:f # f is the name of function
```

注：line_number 可以使用相对定位，`+6` 表示当前行往下的第 6 行，`-2` 表示当前行往上第 2 行。

- 设置临时断点，只会触发一次：语法跟 `break` 一样，只是将 `break` 换成 `tbreak`

- 删除断点

```bash
delete number # delete number-th break point
```

- 禁用断点

```bash
disable number # disable number-th break point
disable        # disable all break points
```

- 启动断点

```bash
enable number # enable number-th break point
enable        # enable all break points
```

## 参考资料

- [GDB调试指南](https://www.yanbinghu.com/2019/04/20/41283.html)
- [C语言技术网 - gdb 调试](https://freecplus.net/b72113dda88a43b48728e0552fd8a74c.html)
