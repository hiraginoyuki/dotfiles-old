runtime! plug.vim
call plug#begin("~/.config/nvim/plugins")
  Plug 'mg979/vim-visual-multi', {'branch': 'master'}
  Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
  Plug 'othree/yajs.vim', { 'for': ['javascript', 'javascript.jsx'] }
  Plug 'othree/es.next.syntax.vim', { 'for': ['javascript', 'javascript.jsx'] }
  Plug 'othree/javascript-libraries-syntax.vim', { 'for': ['javascript', 'javascript.jsx'] }
  Plug 'preservim/nerdtree'
  Plug 'lambdalisue/suda.vim'
call plug#end()

set expandtab
set tabstop=2
set shiftwidth=2

nnoremap dd "_dd
vnoremap dd "_dd

