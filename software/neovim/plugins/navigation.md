# navigation

## akinsho/nvim-bufferline.lua

|mode|key|default|function|conmment|
|:-:|:-:|:-:|:-:|:-:|
|`n`|`<leader><tab>`|`false`|next tab(buffer)|`BufferLineCycleNext`|
|`n`|`<leader><s-tab>`|`false`|previous tab(buffer)|`BufferLineCyclePrev`|
|`n`|`<leader>number`|`false`|switch to `number` tab(buffer)||
|`n`|`<leader>w`|`false`|close current tab(buffer)||
|`n`|`<leader>s`|`false`|save current tab(buffer)||
|`n`|`<leader>l`|`false`|move to next tab(buffer)|`BufferLineMoveNext`|
|`n`|`<leader>h`|`false`|move to previous tab(buffer)|`BufferLineMovePrev`|

## kyazdani42/nvim-tree.lua

|mode|key|default|function|comment|
|:-:|:-:|:-:|:-:|:-:|
|`n`|`<CR>`/`o`/Double left click|`true`|toggle folder or open file||
|`n`|`<C-]>`/Double right click|`true`|cd in the directory under the cursor||
|`n`|`<BS>`|`true`|close current opened directory or parent||
|`n`|`a`|`true`|add a file/folder|Adding a directory requires leaving a leading `/` at the end of the path.|
|`n`|`r`|`true`|rename a file||
|`n`|`<C-r>`|`true`|rename a file and omit the filename on input||
|`n`|`x`|`true`|add/remove file/directory to cut clipboard||
|`n`|`c`|`true`|add/remove file/directory to copy clipboard||
|`n`|`y`|`true`|copy name to system clipboard||
|`n`|`Y`|`true`|copy relative path to system clipboard||
|`n`|`gy`|`true`|copy absolute path to system clipboard||
|`n`|`p`|`true`|paste from clipboard. Cut clipboard has precedence over copy (will prompt for confirmation)||
|`n`|`d`|`true`|delete a file (will prompt for confirmation)||
|`n`|`]c`|`true`|go to next git item||
|`n`|`[c`|`true`|go to prev git item||
|`n`|`-`|`true`|navigate up to the parent directory of the current file/directory||
|`n`|`s`|`true`|open a file with default system application or a folder with default file manager||
|`n`|`<C-v>`|`true`|open the file in a vertical split
|`n`|`<C-x>`|`true`|open the file in a horizontal split
|`n`|`<C-t>`|`true`|open the file in a new tab
|`n`|`<Tab>`|`true`|open the file as a preview (keeps the cursor in the tree)
|`n`|`I`|`true`|toggle visibility of folders hidden via |g:nvim\_tree\_ignore|||
|`n`|`H`|`true`|toggle visibility of dotfiles (files/folders starting with a `.`)||
|`n`|`R`|`true`|refresh the tree||

|mode|key|default|function|comment|
|:-:|:-:|:-:|:-:|:-:|
|`n`|`<leader>b`|`false`|toggle nvim-tree|`NvimTreeToggle`|
|`n`|`<leader>b`|`false`|find current file in nvim-tree|`NvimTreeFindFile`|

## Telescope

telescope pane

|mode|key|default|function|comment|
|:-:|:-:|:-:|:-:|:-:|
|`i`|`<C-n>`/`<Down>`|`true`|next item|nvim-telescope/telescope.nvim|
|`n`|`j`|`true`|next item|nvim-telescope/telescope.nvim|
|`i`|`<C-j>`|`false`|next item|nvim-telescope/telescope.nvim, custom|
|`i`|`<C-p>`/`<Up>`|`true`|previous item|nvim-telescope/telescope.nvim|
|`n`|`k`|`true`|previous item|nvim-telescope/telescope.nvim|
|`i`|`<C-k>`|`false`|previous item|nvim-telescope/telescope.nvim, custom|
|`i`|`<CR>`|`true`|confirm item|nvim-telescope/telescope.nvim|
|`i`|`<C-x>`|`true`|spilt item|nvim-telescope/telescope.nvim|
|`i`|`<C-v>`|`true`|vspilt item|nvim-telescope/telescope.nvim|
|`i`|`<C-t>`|`true`|tab item|nvim-telescope/telescope.nvim|
|`i`|`<C-u>`|`true`|scroll up|nvim-telescope/telescope.nvim|
|`i`|`<C-d>`|`true`|scroll down|nvim-telescope/telescope.nvim|
|`i`|`<C-c>`|`true`|close|nvim-telescope/telescope.nvim|
|`n`|`<Esc>`|`true`|close|nvim-telescope/telescope.nvim|

|mode|key|default|function|comment|
|:-:|:-:|:-:|:-:|:-:|
|`n`|`<Leader>ff`|`false`|file picker - Lists files in your current working directory, respects .gitignore|`Telescope find_files`|
|`n`|`<Leader>fg`|`false`|file picker - Search for a string in your current working directory and get results live as you type (respecting .gitignore)|`Telescope live_grep`|
|`n`|`<Leader>fb`|`false`|vim picker -Lists open buffers in current neovim instance|`Telescope buffers`|
|`n`|`<Leader>fr`|`false`|vim picker - Lists vim registers, pastes the contents of the register on `<cr>`|`Telescope registers`|
|`n`|`<Leader>fh`|`false`|vim picker - vim help|`Telescope help_tags`|
|`n`|`<Leader>fgc`|`false`|git picker - Lists git commits with diff preview, checkout action `<cr>`, reset mixed `<C-r>m`, reset soft `<C-r>s` and reset hard `<C-r>h`|`Telescope git_commits`|
|`n`|`<Leader>fgb`|`false`|git picker - Lists buffer's git commits with diff preview and checks them out on `<cr>`|`Telescope git_bcommits`|
|`n`|`<Leader>fgs`|`false`|git picker - Lists current changes per file with diff preview and add action. (Multi-selection still WIP)|`Telescope git_status`|
