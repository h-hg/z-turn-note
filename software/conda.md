# Conda

## 安装

这里选择了 miniconda。

基本步骤如下，详细见[Installation on Linux](https://conda.io/projects/conda/en/latest/user-guide/install/linux.html)

```bash
wget xx.sh
sh xx.sh
```

当遇到 `Do you wish the installer to inilialize Miniconda3 by running conda init`，默认是 `no`，吐槽一句，选择了 `no`，安装后要使用，也要再次初始化（`conda init zsh`，`zsh` 为你的 `shell`）

## 配置

conda 默认进入 shell，都是启动 base 环境，不太喜欢的话，可以取消。

```bash
conda config --set auto_activate_base false
```

如果需要重新开启的话，如下

```bash
conda config --set auto_activate_base true
```

镜像源的配置，可以见[清华镜像源](https://mirrors.tuna.tsinghua.edu.cn/help/anaconda/)

## 环境管理

查看帮助

```bash
conda env -h
```

创建一个新的环境

```bash
conda create -n env_name [python=x.x] [packages]
```

进入某个环境

```bash
conda activate env_name
```

退出当前环境

```bash
conda deactivate
```

显示所有环境

```bash
conda env list
```

删除某个环境

```bash
conda remove -n env_name
```

## 包管理

列出当前环境的包

```bash
conda list
```

为当前环境安装包（注意是 `=`，pip 是 `==`）

```bash
conda install pkg=x.x
```

卸载当前环境某个包

```bash
conda remove pkg
```

升级当前环境某个包

```bash
conda update pkg
```

搜索包

```bash
conda search pkg
```

cuda 的安装

```bash
conda install cudatoolkit=x.x cudnn=x
```
