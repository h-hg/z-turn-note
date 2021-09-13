# 安装

## Archlinux

```bash
sudo pacman -S texlive-most
sudo pacman -S texlive-lang
```

[archlinux wiki/TexLive](https://wiki.archlinux.org/index.php/TeX_Live)

- texlive-most：包含大多数 TexLive 的包
- texlive-lang：提供非拉丁字符的字符集

## TexLive

虽然 Archlinux 官方包有 TexLive 的包，但是 `tlmgr` 有问题，所以还是老老实实下载 iso 进行安装。

```bash
sudo mount -o loop xxx.iso /mnt
cd /mnt
sudo ./install-tl
# input I and wait
sudo umount /mnt
sudo vim /etc/environment
```

加入如下内容，路径在安装后有相关提示。

```bash
# texlive-2021
export PATH=/usr/local/texlive/2021/bin/x86_64-linux:$PATH
export INFOPATH=$INFOPATH:/usr/local/texlive/2021/texmf-dist/doc/info
export MANPATH=$MANPATH:/usr/local/texlive/2021/texmf-dist/doc/man
```

## 镜像源

[清华镜像 - CTAN 镜像使用帮助](https://mirrors.tuna.tsinghua.edu.cn/help/CTAN/)

## vscode 配置

- [TexLive 2021 安装指南](https://www.bilibili.com/read/cv10635025)

## TexStudio

```bash
sudo pacman -S texstudio
```

如果启动 TexStudio 检测不到 TexLive 的话，在 TexStudio 配置相关路径。

1. `which latex`：例如 `/usr/local/texlive/2021/bin/x86_64-linux/latex`
2. 在 TexStudio 中开启先进选项：`Options > Configure TexStudio > Show Advanced Options``
3. 输入路径：`Options -> Configure -> Build > Commands ($PATH)`，输入 `/usr/local/texlive/2021/bin/x86_64-linux`
