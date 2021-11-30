" Plug 'ggandor/lightspeed.nvim'
Plug 'phaazon/hop.nvim'

augroup MotionOverrides
    autocmd!
    autocmd User PlugLoaded luafile ~/.config/nvim/plugins/motion.lua
augroup end
