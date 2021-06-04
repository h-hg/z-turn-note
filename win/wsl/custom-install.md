# WSL 自定义安装位置

1. 下载离线的 WSL appx 镜像。如可从[微软官方指定的版本](https://docs.microsoft.com/en-us/windows/wsl/install-manual)进行下载，这里以 Ubuntu 18.04 为例
2. 将 appx 改为 zip，并解压到你想要安装的目录。

```bash
$ tree -L 1 . 
.
├── AppxBlockMap.xml
├── AppxManifest.xml
├── AppxMetadata
├── AppxSignature.p7x
├── Assets
├── [Content_Types].xml
├── install.tar.gz
├── resources.pri
└── ubuntu2004.exe
```

3. 双击运行 `ubuntu1804.exe`，它会自动在此目录下安装好 Ubuntu wsl。
4. 如果需要的话，可以将该安装目录添加到环境变量

```powershell
$userenv = [System.Environment]::GetEnvironmentVariable("Path", "User")
[System.Environment]::SetEnvironmentVariable("PATH", $userenv + ";J:\Ubuntu18.04onWindows_1804", "User")
```

## LXRUNOFFLINE

1. 将 appx 改为 zip，并解压。
2. `lxrunoffline i -n name -d path -f *.tar.gz -s`
  - `name` 为 wsl 的名称
  - `path` 为 wsl 的安装路径
  - `*.tar.gz` 为步骤1 解压得到的 `install.tar.gz` 格式的文件的路径。
  - 详细参数可以运行 `lxrunoffline i` 进行查看
  - `-s` 表示创建桌面快捷图标

如果是安装 ArchLinux 的话，将命令改为 `lxrunoffline i -n name -d path -f *.tar.gz -r root.x86_64 -s`，更多详情见 [LxRunOffline wiki](https://github.com/DDoSolitary/LxRunOffline/wiki)

# LXRUNOFFLINE

[wsl 相关的教程](https://www.junmajinlong.com/categories/Others/wsl/)
