# Scoop

## 自定义安装

设置 User 级别的安装路径

```powershell
$env:SCOOP='D:\scoop\local'
[environment]::setEnvironmentVariable('SCOOP',$env:SCOOP,'User')
```

下载安装 Scoop

```powershell
iwr -useb get.scoop.sh | iex
```

设置全局安装路径

```powershell
$env:SCOOP_GLOBAL='D:\scoop\global'
[environment]::setEnvironmentVariable('SCOOP_GLOBAL',$env:SCOOP_GLOBAL,'Machine')
```

## 基础必备依赖

```bash
scoop install -g \
sudo \
git \
aria2 \
sudo \
lessmsi \
dark \
innounp \
```

- 7zip：解压和压缩工具，scoop 遇到 7z 格式的压缩包需要用到
- git：bucket 的添加和更新
- aria2：scoop 多线程下载
- lessmis：scoop 遇到 msi 格式的包时有时需要用到
- sudo：让 Win 也想 Linux 那样提权，方便全局安装

## bucket

```bash
scoop bucket add extras
scoop bucket add jetbrains
scoop bucket add nerd-fonts
scoop bucket add dorado https://github.com/chawyehsu/dorado
scoop bucket add mochi https://hub.fastgit.org/Qv2ray/mochi
scoop bucket add wsl https://git.irs.sh/KNOXDEV/wsl
```

- jetbrains：jetbrains 一家的产品
- nerd-fonts：各种字体
- dorado：一个国人维护的仓库，主要有国产软件
- mochi：qv2ray 官方维护的仓库，主要是提供国内镜像加速的 qv2ray 的相关软件
- wsl：wsl

## 代理

```bash
scoop config proxy 127.0.0.1:XXXX
```

或者直接在配置文件 `~/.config/scoop/config.json` 中添加

```json
"proxy": "127.0.0.1:XXXX"
```

删除代理

```bash
 scoop config rm proxy
```

## 参考资料

- [你需要掌握的Scoop技巧和知识](https://zhuanlan.zhihu.com/p/135278662)
