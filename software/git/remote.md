# 远程


```bash
git clone url [path]
```

支持的协议：

- https：`https://`
- git：`git://`
- ssh：`user@server:path/to/repo.git`

添加

```bash
git remote add remote_name url
```

推送

```bash
git remote push remote_name local_branch
```

这个 local_branch 值得查一查，还是 remote_branch

拉取

full = fetch + merge

```bash
git pull remote_name remote branch
```

等价于

```bash
git fetch remote_name remote_branch
```

```bash
git merge remote_name/remote_branch
```

一般来说 push 之前要 pull，让本地分支处于最新状态
加
git push origin TagName：把tag推送到远程仓库
git push origin --tags：把所有tag都推送到远程仓库
git checkout TagName：切换到某个tag去
git checkout -b NewBranchName TagName:以某个tag为基准创建分支
git tag -d TagName：删除本地某个tag
git push origin :refs/tags/TagName：删除远程的某个tag
