# 本地化

参考：[本地化/简体中文](https://wiki.archlinux.org/title/Localization_(简体中文)/Simplified_Chinese_(简体中文))

## 字体

英文系统下，某些中文字会默认优先日文字体，而非中文字体，例如复制的“复”。

解决方法

```bash
vim ~/.config/fontconfig/conf.d/64-language-selector-prefer.conf
```

```xml
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
  <alias>
    <family>sans-serif</family>
    <prefer>
      <family>Noto Sans CJK SC</family>
      <family>Noto Sans CJK TC</family>
      <family>Noto Sans CJK JP</family>
    </prefer>
  </alias>
  <alias>
    <family>monospace</family>
    <prefer>
      <family>Noto Sans Mono CJK SC</family>
      <family>Noto Sans Mono CJK TC</family>
      <family>Noto Sans Mono CJK JP</family>
    </prefer>
  </alias>
</fontconfig>
```

