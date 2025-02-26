call plug#begin('~/.vim/plugged')

""syntax
Plug 'sheerun/vim-polyglot'
Plug 'HerringtonDarkholme/yats.vim'
Plig 'pangloss/vim-javascript'
Plug 'flowtype/vim-flow'

""Satus bar
Plug 'maximbaz/lightline-ale'
Plug 'itchyny/lightline.vim'

""Themes
Plug 'morhetz/gruvbox'
"Plug 'itchyny/lightline-gruvbox.vim'
"Plug 'shinchu/lightline-gruvbox.vim'
""Tree
Plug 'scrooloose/nerdtree'

""Typing
Plug 'jiangmiao/auto-pairs' "Auto brackets"
Plug 'alvan/vim-closetag' "close tag"
Plug 'tpope/vim-surround'

""tmux
Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'

""autocomplete
Plug 'sirver/ultisnips'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

""test
Plug 'tyewang/vimux-jest-test'
Plug 'janko-m/vim-test'

""IDE
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'easymotion/vim-easymotion'
Plug 'mhinz/vim-signify'
Plug 'yggdroot/indentline'
Plug 'scrooloose/nerdcommenter'
"Tools DevOps
Plug 'pearofducks/ansible-vim', { 'do': './UltinSnips/generate.sh' }
""Developers
""Rust
Plug 'rust-lang/rust.vim'
""Golang
Plug 'fatih/vim-go', {'tag': '*'}
""Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'

""other
Plug 'easymotion/vim-easymotion'

""file
Plug 'scrooloose/nerdtree'


call plug#end()
