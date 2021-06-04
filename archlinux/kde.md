# Archlinux KDE

本文介绍如何在 Archlinux 下安装 KDE

## 准备

### 联网

1. 有线网络

```bash
systemctl start dhcpcd  # 开启服务
```

2. 无线网络

开启服务

```bash
systemctl start dhcpcd iwd # 开启服务
```

### 更新

确保系统处于最新状态

```bash
sudo -Syu
```

## 添加非 root 用户

因为 KDE 不允许使用 root 用户登录，所以创建一个非 root 用户

```bash
useradd -m -G wheel -s /bin/bash h_hg
```

- `-G`：指定分组，即上面的 `wheel` 分组
- `-s`：使用 `/bin/bash` 进行登录
- `h_hg`：自定义的用户名

修改密码

```bash
passwd h-hg
```

编辑 sudo，去掉 `# %wheel ALL=(ALL) ALL` 的注释符号 `#`

```bash
EDITOR=vim visudo
```

## 安装

安装基础软件

```bash
pacman -S plasma
```

一些必备的 KDE 应用以及其他应用

```bash
pacman -S konsole dolplin ntfs-3g
```

- konsole：KDE 终端模拟器
- dolplin：KDE 文件管理器
- ntfs-3g：NTFS 文件管理系统的支持

## 配置

```bash
systemctl enable ssdm NetworkManager
```

- ssdm：KDE 默认的“启动界面”
- NetworkManager：KDE 默认网络管理器

## 额外 KDE 应用

- ark：KDE 压缩管理器
- gwenview：KDE 图片浏览器
