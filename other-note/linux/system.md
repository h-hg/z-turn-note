# 系统

## 查看

### uname

作用：用于查看系统内核与系统版本等信息

```bash
uname -a
```

### uptime

作用：当前系统时间、系统已运行时间、启用终端数量以及平均负载值等信息。平均负载值指的是系统在最近 1 分钟、5 分钟、15 分钟内的压力情况（下面加粗的信息部分）；负载值越低越好，尽量不要长期超过 1，在生产环境中不要超过 5。

```text
$ uptime
 15:27:29 up  1:06,  3 users,  load average: 0.93, 1.95, 2.03
```

### free

作用：于显示当前系统中内存的使用量信息

```bash
$ free -h
               total        used        free      shared  buff/cache   available
Mem:            23Gi       2.6Gi        17Gi       729Mi       3.2Gi        19Gi
Swap:           23Gi          0B        23Gi
```

- total：总量
- used：已使用的
- free：空闲的
- shared：进程共享的内存量
- buff/cache：磁盘缓冲的
- available:

available 跟 free 有什么区别
