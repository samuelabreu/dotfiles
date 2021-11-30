Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'lewis6991/spellsitter.nvim'

augroup TreesitterOverrides
    autocmd!
    autocmd User PlugLoaded luafile ~/.config/nvim/plugins/treesitter.lua
    autocmd User PlugLoaded set spell spelllang=pt,en
augroup end
