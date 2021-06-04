# 开发环境

这里只安装一些简单的开发工具，能安装在 WSL 的，尽量安装在 WSL

## 工具

```bash
scoop install -g \
windows-terminal \
postman \
lxrunoffline \
```

说明：

- lxrunoffline：第三方增强的 WSL 工具
- windows-terminal：可能会遇到无法启动，建议在 MS store 里面安装

已弃用：

- zeal：直接看网页

## Python

```bash
scoop install -g python
```

有时候还是需要跑 python 脚本的。

IDE 看个人需求吧

```bash
sudo scoop install -g PyCharm-portable
```

## C / C++

```bash
sudo scoop install -g \
gcc \
gdb \
cmale \
clang
```

IDE

```bash
sudo scoop install -g \
CLion-portable \
```

- [QT](https://www.qt.io/)

## 前端

```bash
sudo scoop install -g \
nodejs
```