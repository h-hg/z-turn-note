# 包管理

## 32位支持库

```bash
sudo vim /etc/pacman.conf
```

去掉[multilib]一节中两行的注释，来开启 32 位库支持。

```bash
sudo pacman -Sy
```

## archlinuxcn

```bash
sudo vim /etc/pacman.conf
```

```text
[archlinuxcn]
Server = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/$arch
```

```bash
sudo pacman -Sy
sudo pacman -S archlinuxcn-keyring
```

若安装 archlinuxcn-keyring 时报错，是由于密钥环的问题，可先按照[此链接](https://www.archlinuxcn.org/gnupg-2-1-and-the-pacman-keyring/)执行其中的命令，再安装 archlinuxcn-keyring

## Aur

```bash
sudo pacman -S base-devel yay
yay --aururl "https://aur.tuna.tsinghua.edu.cn" --save
```

- yay<sup>archlinuxcn</sup>
