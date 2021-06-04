# tmux

前缀键：`Ctrl + b`，使用其他快捷键之前，必须按下这个前缀键。

查看所有快捷键的快捷键：`?`

## Server

## Session

命令行

|按键|功能|
|:-:|:-:|
|`tmux new -s name`|新建一个会话|
|`tmux detach`|当前会话与 ssh 会话分离|
|`tmux ls`|列出所有会话|
|`tmux attach -t [number or name]`|重新接入某个会话|
|`tmux kill-session -t [number or name]`|关闭某个会话|
|`tmux rename-session -t [number or name] [new_name]`|重命名某个会话|
|`tmux switch -t [number or name]`|切换会话|

快捷键

|按键|功能|
|:-:|:-:|
|`d`|当前会话与 ssh 会话分离|
|`s`|列出所有会话|
|`$`|重命名当前会话|

## Window

**命令行**

|命令|功能|
|:-:|:-:|
|`tmux new-windows [-n name]`|新建一个窗口|
|`tmux select-window -t [number or name]`|切换窗口|
|`tmux rename-window [new_name]`|重命名当前窗口|


快捷键

|按键|功能|
|:-:|:-:|
|`c`|创建新的窗口|
|`&`|关闭当前窗口|
|`w`|列出所有的窗口|
|`n`|下一个窗口|
|`p`|上一个窗口|
|`f`|查找窗口|
|`,`|重命名当前窗口|
|`number`|切换到指定编号的窗口|

## Pane

**命令行**

|命令|功能|
|:-:|:-:|
|`tmux split-window`|划分为上下两个窗格|
|`tmux split-window -h`|划分为左右两个窗格|
|`tmux select-pane -U`|切换到上方的窗格|
|`tmux select-pane -D`|切换到下方的窗格|
|`tmux select-pane -L`|切换到左方的窗格|
|`tmux select-pane -R`|切换到右方的窗格|
|`tmux swap-pane -U`|与上方的窗格交换位置|
|`tmux swap-pane -D`|与下方的窗格交换位置|

**快捷键**

|按键|功能|
|:-:|:-:|
|`%`|水平窗格|
|`"`|垂直窗格|
|`x`|关闭窗格|
|`!`|强制将当窗格从窗口中移出，称为一个新的窗口|
|`;`|回到上个窗格|
|`o`|顺时针切换窗格|
|`Ctrl + o`|逆时针转换窗格|
|`M-o`|顺时针转换窗格|
|||

Ctrl+b {：当前窗格与上一个窗格交换位置。
Ctrl+b }：当前窗格与下一个窗格交换位置。
Ctrl+b Ctrl+o：所有窗格向前移动一个位置，第一个窗格变成最后一个窗格。
Ctrl+b Alt+o：所有窗格向后移动一个位置，最后一个窗格变成第一个窗格。

Ctrl+b z：当前窗格全屏显示，再使用一次会变回原来大小。
Ctrl+b Ctrl+<arrow key>：按箭头方向调整窗格大小。
Ctrl+b q：显示窗格编号。

## 其他命令

**命令行**


|命令|功能|
|:-:|:-:|
|`tmux list-keys`|列出所有快捷键|
|`tmux list-commands`|列出所有命令及其参数|
|`tmux info`|列出当前所有 Tmux 会话信息|
|`tmux source-file ~/.tmux-conf`|重新加载 tmux 的配置|

## 其他

vim 主题失效的问题：[lose vim colorscheme in tmux mode](https://stackoverflow.com/questions/10158508/lose-vim-colorscheme-in-tmux-mode)

## 参考资料

[阮一峰 Tmux 使用教程](http://www.ruanyifeng.com/blog/2019/10/tmux.html)
