# WSL 与 Win10 交互

## 环境变量

WSL 中可以直接使用 Win 的环境变量，例如可执行程序。

## 文件互访

1. 以 Win10 资源管理器浏览 WSL 文件

```bash
explorer.exe [path]
```

2. Win 用 vscode 打开 WSL 文件

```bash
code [path]
```

3. WSL 访问 Win10 文件

Win10 的盘都挂载在 `/mnt` 下

4. 调用其他可执行文件

如果该文件已经存在与 Win10 的环境变量中，假设为 `notepad.exe`，在 Win10 中，我们只需要输入 `notepad`，但是在 WSL 中，我们需要输入完全的 `notepad.exe`

## 网络互访

### WSL 通过网络访问 Win10

查询 WSL 的主机（Win10）的 IP 有两种方法

1. `cat /etc/resolv.conf`其中 `nameserver` 的项就是 Win10 的 IP
2. powershell 中运行 `ipconfig` 中的 `Ethernet adapter vEthernet (WSL):` 的项就是 Win10 的 IP

通过该 IP，我们就可以设置 WSL 访问 Win10 中的 proxy（vpn）服务了，只需要让相应的 proxy 软件设置允许局域网访问。

注意：

- 每次重启 Win10，该 IP 都会发生改变
- 该 IP 不是 Win10 真正的IP

### Win10 通过网络访问 WSL

安装网络工具

```bash
sudo pacman -S net-tools
```

执行 `ifconfig eth0` 即可看到 WSL 的 IP，我们就可以 IP

通过该 IP，就可以让 Win10 访问 WSL 构建的网站，或者通过 ssh 连接 WSL

注意：

- 每次重启 Win10，该 IP 都会发生改变

### 局域网访问 WSL

这里需要让 Win10 作为代理，连接 WSL 和局域网的其他主机。

```powershell
netsh interface portproxy add v4tov4 listenport=4000 listenaddress=0.0.0.0 connectport=22 connectaddress=xxx.xxx.xxx.xxx
```

- listenport：Win10 监听的端口
- listenaddress：Win10 监听的地址，也就是运行哪些局域网的主机来访问 WSL，这里设置的是允许所有地址。
- connectport：Win10 将数据转发到 WSL 的端口，这里以 SSHD 为例，22 表示 WSL 的 SSHD 服务。
- connectaddress：WSL 的IP，从上面的教程获得

然后，局域网的主机可以通过 `ssh -p 4000 h-hg@win_ip` 来 SSH 连接 WSL

> （3）开启防火墙入站规则（也可以在控制面板-Windows Defender 防火墙-高级设置-入站规则中设置）
> netsh advfirewall firewall add rule name=WSL2 dir=in action=allow protocol=TCP localport=2222

如果想删除此代理，使用

```powershell
netsh interface portproxy delete v4tov4 listenaddress=4000 listenaddress=0.0.0.0
```

查看所有 Win10 代理的窗口

```powershell
netsh interface portproxy show all
```

### 广域网访问 WSL

由于个人的主机是局域网的，所以要进行广域网访问，必须进行进行内网穿透。

例如可以使用 `frp`，在公共服务器部署 `frps`，然后在 Win10 安装 `frpc`，然后在 `frpc.ini`中的 `local_ip` 填写 WSL 的 IP，`local_port` 填写你想要的 WSL 端口即可。

### 参考资料

- [Comparing WSL 1 and WSL 2](https://docs.microsoft.com/en-us/windows/wsl/compare-versions)
- [WSL2 的一些网络访问问题](https://lengthmin.me/posts/wsl2-network-tricks/)
- [lengthmin/dotfiles/windows/wsl2.ps1](https://github.com/lengthmin/dotfiles/blob/master/windows/wsl2.ps1)
- [Ubuntu「一键」设置代理](https://blog.skk.moe/post/enable-proxy-on-ubuntu/)
