Plug 'neovim/nvim-lspconfig'
Plug 'simrat39/rust-tools.nvim'

augroup LspOverrides
    autocmd!
    autocmd User PlugLoaded luafile ~/.config/nvim/plugins/lsp.lua
augroup end
