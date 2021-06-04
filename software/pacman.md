# Pacman

## `S`(`--sync`)

1. 更新软件源：`sudo pacman -Sy`
2. 强制更新软件源：`sudo pacman -Syy`
3. 查询可以更新的软件：`sudo pacman -Su`
4. 更新系统：`sudo pacman -Syu`
5. 搜索软件：`pacman -Ss [name]`
6. 清除缓冲区老的包：`sudo pacman -Sc`
7. 安装或者更新软件：`sudo pacman -S [name]`

`y`: `--refresh`

`u`: `--sysupgrade`

`c`: `--clean`

`s`: `--search`

## `R`（`--remove`）

1. 删除某软件：`sudo pacman -R [name]`
2. 删除某软件及其依赖：`sudo pacman -Rs [name]`
3. 删除某软件及其依赖和全局配置文件：`sudo pacman -Rns [name]`

`s`: `--recursive`

`n`: `--nosave`

## `Q`(`--query`)

1. 列举本地安装的软件：`pacman -Q`
2. 列举显示（自己）安装的软件：`pacman -Qe`
3. 不显示多余信息：`pacman -Qq`
4. 查询本地安装的软件：`pacman -Qs [name]`
5. 查询不再需要的依赖：`pacman -Qdt`

`e`: `--explicit`

`q`: `--quiet`

`s`: `--search`

`d`: `--deps`

`t`: `--unrequired`

## 清理

1. 卸载多余的依赖：`sudo pacman -R $(pacman -Qdt)`
2. 删除安装包缓冲：`sudo pacman -Scc`
