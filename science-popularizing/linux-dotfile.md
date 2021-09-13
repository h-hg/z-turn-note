# 配置文件管理

Linux 在配置文件上，可以分为用户级别配置（一般存在于 `~/.config`）和系统级别配置（一般存在于 `/etc/`）

## Git

### 初始化

1. 创建一个裸仓库

```bash
git init --bare ~/dofiles
```

`--bare` 表示建议一个裸仓库，裸仓库库表示，在工作目录下，只有一个.git目录，而没有类似于本地库那样的文件结构可供你直接进行浏览和修改。

在这个选择 `~/dotfiles` 来存储配置文件

2. 配置别名

```bash
alias gitcfg='git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
```

这条命令新建了一个 `gitcfg` 的别名（一个 git 的别名），`--git-dir` 表明 git 版本库的位置，`--work-tree=$HOME` 使得 `gitcfg` 只监控当前用户下的文件。

如果想让这条别名长久能使用的话，应该将其加入你的 shell 配置中。

3. 配置仓库

```bash
gitcfg config --local status.showUntrackedFiles no
```

HOME 目录大多文件都不是配置文件，如果没有这条命令的话，执行 `gitcfg` 会出现一大堆 untracked 文件，配置该选项后，则不会提醒 untracked 文件。

### 管理配置文件

进行上述配置后，则可在任意目录下对 HOME 目录下的配置文件进行添加到版本库等操作。例如

```bash
gitcfg add ~/.bashrc
gitcfg commit -m"add bash config"
```

### 新机子配置

如何将配置文件移植到新的电脑上

1. 配置别名

```bash
alias gitcfg='git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
```

2. 配置 git

```bash
git clone --bare <git-repo-url> ~/dotfiles
gitcfg config --local status.showUntrackedFiles no
```

3. 强制恢复文件

```bash
git reset --hard HEAD
```

这里可以根据需要，选用适当的命令恢复指定的文件。

### 系统配置管理

很简单，只需要让 git 监控的目录从 `$HOME` 改成 `/` 即可。

```bash
sudo git init --bare /etc/dofiles
alias gitscfg='sudo git --git-dir=/etc/dotfiles/ --work-tree=/'
gitscfg config --local status.showUntrackedFiles no
```

这里将版本库放在了 `/etc/dotfiles`，监控的目录为 `/`。

## stow

stow 是一个 GNU 工具，用符号链接的方式来管理文件。

例如家目录的部分文件列表如下，其中 `~/dotfiles` 是用来存储配置文件的。

```
~/
  dotfiles/
    bash/
      .bashrc
    nvim/
      .config/
        nvim/
          init.lua
  .config/
```

例如，`~/dotfiles/bash/.bashrc` 存放的是 bash 的配置文件，实际上的 bash 配置应该存放于 `~/.bashrc`，通过软链接应该这样子创建，`ln -s ~/dotfiles/bash/.bashrc ~/.bashrc`。

如果是通过 stow 则需要如下两个命令

```bash
cd ~/dotfiles
stow bash
```

执行完 `stow` 后，`stow` 会自动将 `~/dotfiles/bash` 目录所有文件，以软链接数量最小的算法，链接到 `~` 目录下。在例子中，只有一个 `~/dotfiles/bash/.bashrc` 被链接到 `~/.bashrc`。


若是执行 `cd ~/dotfiles && stow nvim`，则会将 `~/dotfiles/nvim/.config/nvim` 链接到 `~/.config/nvim`，这是由于 `~/.config` 已经存在，所以不会将 `~/dotfiles/nvim/.config` 链接到 `~/.config`，这也是软链接数量最小的体现。

如果想取消 neovim 的配置的话，只需要删除相应的软链接，或者执行 `cd ~/dotfiles && stow -D nvim`。

如果 `dotfiles` 文件不是存在于 `~` 目录下，例如 `~/.config/dotfiles`，那么需要指定 `target` 的目录，将上述命令改成 `cd ~/.config/dotfiles && stow -t ~ nvim`，如果你不想 `cd` 切换工作目录的话，需要指定 stow 的工作目录，即 `stow -d ~/.config/dotfiles -t ~ nvim`，该命令可在任意目录下执行了。

## Chezmoi

[chezmoi](https://www.chezmoi.io/) 是一款基于模板的dot配置管理器，使用go语言编写，并使用[https://pkg.go.dev/text/template](https://pkg.go.dev/text/template)来对配置进行模板化以适应不同平台差异。

具体使用，参考[官方文档](https://www.chezmoi.io/)

### 基本使用

执行 `chezmoi init` 会在 `~/.local/share/chezmoi` 创建一个 git 仓库。为了方便描述，将此目录，称呼为配置目录。默认情况下，chezmoi 只监控 `~` 下的文件。

用 `chezmoi add <FILE>` 来添加一个配置文件。这个时候这个文件会拷贝到配置对应的位置。例如 `chezmoi add ~/.pip/pip.conf` 会拷贝到 `~/.local/share/chezmoi/dot_pip/pip.conf`，但并不被 Git 跟踪。

执行 `chezmoi edit ~/.pip/pip.conf` 将调用默认编辑器，编辑配置目录的 `dot_pip/pip.conf`。编辑完成后，执行 `chezmoi apply ~/.pip/pip.conf` 则会将配置目录下的 `dot_pip/pip.conf` 同步到 `~/.pip/pip.conf`。

执行 `chezmoi cd` 将会打开一个新的 shell，其当前目录为配置目录，在这里可以使用在 git 管理拷贝过来的配置文件。基本上是暂存、提交，推送到某个远端版本库。然后 `exit` 此 shell。

当修改了某个家目录里的配置文件，用 `chezmoi diff` 或者 `chezmoi diff <FILE>` 来查看配置目录和当前家目录中配置文件的区别。

### 新机子配置

下载 git 仓库

```bash
chezmoi init url-to-git-repo
```

导出全部配置

```bash
chezmoi apply
```

### 系统配置

```bash
alias chezmois='sudo chezmoi -D / -S /etc/dotfiles -c /etc/chezmoi/chezmoi.toml'
```

## 参考资料

- [The best way to store your dotfiles: A bare Git repository](https://www.atlassian.com/git/tutorials/dotfiles)
- [【译】使用 GNU stow 管理你的点文件 ](https://farseerfc.me/zhs/using-gnu-stow-to-manage-your-dotfiles.html)
- [GNU Stow - 一个软链接管理器 - 用来管理配置文件(dotfiles)是再好不过啦](https://www.bilibili.com/video/BV1yy4y1x7ie)
