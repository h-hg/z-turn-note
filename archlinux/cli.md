# Arch Linux 基础安装

本节从安装最基础的无图形化 ArchLinux 系统开始。

参考资料：

- [archlinux installation guide - en](https://wiki.archlinux.org/index.php/Installation_guide)  
- [arhclinux installation guide -简体中文](https://wiki.archlinux.org/index.php/Installation_guide_(简体中文))

## 确认是否为 UEFI 模式

```bash
ls /sys/firmware/efi/efivars
```

若输出了一堆东西，说明已在 UEFI 模式。否则请确认你的启动方式是否为 UEFI。

## 连接网络

### 连接

1. 无线连接:

```bash
iwctl                           # 进入交互式命令行
device list                     # 列出设备名，比如无线网卡看到叫 wlan0
station wlan0 scan              # 扫描网络
station wlan0 get-networks      # 列出网络 比如想连接 CMCC-5AQ7 这个无线
station wlan0 connect CMCC-5AQ7 # 进行连接 输入密码即可
exit                            # 成功后退出
```

2. 有线连接：

正常来说，只要插上一个已经联网的路由器分出的网线(DHCP)，直接就能联网。

### 测试

```bash
ping www.baidu.com
```

若能看到数据返回，即说明已经联网，`ctrl+c` 终止退出当前命令。

如果还是无法连接，使用 `ip link set xxx up` 命令确认你已经激活了对应的网卡，再重新继续网络链接与测试。若看到类似`Operation not possible due to RF-kill`的报错，继续尝试`rfkill unblock wifi`来解锁无线网卡。

## 更新系统时钟

```bash
timedatectl set-ntp true    # 将系统时间与网络时间进行同步
timedatectl status          # 检查服务状态
```

系统时间不对可能造成ssl连接失败导致安装出错

## 更换国内镜像源

```bash
vim /etc/pacman.d/mirrorlist    
```

```bash
/China # 回车，定位到中国的镜像源
```

将清华的镜像源（`Server = http://mirrors.tuna.tsinghua.edu.cn/archlinux/$repo/os/$arch` 和 `Server = https://mirrors.tuna.tsinghua.edu.cn/archlinux/$repo/os/$arch`）剪贴到最前面

更新源

```bash
pacman -Syy
```

## 划分磁盘

### 分区

这里总共设置四个分区，可以满足绝大多数人的需求。

- 根目录： `/` 100G
- EFI： `/efi` 800M
- 交换分区: `swap` 4G（一般和内存一样大)，交换分区是可选项，可以在安装后使用交换文件而不是交换分区
- 用户主目录： `/home` 剩余全部 越大越好

查看磁盘情况

```bash
lsblk                       # 查看磁盘情况
```

创建磁盘分区表，如果前面已经装了别的系统，目标磁盘已有分区表，可跳过。

```bash
parted /dev/sda             # 执行parted，进行磁盘类型变更，sda 是你选择的磁盘
(parted)mktable             # 创建磁盘的分区表
New disk label type? gpt    # 输入 gpt 将磁盘类型转换为 gpt 如磁盘有数据会警告，输入yes即可
quit                        # 退出parted命令行交互
```

查看上述分区

```bash
cfdisk  /dev/sda            #来执行分区操作,分配各个分区大小，类型
```

||Size|Type||
|:-:|:-:|:-:|:-:|
|`/efi`|>= 512M|EFI system|
|swap|||Linux swap|
|`/`|||Linux filesystem|
|`/home`|||Linux filesystem|

- `↑↓`：切换分区
- `←→`：切换功能
  
最后选择 write 并 quit

### 格式化

使用 `fdisk -l` 来查看刚才的分区情况

这里的 sdax 只是例子（sda 是磁盘，x 是磁盘分区号，有些是 nvme0n1p1: p1 是分区号），具体根据你的实际情况来

```bash
mkfs.ext4  /dev/sdax            # 将 `/` 和 `/home` 格式化为 ext4
mkfs.vfat  /dev/sdax            # 将 efi 格式化为 vfat
mkswap -f /dev/sdax             # 格式化 swap
swapon /dev/sdax                # 打开 swap 分区
```

### 挂载

在挂载时，挂载是有顺序的，需要从根目录开始挂载

这里的 sdax 只是例子（sda 是磁盘，x 是磁盘分区号），具体根据你的实际情况来

```bash
mount /dev/sdax  /mnt
mkdir /mnt/home
mount /dev/sdax /mnt/home
mkdir /mnt/efi
mount /dev/sdax /mnt/efi # 或者/mnt/boot`
```

## 安装系统

基础包

```bash
pacstrap /mnt base linux linux-firmware
```

功能性软件

```bash
pacstrap /mnt dhcpcd iwd vim sudo
```

- `dhcpcd`：DHCP 工具，有线公网工具
- `iwd`：无线上网工具，依赖 `dhcpcd`
- `vim`：编辑器
- `sudo`：提权工具

## 配置系统

### fstab

fstab 用来定义磁盘分区

```bash
genfstab -U /mnt >> /mnt/etc/fstab
```

复查一下 /mnt/etc/fstab 确保没有错误：会显示我们刚才的挂载点

```bash
cat /mnt/etc/fstab
```

### chroot

change root，即进入刚才安装的系统

```bash
arch-chroot /mnt
```

### 时区

使用亚洲上海时间

```bash
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
```

将系统时间同步到硬件时间

```bash
hwclock --systohc
```

### 本地化

Locale 决定了软件使用的语言、书写习惯和字符集。

编辑 `/etc/locale.gen`，去掉 `en_US.UTF-8` 行以及 `zh_CN.UTF-8` 的注释符号（#）。

```bash
vim /etc/locale.gen
```

生成 locale。

```bash
locale-gen
```

编辑 `/etc/locale.conf`

```text
LANG=en_US.UTF-8
```

### 网络配置

首先在 `/etc/hostname` 中输入你的主机名，如 `arch`

```bash
vim /etc/hostname
```

编辑 `hosts`

```vim
vim /etc/hosts
```

加入如下内容

```bash
127.0.0.1   localhost
::1    localhost
127.0.1.1    arch.localdomain    arch
```

### root 密码

```bash
passwd root
```

## 启动系统

### 安装微码

根据自己 CPU 型号选择安装

```bash
pacman -S intel-ucode   # Intel
pacman -S amd-ucode     # AMD
```

### 安装引导程序

这里选择常用的 `grub`

```bash
pacman -S grub efibootmgr
```

- grub：启动引导器
- efibootmgr：efibootmgr 被 grub 脚本用来将启动项写入 NVRAM

```bash
grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=GRUB #取名为GRUB 并将grubx64.efi安装到之前的指定位置
```

os-prober

最后生成 GRUB 所需的配置文件

```bash
grub-mkconfig -o /boot/grub/grub.cfg
```

### 完成安装

```bash
exit                # 退回安装环境#
reboot              # 重启
```

注意，重启前要先拔掉优盘，否则你重启后还是进安装程序而不是安装好的系统。