# 文件

## 互转

working -> storage

```bash
git add [file]
```

storage -> working

```bash
git restore file
# equal to
git restore --worktree file
# equal to
git checkout -- file
```

storage -> history

```bash
git commit -m "xx" [file]
```

history -> storage

```bash
git reset file
# equal to
git reset --mixed HEAD file
```
值得注意的是如果是使用 `reset`，并且不是指定 HEAD，那么历史版本的指针会被移动，而 restore 不会。

working -> history

```bash
git commit -a -m "xxx"
```

将工作区已追踪的文件 `add` 并 `commit`

history -> working

```bash
git restore --source=HEAD file
```

source 后面可以是 commit

## working

从 working 中删除

```bash
rm file
```

## Storage

从 Storage 中删除：准确的说应该是撤销对 Storage 的修改，例如你删除了 Storage 的文件，但是还没有 commit，可以使用改命令回复文件被修改的状态。

```bash
git restore --staged file
git rm --cached file
```

## history

```bash
git commit --amend
```

将本次的修改与上一次的 commit 形成一个新的 commit，其 message 使用上一个 commit。这种适用于 commit 后，突然发现发现了一个小错误，又不想有一个不一样的 message 的 commit。
