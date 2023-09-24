" PLUGIN
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

"Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'chrisbra/vim-commentary'
Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'elixir-editors/vim-elixir'
Plugin 'zhou13/vim-easyescape' " https://github.com/zhou13/vim-easyescape/
Plugin 'junegunn/fzf' " https://github.com/junegunn/fzf
Plugin 'junegunn/fzf.vim' " https://github.com/junegunn/fzf.vim 

call vundle#end()            " required
filetype plugin indent on    " required

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" see :h vundle for more details or wiki for FAQ

" ********** CONFIGURACIONES GENERALES ***************

set expandtab " Convierte tabs en espacios
set tabstop=2 " Numero de espacios de identacion
set shiftwidth=2 " Espacios para identacion
set softtabstop=2 " Hace que los espacios se sientan como tabs reales
set autoindent " Auto identado
set nu
syntax on
set undolevels=1000
set rnu " Numeros relativos
color industry

" Copy and Paste Luke Smith
vnoremap <C-c> "*y :let @+=@*<CR>
map <C-v> "+P
map + "+P 

" Autoidentacion en las siguientes palabras
set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

" CtrlP (Buscador de Archivos)
"let g:ctrlp_map = '<c-p>'
"let g:ctrlp_cmd = 'CtrlP'

" Fzf File Finder
map ; :Files<CR>

" Autocarga del path
set path+=autoload

" Preview para Latex Live Preview (xuhdev/vim-latex-live-preview)
let g:livepreview_previewer = 'zathura'

" Compilar Latex
nmap <C-l> <ESC>:LLPStartPreview<CR>

" Ver PDF actual compilado
nmap <C-m> <ESC>:silent !zathura %.pdf &<CR>

" Compilar MarkDown
"autocmd BufWritePost *.md silent !mdtopdf % 
" https://stackoverflow.com/questions/13515893/set-margin-size-when-converting-from-markdown-to-pdf-with-pandoc 
autocmd BufWritePost *.md silent !pandoc -V geometry:margin=1in -o %.pdf %


" Vim easy escape
let g:easyescape_chars = { "j": 1, "k": 1 }
let g:easyescape_timeout = 100
cnoremap jk <ESC>
cnoremap kj <ESC>

" ********** URL o ANEXOS ***************
" URL Interesantes
" Lista de Plugins: https://github.com/mutewinter/dot_vim 
" Lista de Plugins: https://medium.com/@huntie/10-essential-vim-plugins-for-2018-39957190b7a9 
" VimAwesome: https://vimawesome.com/plugin/surround-vim 
