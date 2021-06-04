# Vimium

- [chrome Vimium](https://chrome.google.com/webstore/detail/vimium/dbepggeogbaibhgnhhndojpepiihcmeb)
- [Vimium 主页](https://vimium.github.io/)
- [Vimium README](https://github.com/philc/vimium/blob/master/README.md)

历史

|按键|功能|
|:-:|:-:|
|`H`|后退|
|`L`|前进|

标签

|按键|功能|
|:-:|:-:|
|`K`|右边的标签|
|`gt`|右边的标签|
|`J`|左边的标签|
|`gT`|左边的标签|
|`g0`|第一个标签|
|`g$`|最后一个标签|
|`^`|上一个浏览的标签|
|`yt`|重复当前标签|
|`t`|新建标签页|
|`x`|关闭当前标签|
|`X`|恢复关闭的标签|
|`T`|在已打开的标签搜索|
|`W`|将当前标签作为新的窗口|
|`<a-p>`|固定/松开 当前标签|

页面

|按键|功能|
|:-:|:-:|
|`?`|显示帮助对话框|
|`j`|向左滚动|
|`j`|向下滚动|
|`k`|向上滚动|
|`l`|向右滚动|
|`gg`|回到顶部|
|`G`|回到底部|
|`u`|向上滚半页|Vim `<C-u`|
|`d`|向下滚半页|Vim `<C-d`|
|`<C-f`>|向上滚一页|
|`<C-b`>|向下滚一页|
|`f`|本标签打开新页面|
|`F`|新标签打开新页面|
|`o`|本标签打开 URL、书签或历史记录|
|`O`|新标签打开 URL、书签或历史记录|
|`b`|本标签打开书签|
|`B`|新标签打开书签|
|`r`|刷新|
|`gs`|goto source，浏览网页源代码|
|`/`|查找|
|`n`|下一个查找|
|`N`|上一个查找|
|`yy`|复制当前 URL|
|`yf`|复制页面某个 URL|
|`gf`|Cycle focus to the next frame|
|`gF`|focus the main/top frame|
|`i`|插入模式，相当于 Vimium 所有按键命令都失效|

Using marks:

```
ma, mA  set local mark "a" (global mark "A")
`a, `A  jump to local mark "a" (global mark "A")
``      jump back to the position before the previous jump
          -- that is, before the previous gg, G, n, N, / or `a
```

Additional advanced browsing commands:

```
]], [[  Follow the link labeled 'next' or '>' ('previous' or '<')
          - helpful for browsing paginated sites
<a-f>   open multiple links in a new tab
gi      focus the first (or n-th) text input box on the page
gu      go up one level in the URL hierarchy
gU      go up to root of the URL hierarchy
ge      edit the current URL
gE      edit the current URL and open in a new tab
zH      scroll all the way left
zL      scroll all the way right
v       enter visual mode; use p/P to paste-and-go, use y to yank
V       enter visual line mode
```

