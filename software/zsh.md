# zsh

主要是基于 oh-my-zsh 来进行配置 zsh

## 安装

```bash
sudo pacman -S zsh
sudo vim /etc/shells # 添加 /usr/bin/zsh
sudo chsh -s /usr/bin/zsh h-hg
```

## zsh 常见配置

关闭提示音

```text
unsetopt beep
```

## 安装 oh-my-zsh

```bash
sudo pacman -S oh-my-zsh-git
# 复制默认配置文件
cp /usr/share/oh-my-zsh/zshrc ~/.zshrc
```

- oh-my-zsh-git<sup>Archlinuxcn</sup>

## 插件

### sudo

按两下 `Esc` 补全 `sudo`

内置的插件 plugins 中添加 `sudo`

### vi-mode

zsh 中使用 vi 模式

具体见 [oh-my-zsh/plugins/vi-mode](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/vi-mode)

### zsh-syntax-highlighting

```bash
sudo pacman -S zsh-syntax-highlighting
sudo ln -s /usr/share/zsh/plugins/zsh-syntax-highlighting /usr/share/oh-my-zsh/custom/plugins/
```

添加 zsh-syntax-highlighting

## zsh-autosuggestions

```bash
sudo pacman -S zsh-autosuggestions
sudo ln -s /usr/share/zsh/plugins/zsh-autosuggestions /usr/share/oh-my-zsh/custom/plugins/
```

添加 zsh-autosuggestions
