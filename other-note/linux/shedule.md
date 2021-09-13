# 计划任务服务程序

## at

作用：未来的某个时间点执行一次某任务

安装：

```bash
sudo pacman -S at
```

执行 `at time`，其中 `time` 为某个时间点，即可进入交互式的计划任务编辑界面，按下 `<Ctrl>d` 即可结束（完成）计划任务的编写。或者可以结合管道来完成计划人物的编写，如下。

```bash
echo hello | at 22:00
```

例子：

```bash
at -l                       # list all the tasks
at hh:mm -f /path/to/script # run specific script
atrm number                 # delete the task of id number
````

**疑问**：这个 at 的未来任务是否有脱离 shell，没有的话，把 shell 断开不就没了

## crontab

作用：用于周期性运行某任务

由于 cron 有多个[实现](https://wiki.archlinux.org/title/cron)，这里选择的是 cronie

```bash
sudo pacman -S cronie
```

```bash
crontab -e  # edit the task
crontab -l  # list
crontab -r  # remove

```

**注意**：感觉书这部分说得很少，需要自己查看资料

