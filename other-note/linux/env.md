# 环境变量

HOME 用户的主目录（即家目录）
SHELL 用户在使用的 Shell 解释器名称
HISTSIZE 输出的历史命令记录条数
HISTFILESIZE 保存的历史命令记录条数
MAIL 邮件保存路径
LANG 系统语言、语系名称
RANDOM 生成一个随机数字
PS1 Bash 解释器的提示符
PATH 定义解释器搜索用户执行命令的路径
EDITOR 用户默认的文本编辑器

```bash
VAR=cmd # local variable
export VAR=cmd # global variable
```

全局变量才能被其他用户访问
