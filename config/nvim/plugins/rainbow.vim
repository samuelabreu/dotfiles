Plug 'p00f/nvim-ts-rainbow'

augroup RainbowOverrides
    autocmd!
    autocmd User PlugLoaded luafile ~/.config/nvim/plugins/rainbow.lua
augroup end
