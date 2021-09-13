# Language Server Protocol

## neovim/nvim-lspconfig

|mode|key|default|function|comment|
|:-:|:-:|:-:|:-:|:-:|
|`n`|`gD`|`true`|goto declaration||
|`n`|`gd`|`true`|goto definition||
|`n`|`K`|`true`|hover||
|`n`|`gi`|`true`|goto implementation||
|`n`|`<C-k>`|`true`|signature_help||
|`n`|`<space>wa`|`true`|add_workspace_folder||
|`n`|`<space>wr`|`true`|remove_workspace_folder||
|`n`|`<space>wl`|`true`|print(vim.inspect(vim.lsp.buf.list_workspace_folders()))||
|`n`|`<space>D`|`true`|type_definition||
|`n`|`<space>rn`|`true`|rename||
|`n`|`<space>ca`|`true`|code_action||
|`n`|`gr`|`true`|goto reference||
|`n`|`<space>e`|`true`|show_line_diagnostics||
|`n`|`[d`|`true`|diagnostic.goto_prev||
|`n`|`]d`|`true`|diagnostic.goto_next||
|`n`|`<space>e`|`true`|show_line_diagnostics||
|`n`|`<space>q`|`true`|diagnostic.set_loclist||
|`n`|`<space>f`|`true`|formatting||