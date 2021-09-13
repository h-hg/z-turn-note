# 字体

参考

- [Fonts - en](https://wiki.archlinux.org/index.php/Fonts)
- [字体 - 简体中文](https://https://wiki.archlinux.org/index.php/Fonts_(简体中文))

## 基本字体

Noto 是 Google 所开发的开源字体家族，以 OFL 许可证授权，旨在涵盖所有 Unicode 区块。

```bash
sudo pacman -S noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra
```

- noto-fonts：
- noto-fonts-cjk：中日韩字体
- noto-fonts-emoji：emoji 表情
- noto-fonts-extra：

## 中文字体

参考自

- [Chinese Fonts](https://wiki.archlinux.org/index.php/Localization/Chinese#Fonts)
- [中文字体](https://wiki.archlinux.org/index.php/Localization_(简体中文)/Simplified_Chinese_(简体中文)#修正简体中文显示为异体（日文）字形)

主要有如下：

- 思源字体：Adobe与Google合资开发的，囊括简体中文、繁体中文、日文、韩文字形和来自 Source Sans 字体家族的拉丁文、希腊文和西里尔文字形的 OpenType 字体。
  - [adobe-source-han-sans-otc-fonts](https://archlinux.org/packages/?name=adobe-source-han-sans-otc-fonts) - 思源黑体，无衬线字体。
  - [adobe-source-han-serif-otc-fonts](https://archlinux.org/packages/?name=adobe-source-han-serif-otc-fonts) - 思源宋体，衬线字体。
- 文泉驿字体：常用于解决 Wine 中文字体问题
  - [wqy-zenhei](https://archlinux.org/packages/?name=wqy-zenhei) - 文泉驿正黑体，黑体 (无衬线) 的中文轮廓字体，附带文泉驿点阵宋体 (也支持部分日韩字符)。
  - [wqy-bitmapfont](https://archlinux.org/packages/?name=wqy-bitmapfont) - 文泉驿点阵宋体 (衬线) 中文字体。
  - [wqy-microhei](https://archlinux.org/packages/?name=wqy-microhei) - 文泉驿微米黑，无衬线形式字体。
  - [wqy-microhei-lite](https://archlinux.org/packages/?name=wqy-microhei-lite) - 文泉驿微米黑light版（笔画更细）。

## 编程字体

```bash
sudo pacman -S \
nerd-fonts-jetbrains-mono \
nerd-fonts-cascadia-code \
nerd-fonts-fira-code \
```

说明：

- nerd-fonts-jetbrains-mono<sup>archlinuxcn</sup>
- nerd-fonts-cascadia-code<sup>archlinuxcn</sup>
- nerd-fonts-fira-code<sup>archlinuxcn</sup>
