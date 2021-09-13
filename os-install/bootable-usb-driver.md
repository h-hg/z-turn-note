# 启动U盘

启动 U 盘的制作有很多中，最简单便是直接将 iso 文件刻录到 U 盘中。但这样，一个 U 盘只能装一个 iso 文件，这里推荐 [ventory](https://www.ventoy.net/) 这个开源的 U 盘启动工具，可以将多个 iso 文件放置到 U 盘，并且支持多种系统。

Arch 下安装

```bash
sudo pacman -S ventoy-bin
```

- ventoy-bin<sup>archlinuxcn</sup>

Windows 下安装

```bash
sudo scoop install -g ventoy-bin
```
