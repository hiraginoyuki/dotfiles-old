call plug#begin("~/.config/nvim/plugins")

Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/yajs.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/es.next.syntax.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'preservim/nerdtree'
Plug 'lambdalisue/suda.vim'
Plug 'carlosrocha/vim-chrome-devtools', { 'do': 'bash install.sh' }

call plug#end()

