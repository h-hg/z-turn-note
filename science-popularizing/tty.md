# 终端说明

- CLI: Command-line Interface，翻译为命令行界面。指的是图形界面还没有普及之前使用最为广泛的用户界面，它通常不支持鼠标，用户通过键盘输入指令，计算机收到指令后，给予执行
- terminal：翻译为终端。单纯的人机交互“硬件”（现在基本看不到了）或者“软件”（也就是所说的终端模拟器）
  - kconsole
  - windows terminal
- console：翻译为控制台。一个等级更高的终端，拥有特殊权限，可以显示普通终端不能显示的系统消息
- tty：它是终端的统称，因为最早的外设终端是电传打字机（teletype，简称为tty）
- shell：翻译为外壳。一个解释 kernel（内核）命令的软件程序
  - sh (Bourne shell)，最经典的 Unix shell；
  - bash (Bourne-Again shell)，目前绝大多数 Linux 发行版的默认 shell；
  - zsh (Z shell)，我个人最喜欢的 shell；
  - fish (Friendly interactive shell)，专注于易用性与友好用户体验的 shell；
  - cmd
  - powershell
- kernel：电脑系统最基础的“控制器”（软件）

简单地说，用户通过 terminal 进行输入，terminal 调用 shell，shell 将输入解释为 kernel 能够理解的语言，再传给 kernel，kernel 进行执行。

# 参考

- [命令行界面 (CLI)、终端 (Terminal)、Shell、TTY，傻傻分不清楚？](https://segmentfault.com/a/1190000016129862)
