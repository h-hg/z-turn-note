# 安装 ArchLinux

由于个人比较喜欢 ArchLinux，所以 WSL 都是用 ArchLinux 来进行配置的。

目前 WSL ArchLinux 没有官方版本，所以有着不小 bug。

好像也可以通过下载 Archlinux-bootstrap.tar.gz 再通过 LxRunoffline 进行安装。

## 安装并进入

```bash
scoop install archwsl
```

直接在开始菜单搜索 Arch，然后管理员模式运行（好像不这样的话，后面 `pacman -Syu` 失败）

## 用户设置

修改 root 密码

```bash
passwd
```

添加用户并添加密码

```bash
useradd -m -G wheel -s /usr/bin/bash h-hg
passwd h-hg
```

`h-hg` 是我设置的用户名

修改 `h-hg` 的权限

```bash
chmod +w /etc/sudoers
sudo vim /etc/sudoers
```

直接删除 `%wheel ALL=(ALL) ALL` 前面的注释

退出 WSL

找到 `Arch.exe` 所在的目录，在该目录下执行

```bash
.\Arch.exe config --default-user h-hg
```

## 软件源

重新进入 Arch

### 修改镜像

```bash
sudo vim /etc/pacman.d/mirrorlist
```

直接删除你想要的源前面的注释即可

```bash
sudo pacman -Syy
```

初始化 keyring

```bash
sudo pacman-key --init
sudo pacman-key --populate
```

更新系统

```bash
sudo pacman -Syu
```

### Archlinuxcn

```bash
sudo vim /etc/pacman.conf
```

加入如下内容

```text
[archlinuxcn]
Server = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/$arch
```

安装 GPG key

```bash
sudo pacman -Syy && sudo pacman -S archlinuxcn-keyring
```

### Aur

安装 yay 并设置镜像

```bash
sudo pacman -S yay
yay --aururl "https://aur.tuna.tsinghua.edu.cn" --save
````

安装 `base-devel`

修改 fakeroot

```bash
sudo vim /etc/pacman.conf
```

注释掉 fakeroot 的 ignore

安装

```bash
sudo pacman -S base-devel
```

若有 fakeroot 的相关提示，使用 fakeroot 代替 fakeroot-tcp
