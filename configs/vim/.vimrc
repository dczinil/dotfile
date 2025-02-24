set nocompatible
set nowrap
set mouse=a
syntax on
set hidden
filetype plugin on
""Searching
set incsearch
set showcmd
set showmatch
set hlsearch
set ignorecase
set smartcase
set backspace=indent,eol,start
""wild
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
set autoindent
set nostartofline
set ruler
set laststatus=2
set confirm
set visualbell
set t_vb=
set cmdheight=2
set number
set numberwidth=1
set notimeout ttimeout ttimeoutlen=200
set expandtab
""Style
set t_Co=256
colorscheme gruvbox 
set bg=dark
"let g:gruvbox_contrat_dark = "hard"
highlight Normal ctermbg=NONE
"let g:lightline = {}
"let g:lightline.colorscheme = 'gruvbox'
set laststatus=2
let mapleader=" "
""Vim-tag
"filenames like *.xml, *.html, *.xhtml, ...
"These are the file extensions where this plugin is enabled.
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
"filenames like *.xml, *.xhtml, ...
"This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
"filetypes like xml, html, xhtml, ...
"These are the file types where this plugin is enabled.
let g:closetag_filetypes = 'html,xhtml,phtml'
"filetypes like xml, xhtml, ...
"This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
"integer value [0|1]
"This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
let g:closetag_emptyTags_caseSensitive = 1
"Shortcut for closing tags, default is '>'
let g:closetag_shortcut = '>'
"Add > at current position without closing the current tag, default is ''
let g:closetag_close_shortcut = '<leader>>'
"""Golang
"--------------------
" scrooloose/nerdtree
" -------------------
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\\.swo$', '\\.swp$', '\\.git']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1 ""Close NerdTree when opening a new file
let NERDTreeShowhidden=1
let NERDTreeKeepTreeInNewTab=1
"---------------------------
"Xuyuanp/nerdtree-git-plugin
"---------------------------
" Override the default symbols
let g:NERDTreeIndicatorMapCustom ={
  \ 'Modified'  : 'M',
  \ 'Staged'    : 'S',
  \ 'Untracked' : '*',
  \ 'Renamed'   : 'R',
  \ 'Unmerged'  : 'U',
  \ 'Deleted'   : '!',
  \ 'Dirty'     : 'D',
  \ 'Clean'     : 'C',
  \ 'Ignored'   : 'I',
  \ 'Unknown'   : '?'
  \ }
"Enable lsp for go by using gopls
let g:completor_filetype_map = {}
let g:completor_filetype_map.go = {'ft': 'lsp', 'cmd': 'gopls -remote=auto'}
set noshowmode
set sw=2
set autoindent
set relativenumber
set clipboard=unnamedplus
"Tools DevOps
let g:ansible_unindent_after_newline = 1
let g:ansible_yamlKeyName = 'yamlkey'
let g:ansible_attribute_highlight = "ob"
let g:ansible_name_highlight = 'd'
let g:ansible_extra_keywords_highlight = 1
let g:ansible_extra_keywords_highlight_group = 'Statement'
let g:ansible_normal_keywords_highlight = 'Constant'
let g:ansible_loop_keywords_highlight = 'Constant'
let g:ansible_template_syntaxes = { '*.rb.j2': 'ruby' }
let g:ansible_ftdetect_filename_regex = '\v(playbook|site|main|local|requirements)\.ya?ml$'
so ~/.vim/plugins.vim
so ~/.vim/maps.vim
if has("autocmd")
   au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
