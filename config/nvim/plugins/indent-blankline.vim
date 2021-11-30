Plug 'lukas-reineke/indent-blankline.nvim'

augroup BlanklineOverrides
    autocmd!
    autocmd User PlugLoaded luafile ~/.config/nvim/plugins/indent-blankline.lua
augroup end
