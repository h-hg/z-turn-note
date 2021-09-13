# 版本控制

## 回退

`git reset` 主要有三个参数

1. `--soft`：该操作仅仅移动 HEAD 指针
2. `--mixed`：在 `--soft` 的基础上，重置 storage。（默认）
3. `--hard`：在 `--mixed` 的基础上，重置 working

这三个参数解释得不对，具体看参考资料

常用于索引版本的有三个参数

1. `^`：一个`^`表示回退一个版本
2. `~`：`~` 后接着数字，表示回退几个版本
3. hash 值：用于跳转到任意版本。

```bash
git reset --hard HEAD^^^
# equal to
git reset --hard HEAD~3
# equal to
git reset --hard xxxxxx
```

参考资料

- [Git Reset 三种模式](https://www.jianshu.com/p/c2ec5f06cf1a)
- [git reset命令常用用法](https://www.talktocomputer.site/blogs/82)

## 日志

```bash
git log
git log --pretty=oneline
git log --oneline
git reflog
```
