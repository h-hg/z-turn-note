## sshd

安装

```bash
sudo pacman -S openssh
sudo vim /etc/ssh/sshd_config
```

修改如下几个即可

```text
Port 2222                                 # ssh 端口号
PermitRootLogin yes                       # 是否可以用 root 账号登陆
PubkeyAuthentication yes                  # 是否可以用密钥登录
AuthorizedKeysFile .ssh/authorized_keys   # 密钥位置
PasswordAuthentication yes                # 密码验证登陆
```

生成密钥

如果遇到错误 `sshd: no hostkeys available – exiting`，执行 `sudo ssh-keygen -A`

启动服务并设置开机启动

由于 wsl 无法直接使用 `systemd`，现阶段只能采用第三方方案实现。详情见 [WSL2(Arch Linux)使用systemd](https://www.oyohyee.com/post/note_wsl2_systemd)

```bash
sudo pacman -S genie-systemd[arhclinuxcn]
`````

```text
sudo genie -c systemctl enable sshd.service
sudo genie -c systemctl start sshd.service
```

