# Win10 SSH

## 安装

管理员运行 powershell

```powershell
Get-WindowsCapability -Online | ? Name -like 'OpenSSH*'

# This should return the following output:

Name  : OpenSSH.Client~~~~0.0.1.0
State : NotPresent
Name  : OpenSSH.Server~~~~0.0.1.0
State : NotPresent
```

```powershell
# Install the OpenSSH Client
Add-WindowsCapability -Online -Name OpenSSH.Client~~~~0.0.1.0

# Install the OpenSSH Server
Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0

# Both of these should return the following output:

Path          :
Online        : True
RestartNeeded : False
```

客户端和服务端的安装目录为 `C:\Windows\System32\OpenSSH`

## 配置

管理员运行 powershell

```powershell
Start-Service sshd

# OPTIONAL but recommended:
Set-Service -Name sshd -StartupType 'Automatic'

# Confirm the Firewall rule is configured. It should be created automatically by setup.
Get-NetFirewallRule -Name *ssh*

# There should be a firewall rule named "OpenSSH-Server-In-TCP", which should be enabled
# If the firewall does not exist, create one
New-NetFirewallRule -Name sshd -DisplayName 'OpenSSH Server (sshd)' -Enabled True -Direction Inbound -Protocol TCP -Action Allow -LocalPort 22
```

sshd 的配置文件存在于 ` C:\ProgramData\ssh`

关于密钥等配置都跟 Linux 的一样。

## 设置用户密码

```bash
net user user_name password
```

参考资料

- [Installation of OpenSSH For Windows Server 2019 and Windows 10](https://docs.microsoft.com/en-us/windows-server/administration/openssh/openssh_install_firstuse)

