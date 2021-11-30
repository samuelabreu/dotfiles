Plug 'andymass/vim-matchup'

augroup MatchupOverrides
    autocmd!
    autocmd User PlugLoaded luafile ~/.config/nvim/plugins/vim-matchup.lua
augroup end
