# 分支

## branch

查看分支

```bash
# show local branch
git branch
# show remote branch
git branch -r
# show all branch
git branch -a
```

在当前提交上新建分支

```bash
git branch branch_name
```

删除分支

```bash
git branch -d branch_name
```

合并某分支到当前分支

```bash
git merge branch_name[\hash]
```

重命名分支

```bash
git branch -m old_name new_name
```

注：如果是修改当前分支的名字，直接

```bash
git branch -m new_name
```

## switch

由于 checkout 包含了分支的管理、文件的回复这两个核心内容，容易让新手产生误解，故在 git 2.23 中引入 switch 和 restore 分别负责这两个核心内容。换言之，checkout 命令将逐渐推出历史舞台。

切换分支

```bash
git switch branch_name
git checkout branch_name
```

以最前 commit 创建并切换分支

```bash
git switch -c branch_name
git checkout -b branch_name
```

以某个 commit 来创建分支

```bash
git switch -c branch_name commit
```

以某个 tag 来创建分支

```bash
git switch -c branch_name tag_name
```

创建一个没有任何提交记录的分支，删除所有跟踪的文件

```bash
git switch --orphan branch_name
```

## 冲突

1. merge
2. 修改文件
3. add
4. commit

## rebase

git merge --no-ff
git merge squash
git rebase 

这三者的区别
