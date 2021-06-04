# 准备 

说明：由于当前 UEFI 已普及十余年，安装将全部以 UEFI+GPT 的形式进行，传统 BIOS 方式不再赘述。

## 网络环境

1. 有线：如果你可以使用路由器分接出来的网线，以 dhcp 的方式直接上网，那么不用准备什么。
2. 无线：先把自己所用的 wifi 名称改成自己能记住的英文名称。因为**安装时无法显示和输入中文名的 wifi**。

其次，有些笔记本电脑上存在无线网卡的硬件开关或者键盘控制，开机后安装前需要**确保你的无线网卡硬件开关处于打开状态**。

## 刻录启动优盘

软件推荐：

- [ventoy](https://www.ventoy.net/cn/doc_start.html)：Linux、Windows
- [Rufus](https://rufus.ie/)：Windows
- [Power ISO](https://www.poweriso.com/)：Windows

上述软件的用法，请自行查看相关的文档

Linux 下可以直接用 dd 命令进行刻录。注意 of 的参数为 sdx,不是 sdx1 sdx2 等。

```bash
sudo dd bs=4M if=/path/to/archlinux.iso of=/dev/sdx status=progress oflag=sync
```

> bs=4M 指定一个较为合理的文件输入输出块大小。  
> status=progress 用来输出刻录过程总的信息。  
> oflag=sync 用来控制写入数据时的行为特征。确保命令结束时数据及元数据真正写入磁盘，而不是刚写入缓存就返回。

## BIOS 进行设置

1. 进入 BIOS：插入优盘并开机。在开机的时候，按下 `F2/F8/F10/DEL` 等(取决与你的主板型号，具体请查阅你主板的相关信息)按键，进入主板的 BIOS 设置界面。
2. 关闭 Secure Boot：在类似名为 `security` 的选项卡中，找到一项名为 Secure Boot(名称可能略有差异)的选项，选择 Disable 将其禁用。
3. 调整启动方式为 UEFI： 在某些旧的主板里，需要调整启动模式为 UEFI,而非传统的 BIOS/CSM。在类似名为 `boot` 的选项卡中，找到类似名为 Boot Mode 的选项，确保将其调整为 UEFI only，而非 legacy/CSM。
4. 调整硬盘启动顺序：在类似名为 `boot` 的选项卡中，找到类似名为 Boot Options(名称可能略有差异)的设置选项，将 USB 优盘的启动顺序调至首位。
5. 保存退出：最后保存 BIOS 设置并退出，一般的按键是 F10。此时系统重启，不出意外你应该已经进入 archlinux 的安装界面。
