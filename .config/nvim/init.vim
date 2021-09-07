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

set number
set relativenumber
set expandtab
set tabstop=2
set shiftwidth=2

autocmd VimEnter * if 0 == argc() | NERDTree | endif
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
:  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
:augroup END

nnoremap dd "_dd
vnoremap dd "_dd

