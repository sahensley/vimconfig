" ~./vimrc top of form
" vim: fdm=marker

" Plugin initialization {{{
call plug#begin()
" Seoul256 - color scheme
Plug 'junegunn/seoul256.vim'
" Goyo - distraction free writing
Plug 'junegunn/goyo.vim'
" Airline - fancy statusline
Plug 'vim-airline/vim-airline'
" BufExplorer - easier buffer switching
Plug 'jlanzarotta/bufexplorer'
" Commentary - easy commenting via 'g c'
Plug 'tpope/vim-commentary'
" Fugitive - git wrapper
Plug 'tpope/vim-fugitive'
" Vinegar - netrw enhancement
Plug 'tpope/vim-vinegar'
" ALE - Asynchronous Lint Engine
Plug 'w0rp/ale'
" Grepper - Async Grep Tool
Plug 'mhinz/vim-grepper'
" Ansible-VIM - better support for Ansible YAML playbooks
Plug 'pearofducks/ansible-vim'
" PS1 - Powershell syntax
Plug 'PProvost/vim-ps1'
" Python PEP8 Indent - nicer Python indents
Plug 'Vimjas/vim-python-pep8-indent'
" indentLine - shows indention levels with 'set list' on
Plug 'yggdroot/indentline'
" BetterWhitespace - whitespace highlighting
Plug 'ntpeters/vim-better-whitespace'
" Scratch - scratch buffer
Plug 'sahensley/scratch.vim'
" Vimwiki - personal wiki
Plug 'vimwiki/vimwiki'
call plug#end()
" }}}

"Load different settings depending on OS
if has('win32') || has('win64')
    if has('gui_running')
        set guifont=Consolas:h12:cANSI
    endif
    "Set fileformat to DOS style
    set fileformat=dos
elseif has('unix')
    if has('gui_running')
        set guifont=Menlo\ Regular:h17
    endif
    set fileformat=unix
endif

" Directory creation {{{
" Turn on automatic backups and set path
" Check if backup dir exists, if not create
if !isdirectory($HOME . '/.vimhodgepodge/backups')
    silent! call mkdir($HOME . '/.vimhodgepodge/backups','p')
endif
set backupdir=$HOME/.vimhodgepodge/backups

" Check if tmp dir exists, if not create
if !isdirectory($HOME . '/.vimhodgepodge/tmp')
    silent! call mkdir($HOME . '/.vimhodgepodge/tmp','p')
endif
set directory=$HOME/.vimhodgepodge/tmp

" Check if view dir exists, if not create
if !isdirectory($HOME . '/.vimhodgepodge/view')
    silent! call mkdir($HOME . '/.vimhodgepodge/view','p')
endif
set viewdir=$HOME/.vimhodgepodge/view

" Check if view dir exists, if not create
if !isdirectory($HOME . '/.vimhodgepodge/session')
    silent! call mkdir($HOME . '/.vimhodgepodge/session','p')
endif
let g:sessiondir=$HOME . '/.vimhodgepodge/session'

" Check if wiki dir exists, if not create
if !isdirectory($HOME . '/.vimhodgepodge/wiki')
    silent! call mkdir($HOME . '/.vimhodgepodge/wiki','p')
endif

" Check if wiki_html dir exists, if not create
if !isdirectory($HOME . '/.vimhodgepodge/wiki_html')
    silent! call mkdir($HOME . '/.vimhodgepodge/wiki_html','p')
endif
" }}}

set encoding=utf-8              "force utf-8 encoding
set t_Co=256                    "256 color support
set laststatus=2                "never show the status line
set number                      "set line numbering
set relativenumber              "set relative line number
set cursorline                  "highlight current line
set backspace=indent,eol,start  "delete line breaks, auto ins and start of insert mode
set hlsearch                    "Switch on search pattern highlighting.
set cmdheight=1                 "Make command line two lines high
set mousehide                   "Hide the mouse when typing text
set showcmd                     "Show (partial) command in status line.
set showmatch                   "Show matching brackets.
set ignorecase                  "Do case insensitive matching
set smartcase                   "Do smart case matching
set incsearch                   "Incremental search
set hidden                      "Hide buffers when they are abandoned
set nowrap                      "Turn off line wrapping
set ruler                       "shows the line number on the bar
set undolevels=1000             "1000 undos
set autoindent                  "copies indention from previous line
set smartindent                 "automatically insert extra level on indent in some cases
set tabstop=4                   "tab stops character is four spaces
set shiftwidth=4                "when pressing << >> or ==, indent a tab that is four spaces in size
set expandtab                   "spaces for tabs
set mouse=n                     "Enable mouse only in normal mode
set nocompatible                "Turn off VI compatibility
set scrolloff=3                 "3 lines on top and bottom when scrolling
set sidescrolloff=3             "3 lines of buffer when side scrolling
set splitbelow                  "Split windows below current
set splitright                  "Split window to right
set listchars=tab:\|\ ,trail:-,extends:>,precedes:<,nbsp:+,eol:$ " when 'list on' is set
set linebreak                   "wrap whole word, 'list on' breaks this
set showbreak=»»»               "Character to show on wrapped lines
set foldmethod=indent           "Create folds at indents
set foldnestmax=5               "Don't go deeper than 5 nested indents
set cryptmethod=blowfish        "Set crypt method to blowfish.  Requires vim 7.3+
set clipboard=unnamed           "Copy contents into the system clipboard
"seoul256 (dark) range 233 (darkest) ~ 239 (lightest) default: 237
let g:seoul256_background=236
"seoul256 (light) range 252 (darkest) ~ 256 (lightest) default: 253
let g:seoul256_light_background=253
autocmd FileType * unlet! g:airline#extensions#whitespace#checks
autocmd FileType markdown let g:airline#extensions#whitespace#checks = [ 'indent' ]
autocmd FileType vimwiki let g:airline#extensions#whitespace#checks = [ 'indent' ]
filetype plugin indent on
syntax enable                   " Syntax highlighting
set background=light            " Use dark backgrounds. If using seoul256-light, set to light.
colorscheme seoul256-light      " Use seoul256-light. Change to seoul256 for a darker scheme.
set colorcolumn=81              " Highlight column 81
au VimResized * :wincmd =       " Auto resize split windows on parent resize
nmap <Space> <Leader>

