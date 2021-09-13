# diff

如果 file 被省略，则表示 diff 所有修改的文件。

## working <-> storage

```bash
git diff [file]
```

注：如果 storage 没有相应的文件，则比较最近提交的历史版本中相应的文件。

## working <-> history

```bash
git diff [commit] file
# eg
git diff HEAD file
git diff xxxxx file
```

## storage <-> history

```bash
git diff --cached [commit] file
# or
git diff --staged [commit] file
```

如果 commit 被省略，则表示最近提交的历史版本中相应的文件。

## working <-> working

```bash
git diff --no-index file1 file2
```

## history <-> history

```bash
git diff [commit1] [commit2] file
```

