# Tag

可以简单认为 tag 是指向某个 commit 的指针。

查看所有标签

```bash
git tag
```

查看 tag 信息

```bash
git show tag_name
```

给某个 commit 打标签，若 commit 被省略，则默认最近的 commit

```bash
git tag tag_name [commit]
```

打 tag 同时加上备注

```bash
git tag -a tag_name -m "message"
```

如果使用的是下面的命令，则会调用编辑器进行编写备注

```bash
git tag -a tag_name
```

删除（本地）tag

```bash
git tag -d tag_name
```
