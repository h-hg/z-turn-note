# Git

## lewis6991/gitsigns.nvim

|mode|key|default|function|comment|
|:-:|:-:|:-:|:-:|:-:|
|`n`|`]c`|`true`|next_hunk()|lewis6991/gitsigns.nvim|
|`n`|`[c`|`true`|prev_hunk()|lewis6991/gitsigns.nvim|
|`n`/`v`|`<leader>hs`|`true`|stage_hunk()|lewis6991/gitsigns.nvim|
|`n`|`<leader>hu`|`true`|undo_stage_hunk()|lewis6991/gitsigns.nvim|
|`n`/`v`|`<leader>hr`|`true`|reset_hunk()|lewis6991/gitsigns.nvim|
|`n`|`<leader>hR`|`true`|reset_buffer()|lewis6991/gitsigns.nvim|
|`n`|`<leader>hp`|`true`|preview_hunk()|lewis6991/gitsigns.nvim|
|`n`|`<leader>hb`|`true`|blame_line()|lewis6991/gitsigns.nvim|

-- Text objects
['o ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
['x ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>'