" Load matchit.vim, but only if the user hasn't installed a newer version.
" From TPope's sensible.vim
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &runtimepath) ==# ''
  runtime! macros/matchit.vim
endif

" VimWiki plugin configuration {{{
let g:vimwiki_list = [{'path': '~/.vimhodgepodge/wiki',
            \ 'path_html': '~/.vimhodgepodge/wiki_html',
            \ 'syntax': 'markdown', 'ext': '.wiki'}]
let g:vimwiki_url_maxsave = 0
let g:vimwiki_conceallevel = 0
" }}}

" IndentLine plugin configuration {{{
let g:indentLine_setConceal=0
" }}}

" Airline plugin configuration {{{
" Don't use powerline patched fonts in airline
let g:airline_powerline_fonts = 0
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_extensions = ['branch']
" }}}

" ALE plugin configuration {{{
let g:ale_enabled = 0
let g:ale_sign_column_always = 1
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 0
let g:ale_lint_on_text_changed = 1
" }}}

" Turn on backups {{{
set backup
" When file is written, grab the current timestamp and use as the backup
" extension.  I.E. example.txt_1970-01-01.0000.bak
:au BufWritePre * let &backupext=strftime("_%Y-%m-%d.%H%M.bak")
" }}}

"GUI mode toolbar removal
if has('gui_running')
    :set guioptions-=T "remove toolbar
    :set guioptions-=L "remove left vertical scrollbar (appears on split)
    :set guioptions-=r "remove right-hand scroll bar
endif

"restore_view.vim saves views with these options
set viewoptions=cursor,folds,slash
set sessionoptions=buffers
"Do not save buffer options which breaks syntax highlighting on restore
set sessionoptions-=options

"######Keymappings######
" Easy navigation while in split mode
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Map j and k to only move one line on the screen when word wrapped
nnoremap j gj
nnoremap k gk

" Unmap Ex mode
nnoremap Q <Nop>

" Map the Function keys
" unmap F1
inoremap <F1> <Nop>
nnoremap <F1> <Nop>
vnoremap <F1> <Nop>
" Turn off highlighting
:nnoremap <F1> :nohlsearch<CR>
" Toggle paste mode
:nnoremap <F2> :set paste! paste?<CR>
" Toggle spell check
:nnoremap <F3> :set spell! spell?<CR>
" Toggle linting
:nnoremap <F4> :ALEToggle<CR>

" Quickly typing will exit Insert mode
:imap jj <Esc>

" ######Custom commands and modes######
" Write file even if it is read only.  SudoWrite.
command! SudoWrite write !sudo tee % > /dev/null
" Markdown to rtf.  Produces .rtf file in the same directory as original.
command! Md2rtf silent !pandoc --from markdown % --to rtf --output %:r.rtf --standalone
" Markdown to html.  Produces .html file in the same directory as original.
command! Md2html silent !pandoc -f markdown % -t html -o %:r.html -s
" Markdown to html in a Vertical split
command! Md2htmlVsp :call MarkdownToHTMLVSplit()

if !exists('g:pandoc_command')
    let g:pandoc_command = 'pandoc'
endif

function! MarkdownToHTMLVSplit()
    let markdownhtml = system(g:pandoc_command . " -f markdown  " . bufname("%") . " -t html")

    " Open a new split and set it up.
    vsplit __Markdown_HTML__
    normal! ggdG
    setlocal filetype=html
    setlocal buftype=nofile

    "Paste the HTML in the buffer
    call append(0, split(markdownhtml, '\v\n'))

endfunction

" ~/.vimrc end of form
