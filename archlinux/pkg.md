# 包管理

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

## Aur

```bash
sudo pacman -S base-devel yay
yay --aururl "https://aur.tuna.tsinghua.edu.cn" --save
```

- yay<sup>archlinuxcn</sup>