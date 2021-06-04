# WSL 技巧

## WSL 多实例共存

默认情况下，WSL 不允许同时安装多个相同发行版本的 WSL。也就是说你可以安装同时安装 Ubuntu 18.04 和 Ubuntu 20.04，但是你不可以同时安装多个 Ubuntu 20.04。

但是可以通过第三方工具 `LxRunOffline` 来进行实现。

如果是想安装全新的系统的话，直接使用 `lxrunoffline i -n new_name -d path -f *.tar.gz`，只需要将 `name` 替换成另一个没有使用过的名称即可。

如果是想复制已有 WSL的话，使用如下步骤

```bash
# 复制一份 WSL
## name 为想复制的 WSL 的名称
## path 为目标路径
## new_name 为新的 WSL 的名称
lxrunoffline d -n name -d path -N new_name
```

## 重新注册

如果系统重装了，需要重新注册 WSL

```bash
lxrunoffline rg -n name -d path
```

