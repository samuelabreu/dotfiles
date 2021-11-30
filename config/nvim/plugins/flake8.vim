Plug 'nvie/vim-flake8'

autocmd FileType python map <buffer> <leader><F3> :call flake8#Flake8()<CR>
let flake8_show_in_file = 1

