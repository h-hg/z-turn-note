# 输入法

这里使用 Fcitx5 这个框架，参考如下文档

- [English](https://wiki.archlinux.org/index.php/Fcitx5)
- [中文](https://wiki.archlinux.org/index.php/Fcitx5_(简体中文))

## Fcitx5

```bash
sudo pacman -S fcitx5-im
vim /etc/environment
```

```text
GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx
XMODIFIERS=@im=fcitx
SDL_IM_MODULE=fcitx
```

KDE GUI 设置开机启动：

```text
settings -> Workspace -> Startup and Shutdown -> Autostart -> Add -> Utilities -> Fcitx5
```

## Fcitx5-chinese-addons

```bash
sudo pacman -S fcitx5-chinese-addons #官方中文输入引擎
```

ctrl + space：切换输入法

## Rime

```bash
sudo pacman -S fcitx5-rime
```

添加 Rime

```text
Fcitx 5 Configuration -> Add Input Method -> Only Show Current Language(false) -> Rime -> OK
```

重启

选择拼音方案，在可以输入的编辑框，按下 ``ctrl + ` ``，选择“朙月拼音 简化字”

词库

```bash
sudo pacman -S fcitx5-pinyin-{zhwiki,moegirl}
```

rime 配置

```bash
vim ~/.local/share/fcitx5/rime/default.custom.yaml
```

设置候选字数

```text
patch:
  "menu/page_size": 9
```

下面是设置简体字

```bash
vim ~/.local/share/fcitx5/rime/build/luna_pinyin.custom.yaml
```

```text
# encoding: utf-8
patch:
  switches:
    - name: ascii_mode
      reset: 0
      states: ["中文", "西文"]
    - name: full_shape
      states: ["半角", "全角"]
    - name: simplification
      reset: 1
      states: ["漢字", "汉字"]
    - name: ascii_punct
      states: ["。，", "．，"]
```

更改重启 fcitx5
