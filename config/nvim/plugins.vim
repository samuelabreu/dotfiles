" Automatically install vim-plug
" let data_dir = has('nvim') ? stdpath('data') . '-alt/site' : '~/.vim'
" if empty(glob(data_dir . '/autoload/plug.vim'))
"   silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
"   autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
" endif

so ~/.config/nvim/plugins/plug.vim
call plug#begin('~/.local/share/nvimalt/plugged')

source ~/.config/nvim/plugins/theme.vim
source ~/.config/nvim/plugins/airline.vim
" source ~/.config/nvim/plugins/coc.vim
source ~/.config/nvim/plugins/lsp.vim
source ~/.config/nvim/plugins/compe.vim
source ~/.config/nvim/plugins/commentary.vim
source ~/.config/nvim/plugins/floaterm.vim
source ~/.config/nvim/plugins/fugitive.vim
source ~/.config/nvim/plugins/telescope.vim
source ~/.config/nvim/plugins/treesitter.vim
source ~/.config/nvim/plugins/vim-matchup.vim
source ~/.config/nvim/plugins/rainbow.vim
source ~/.config/nvim/plugins/heritage.vim
source ~/.config/nvim/plugins/lastplace.vim
source ~/.config/nvim/plugins/nerdtree.vim
source ~/.config/nvim/plugins/peekaboo.vim
source ~/.config/nvim/plugins/projectionist.vim
source ~/.config/nvim/plugins/motion.vim
source ~/.config/nvim/plugins/sayonara.vim
source ~/.config/nvim/plugins/surround.vim
source ~/.config/nvim/plugins/indent-blankline.vim
source ~/.config/nvim/plugins/snippets.vim
source ~/.config/nvim/plugins/prettier.vim
source ~/.config/nvim/plugins/flake8.vim


" source ~/.config/nvim/plugins/lsp.vim

call plug#end()
doautocmd User PlugLoaded

echo "PLUGINS LOADED"
