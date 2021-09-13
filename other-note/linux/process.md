# 进程

## 进程状态

- R（运行）：进程正在运行或在运行队列中等待。
- S（中断） ：进程处于休眠中，当某个条件形成后或者接收到信号时，则脱离该状态
- D（不可中断）：进程不响应系统异步信号，即便用 kill 命令也不能将其中断。 ¾ 
- Z（僵死）：进程已经终止，但进程描述符依然存在, 直到父进程调用 wait4()系统函数 后将进程释放。
- T（停止）：进程收到停止信号后停止运行。

- D: 无法中断的休眠状态 (通常 IO 的进程)
- R: 正在执行中
- S: 静止状态
- T: 暂停执行
- Z: 不存在但暂时无法消除
- W: 没有足够的记忆体分页可分配
- <: 高优先序的行程
- N: 低优先序的行程
- L: 有记忆体分页分配并锁在记忆体内 (实时系统或捱A I/O)

## 查看

### ps

全称：process status

作用：用来查看进程的状态

常见参数

- `-a`：显示所有进程（包括其他用户的进程）
- `-u`：用户以及其他详细信息
- `-x`：显示非终端启动的进程

界面 UI 说明

- USER：user，进程的所有者
- PID：process ID，进程 ID
- %CPU：CPU 占用率
- %MEM：memory 占用率
- VSZ：虚拟内存使用量，单位 KB
- RSS：占用的固定内存量，单位 KB
- TTY：所属终端
- STAT：status，进程状态
- START：进程启动时间
- TIME：实际占用的 CPU 时间
- COMMAND：启动该进程的命令

### top

作用：用于动态监视进程活动与系统负载等信息。

界面 UI 说明

- PID：process ID，进程 ID
- USER：user，进程所属用户
- PR：优先级，数值越小优先级越高
- NI：nice值。负值表示高优先级，正值表示低优先级
- VIRT：virtual memory usage，该进程使用的虚拟内存的大小，VIRT = SWAP + RES，单位为 KB。
- RES：resident memory usage，该进程使用的物理内存的大小，单位为 KB。RES = CODE + DATA
- SHR：shared memory，共享内存大小，单位为 KB。
- S：status，进程状态
- %CPU：CPU 占用率
- %MEM：物理内存占用率
- TIME+：进程占用的 CPU 时间
- COMMAND：启动该进程的命令

### pidof

全称：process id of

```bash
pidof [args] [process name]
```

## 关闭

### kill

作用：用于终止某个指定 PID 的服务进程

```bash
kill [args] [process id]
```

### killall

作用：用于终止某个指定名称的服务所对应的全部进程

```bash
killall [args] [process name]
```

