# Markdown 插件

## iamcco/markdown-preview.nvim

简介：使用浏览器对 Markdown 文件进行预览

PS：切换主题颜色，将鼠标移动到预览页面的 Header，则会显示切换按钮

|mode|key|default|function|comment|
|:-:|:-:|:-:|:-:|:-:|
|`n`|`<leader>mp`|`false`|Preview Toggle|iamcco/markdown-preview.nvim|

## plasticboy/vim-markdown

简介：增加 Markdown 语法高亮、匹配规则和映射等。

与 header 相关的折叠

|mode|key|default|function|comment|
|:-:|:-:|:-:|:-:|:-:|
|`n`|`zr`|`true`|reduces fold level throughout the buffer||
|`n`|`zR`|`true`|opens all folds||
|`n`|`zm`|`true`|increases fold level throughout the buffer||
|`n`|`zM`|`true`|folds everything all the way|
|`n`|`za`|`true`|open a fold your cursor is on|
|`n`|`zA`|`true`|open a fold your cursor is on recursively|
|`n`|`zc`|`true`|close a fold your cursor is on|
|`n`|`zC`|`true`|close a fold your cursor is on recursively|

header 的跳转

|mode|key|default|function|comment|
|:-:|:-:|:-:|:-:|:-:|
|`n`/`v`|`gx`|`true`|open the link under the cursor in the same browser as the standard `gx` command.|`<Plug>Markdown_EditUrlUnderCursor`|
|`n`/`v`|`ge`|`true`|open the link under the cursor in Vim for editing||
|`n`/`v`|`]]`|`true`|go to next header|`<Plug>Markdown_MoveToNextHeader`|
|`n`/`v`|`[[`|`true`|go to previous header.|`<Plug>Markdown_MoveToPreviousHeader`|
|`n`/`v`|`][`|`true`|go to next sibling header if any. |`<Plug>Markdown_MoveToNextSiblingHeader`|
|`n`/`v`|`[]`|`true`|go to previous sibling header if any. |`<Plug>Markdown_MoveToPreviousSiblingHeader`|
|`n`/`v`|`]c`|`true`|go to Current header. |`<Plug>Markdown_MoveToCurHeader`|
|`n`/`v`|`]u`|`true`|go to parent header (Up). |`<Plug>Markdown_MoveToParentHeader`|

自己定义的 mapping

|mode|key|default|function|comment|
|:-:|:-:|:-:|:-:|:-:|
|`n`|`<leader>mit`|`false`|insert Toc|`InsertToc`|
|`n`|`<leader>mint`|`false`|insert number Toc|`InsertNToc`|
|`n`|`<leader>mtf`|`false`|Format the table under the cursor|`TableFormat`|

## vim-table-mode

暂时还没有使用
