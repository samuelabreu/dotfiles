set expandtab
set shiftwidth=2
set tabstop=2
set hidden
set signcolumn=number
set relativenumber
set number
set termguicolors
set undofile
set title
set ignorecase
set smartcase
set wildmode=longest:full,full
set nowrap
set list
set listchars=tab:▸\ ,trail:·
set mouse=a
set scrolloff=8
set sidescrolloff=8
set nojoinspaces
set splitright
set clipboard=unnamedplus
set confirm
set exrc
set nobackup
set updatetime=300 " Reduce time for highlighting other references
set redrawtime=10000 " Allow more time for loading syntax on large files
set history=500
set noerrorbells
set lazyredraw

"--------------------------------------------------------------------------
" Key maps
"--------------------------------------------------------------------------

let mapleader = "\<space>"

nmap <leader>ve :edit ~/.config/nvim/init.vim<cr>
nmap <leader>vr :source ~/.config/nvim/init.vim<cr>
nmap <leader>w :up<cr>
nmap <leader>W :wa<cr>
nmap <leader><cr> :noh<cr>
nmap Q :close<cr>
map gf :edit <cfile><cr>
nmap <leader>l :bnext<cr>
nmap <leader>h :bprevious<cr>
nmap <leader>tn :tabnew<cr>
nmap <leader>to :tabonly<cr>
nmap <leader>tc :tabclose<cr>
nmap <leader>tm :tabmove<cr>
nmap <silent> <C-h> <C-w>h
nmap <silent> <C-j> <C-w>j
nmap <silent> <C-k> <C-w>k
nmap <silent> <C-l> <C-w>l
nmap + :exe "vertical resize +3"<cr>
nmap - :exe "vertical resize -3"<cr>
nmap <leader>+ :exe "resize +3"<cr>
nmap <leader>- :exe "resize -3"<cr>
nmap = <C-w>=<cr>
vnoremap < <gv
vnoremap > >gv
vmap J :m '>+1<cr>gv=gv
vmap K :m '<-2<cr>gv=gv
" Checar o pq tá indo pra outra linha
nmap <leader>k :m .-2<cr>==
nmap <leader>j :m .+1<cr>==

" Maintain the cursor position when yanking a visual selection http://ddrscott.github.io/blog/2016/yank-without-jank/
vnoremap y myy`y
vnoremap Y myY`y

" Paste replace visual selection without copying it
vnoremap <leader>p "_dP 
nnoremap Y y$

" Open the current file in the default program
nmap <leader>x :!xdg-open %<cr><cr>

" Terminal
tmap <Esc> <C-\><C-n>

" echo "ALT LOADED"
so ~/.config/nvim/plugins.vim
