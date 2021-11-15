runtime! plug.vim
call plug#begin("~/.config/nvim/plugins")
  Plug 'mg979/vim-visual-multi', {'branch': 'master'}
  Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
  Plug 'leafgarland/typescript-vim'
  Plug 'othree/yajs.vim', { 'for': ['javascript', 'javascript.jsx'] }
  Plug 'othree/es.next.syntax.vim', { 'for': ['javascript', 'javascript.jsx'] }
  Plug 'othree/javascript-libraries-syntax.vim', { 'for': ['javascript', 'javascript.jsx'] }
  Plug 'preservim/nerdtree'
  Plug 'lambdalisue/suda.vim'
  Plug 'tpope/vim-surround'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

set mouse=a
set number
set expandtab
set tabstop=2
set shiftwidth=2
set termguicolors
set scrolloff=2

autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()
let g:indent_guides_enable_on_vim_startup = 1

function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

noremap <up> <C-w><up>
noremap <down> <C-w><down>
noremap <left> <C-w><left>
noremap <right> <C-w><right>

" coc.nvim
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

noremap <C-p> :CocCommand<CR>

