# WSL 安装教程

本笔记记录的都是 **WSL 2** 的内容，而不是 WSL 1。

1. 开启 WSL

管理员模式开启 powershell 输入如下

```poweshell
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
```

2. 更新 Linux 内核

手动下载[内核更新程序](https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi)，进行更新

3. 设置 WSL 默认版本

```poweshell
wsl --set-default-version 2
·``
参考资料

- [Windows Subsystem for Linux Installation Guide for Windows 10](https://docs.microsoft.com/en-us/windows/wsl/install-win10)

