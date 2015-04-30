set nocompatible
" Vundle and Bundles {{{
filetype off
set rtp+=~/.vim/bundle/vundle/
set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim
call vundle#rc()
Plugin 'gmarik/vundle'
" autocomplete
Plugin 'Valloric/YouCompleteMe'
Plugin 'marijnh/tern_for_vim'
" syntax
Plugin 'scrooloose/syntastic'
Plugin 'hdima/python-syntax'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'vim-scripts/JavaScript-Indent'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'groenewege/vim-less'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
" source control
Plugin 'tpope/vim-fugitive'
" file navigation
Plugin 'kien/ctrlp.vim'
Plugin 'jasoncodes/ctrlp-modified.vim'
Plugin 'sgur/ctrlp-extensions.vim'
" Plugin 'FelikZ/ctrlp-py-matcher'
" general editing
Plugin 'pluginbackup.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-repeat'
Plugin 'edsono/vim-matchit'
Plugin 'Gundo'
Plugin 'rbgrouleff/bclose.vim'
Plugin 'xolox/vim-session'
Plugin 'rking/ag.vim'
Plugin 'yegappan/greplace'
Plugin 'aperezdc/vim-template'
Plugin 'airblade/vim-gitgutter'
Plugin 'tmhedberg/SimpylFold'
Plugin 'scrooloose/nerdcommenter'
" Plugin 'svermeulen/vim-easyclip'

" snippet
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'matthewsimo/angular-vim-snippets'
" python
Plugin 'klen/rope-vim'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'lambdalisue/vim-django-support'
" html
Plugin 'mattn/emmet-vim'
Plugin 'othree/html5.vim'
" javascript
Plugin 'maksimr/vim-jsbeautify'
Plugin 'claco/jasmine.vim'
" Plugin 'lepture/vim-jinja'
" colors
Plugin 'godlygeek/csapprox'
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-scripts/ScrollColors'
Plugin 'vim-scripts/colorsupport.vim'
Plugin 'https://github.com/gorodinskiy/vim-coloresque.git'
" Restructured Text
" Plugin 'Rykka/clickable.vim'
" Plugin 'Rykka/riv.vim'
Plugin 'nvie/vim_bridge'
Plugin 'nvie/vim-rst-tables'
" tasks
Plugin 'aaronbieber/quicktask'
" }}}
" General Options {{{
filetype on
filetype plugin on
filetype plugin indent on
set hidden
set nu
set nolist
set autowrite
set autoread
set showmode
set wrap
set tabstop=4
set shiftwidth=4
set expandtab
set autoread
set shiftround
set ignorecase
set smartcase   "case sensitive if the search term contains any uppercase letters
set hlsearch
set shortmess=aOstT
set scrolloff=4
set magic "Set magic on for regular expressions"
set backspace=indent,eol,start
set autoindent
set copyindent
set noswapfile " using backup plugin
set smarttab
set gdefault " search/replace globally (on a line) by default"
set mouse=
set splitbelow
set splitright
set updatetime=1000
set formatoptions=tcrql
set completeopt=menuone,longest,preview
let python_highlight_all=1
let python_version_2=1
let g:bzr_highlight_diff = 1  " allows diff in bzr ci files to be colored correctly
set tags=./tags; " semicolon means traverse upwards from the current directory until tags is found
let g:easytags_dynamic_files = 2
let g:easytags_suppress_report = 1
let g:easytags_events = ['BufWritePost']
let g:easytags_autorecurse = 0
:autocmd FileType python let b:easytags_auto_highlight = 1
" }}}
" Key Mappings {{{

nnoremap <F2> :bw<CR>
nnoremap <S-F2> :Bclose<CR>
nnoremap <F3> :bp<CR>
" nnoremap <S-F3> :cn<CR>
nnoremap <F4> :bn<CR>
" nnoremap <S-F4> :cp<CR>
" F5 to launch the file per filetype
nnoremap <F6> <C-W>w
nnoremap <S-F6> <C-W>W
" F7 add breakpoint & S F7 remove breakpoint
" F8 filetype formatting, PEP8 for python, htmltidy, csstidy
" autocmd FileType python map <buffer> <F8> :call Pep8()<CR>
nnoremap <F9> :set rnu!<CR>
nnoremap <S-F9> :set nu!<CR>
set pastetoggle=<F10>
nnoremap <S-F10> :set nohls!<CR>
map <silent>  <F11> :windo set scb!<CR>

imap <S-CR> esc o<CR>
" swap two arguments in a method or function def x(arg1, arg2)
nnoremap <C-S-k> "xywww"ydw"xPbbbdw"yPb[
" save a file as sudoer
cmap w!! %!sudo tee > /dev/null %

" keep selection on indenting in visual mode
vmap > :><cr>gv
vmap < :<<cr>gv

" Keep cursor centered while scrolling
map <C-J> <C-e>j
map <C-K> <C-y>k
"}}}
" Leader Customizations {{{
" change the mapleader from \ to ,
let mapleader=","

inoremap <silent> <leader>s <ESC>:wa<CR>
nnoremap <silent> <leader>s :wa<CR>
vnoremap <silent> <leader>s :wa<CR>
" put ==== under the current line
nnoremap <leader>= yypVr=
" put ---  under the current line
nnoremap <leader>- yypVr-
" put ***  under the current line
nnoremap <leader>* yypVr*
map <leader>a :Ag!<space>
map <leader>A :Ag! <C-R><C-W><CR>
" <leader> b is mapped to FuzzyFinder buffer search
" nnoremap <Leader>b :Unite buffer<CR>
nnoremap <Leader>b :CtrlPBuffer<CR>
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
" <leader> f is mapped to FuzzyFinder file search
nnoremap <Leader>f :CtrlP<CR>
" Pull word under cursor into LHS of a substitute (for quick search and" replace)
" nnoremap <Leader>s :%s/\<<C-r><C-w>\>/
" <leader> t is mapped to QuickTask
nnoremap <Leader>t :CtrlPTag<CR>
nnoremap <leader>u :GundoToggle<CR>
" <leader> v is the prefix for VCSCommands
nnoremap <leader>w <C-w>v<C-w>l
" add a ; at the end of the line w/o leaving insert mode
inoremap <leader>; <C-o>A;

nmap <Leader>h :call <SID>SynStack()<CR>

function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

nmap <leader>c :CloseSession<CR>
nmap <leader>o :OpenSession<space>

" Yank to and paste from the OS clipboard with ,y and ,p
set clipboard=unnamed
nmap <leader>y "+y
nmap <leader>Y "+yy
nmap <leader>p "+p
nmap <leader>P "+P
"}}}
" Colors and GUI {{{
set t_Co=256
let g:rehash256 = 1
let colorsupport_cube_name='konsole'
:autocmd ColorScheme * highlight ExtraWhitespace ctermbg=darkgreen
set background=dark
colorscheme ir_black "inkpot desert256 candy oceanblack256 synic northland neverness lettuce inkpot elflord fruity vividchalk vibrantink wombat256 torte tir_black tolerable tango rootwater rdark oceanblack256 no_quarter night neverness molokai delek colorer 256asuldark xoria256
set guioptions-=T
set ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids"
set showcmd
set title
set modeline
" set cursorline
" set colorcolumn=80
"}}}
" Whitespace {{{

" this section needs to be after the Colors and GUI section
:match ExtraWhitespace /\s\+$/

function! TrimWhiteSpace()
  %s/\s*$//
  ''
:endfunction

autocmd FileWritePre * :call TrimWhiteSpace()
autocmd FileAppendPre * :call TrimWhiteSpace()
autocmd FilterWritePre * :call TrimWhiteSpace()
autocmd BufWritePre * :call TrimWhiteSpace()"}}}
" Abbreviations"{{{
:iab <expr> dts strftime("%a %b %d %Y")
:abbr hte the
:abbr teh the
:abbr adn and
:abbr requeset request "}}}
" Searching and Brace Matching {{{
set showmatch
set mat=2 "How many tenths of a second to show brace match
set incsearch
set gdefault                    " the /g flag on :s substitutions by default"

" for regex handling:
nnoremap / /\v
vnoremap / /\v

function! VisualSearch(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

"  In visual mode when you press * or # to search for the current selection
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>
" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSearch('gv')<CR>"}}}
" Jump to last position when opening a file {{{
if has("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
"}}}
" FileTypes {{{
au BufNewFile,BufRead *.zcml setfiletype xml
au BufNewFile,BufRead *.wsgi setfiletype python
au BufNewFile,BufRead *.pyx setfiletype cython
au BufNewFile,BufRead *.qml setfiletype qml
" HTML (tab width 2 chr, no wrapping)
autocmd FileType html set sw=2
autocmd FileType html set ts=2
autocmd FileType html set sts=2
autocmd FileType html set textwidth=0
" XHTML (tab width 2 chr, no wrapping)
autocmd FileType xhtml set sw=2
autocmd FileType xhtml set ts=2
autocmd FileType xhtml set sts=2
autocmd FileType xhtml set textwidth=0
" CSS (tab width 2 chr, wrap at 79th char)
autocmd FileType css set sw=2
autocmd FileType css set ts=2
autocmd FileType css set sts=2
autocmd FileType css set textwidth=79
" JavaScript (tab width 2 chr, wrap at 79th)
autocmd FileType javascript set sw=2
autocmd FileType javascript set ts=2
autocmd FileType javascript set sts=2
autocmd FileType javascript set textwidth=79

au FileType html set foldmethod=indent
au FileType python set foldmethod=indent
au FileType python set foldlevel=99

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd filetype css setlocal equalprg=csstidy\ -\ --silent=true\ --sort_properties=true
autocmd filetype html setlocal equalprg=tidy\ -\ --quiet\ true\ --indent\ true\ --indent-spaces\ 2\ --markup\ true

autocmd FileType python map <F5> :RunPyBuffer<CR>
autocmd FileType html map <F5> :! firefox %<CR>

" reload vimrc when it is saved w/o duplicating autocommands
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }
"}}}
" Language {{{
syntax on
" Preview window for python
fu! DoRunPyBuffer2()
pclose! " force preview window closed
setlocal ft=python

" copy the buffer into a new window, then run that buffer through python
sil %y a | below new | sil put a | sil %!python -
" indicate the output window as the current previewwindow
setlocal previewwindow ro nomodifiable nomodified

" back into the original window
winc p
endfu

command! RunPyBuffer call DoRunPyBuffer2()
python << EOF
import vim
def SetBreakpoint():
    import re
    nLine = int( vim.eval( 'line(".")'))

    strLine = vim.current.line
    strWhite = re.search( '^(\s*)', strLine).group(1)

    vim.current.buffer.append(
       "%(space)spdb.set_trace() %(mark)s Breakpoint %(mark)s" %
         {'space':strWhite, 'mark': '#' * 30}, nLine - 1)

    for strLine in vim.current.buffer:
        if strLine == "import pdb":
            break
    else:
        vim.current.buffer.append( 'import pdb', 0)
        vim.command( 'normal j1')

vim.command( 'map <f7> :py SetBreakpoint()<cr>')

def RemoveBreakpoints():
    import re

    nCurrentLine = int( vim.eval( 'line(".")'))

    nLines = []
    nLine = 1
    for strLine in vim.current.buffer:
        if strLine == "import pdb" or strLine.lstrip()[:15] == "pdb.set_trace()":
            nLines.append( nLine)
        nLine += 1

    nLines.reverse()

    for nLine in nLines:
        vim.command( "normal %dG" % nLine)
        vim.command( "normal dd")
        if nLine < nCurrentLine:
            nCurrentLine -= 1

    vim.command( "normal %dG" % nCurrentLine)

vim.command( "map <s-f7> :py RemoveBreakpoints()<cr>")
EOF

"}}}
" HTML Section {{{
" }}}
" JavaScript section {{{
au! BufRead,BufNewFile *.html set filetype=htmldjango.javascript_tern
" au FileType javascript call JavaScriptFold()
au FileType javascript setl fen
au FileType javascript setl nocindent
au FileType javascript setl autoindent

au FileType javascript imap <c-t> AJS.log();<esc>hi
au FileType javascript imap <c-a> alert();<esc>hi

au FileType javascript inoremap <buffer> $r return
au FileType javascript inoremap <buffer> $f //--- PH ----------------------------------------------<esc>FP2xi

let g:used_javascript_libs = 'underscore,angularjs'
"}}}
" Json section {{{
au! BufRead,BufNewFile *.json set filetype=json

augroup json_autocmd
  autocmd!
  autocmd FileType json set autoindent
  autocmd FileType json set formatoptions=tcq2l
  autocmd FileType json set textwidth=78 shiftwidth=2
  autocmd FileType json set softtabstop=2 tabstop=2
  autocmd FileType json set expandtab
  autocmd FileType json set foldmethod=syntax
augroup END
" }}}
" Buffers and Files {{{
set wildmenu
set wildignore=*.bzr,*.pyc,*.swp,*.bak,*/.backup/*
set wildmode=list:longest,full
"}}}
" Statusline {{{
set laststatus=2
set noshowmode
" }}}
" Plugins section
" YCM {{{
let g:ycm_autoclose_preview_window_after_completion=1
nnoremap <leader>d :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]
" }}}
" CtrlP {{{
let g:ctrlp_open_new_file = 'r'
" \ 'dir':  '\v[\/]\.(git|hg|svn),bower_components$',
let g:ctrlp_custom_ignore = {
  \ 'dir': 'dist\|components\|node_modules\|.DS_Store$\|.git$\|.svn$\|bower_components$',
  \ 'file': '\v\.(exe|so|dll|pyc)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_lazy_update = 350
" let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_max_files = 0
if executable("ag")
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --ignore ''.git'' --ignore ''.DS_Store'' --ignore ''node_modules'' --hidden -g ""'
endif
map <Leader>m :CtrlPModified<CR>
map <Leader>M :CtrlPBranch<CR>
" }}}
" NerdCommenter"{{{
map ,, <plug>NERDCommenterInvert
let NERDSpaceDelims=1"}}}
" UltiSnips {{{
set runtimepath+=~/.vim/bundle/ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
let g:UltiSnipsEditSplit="vertical"
" docstring style: doxygen, sphinx or google
let g:ultisnips_python_style='sphinx'
" }}}
" Backup {{{
let g:backup_purge = 15
let g:backup_directory = '.backup'
"}}}
" Session {{{
let g:session_autoload = 'no'
let g:session_autosave = 'yes'
" }}}
"  Powerline {{{
let g:Powerline_symbols = 'unicode'
set encoding=utf-8
"  }}}
" RopeVim {{{
let ropevim_local_prefix="<leader>r"
let ropevim_guess_project=1
" }}}
" Syntastic {{{
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_auto_jump=1
let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
let g:syntastic_javascript_jshint_exec='/usr/local/bin/jshint'
let g:syntastic_javascript_checkers = ['jshint']
" }}}
" Fugitive {{{
autocmd BufReadPost fugitive://* set bufhidden=delete
noremap <silent> ,gb :Gblame<CR>
noremap <silent> ,gc :Gcommit<CR>
noremap <silent> ,gd :Gdiff<CR>
noremap <silent> ,ge :Gedit<CR>
noremap <silent> ,gm :Gmove<CR>
noremap <silent> ,gr :Gread<CR>
noremap <silent> ,gs :Gstatus<CR>
noremap <silent> ,gw :Gwrite<CR>
noremap <silent> ,gx :Gremove<CR>
noremap <silent> ,gg :Ggrep<CR>
noremap <silent> ,gl :Glog<CR>
" "}}}
" Emmet {{{
let g:user_emmet_leader_key = '<c-y>'
let g:user_emmet_removetag_key = '<c-r>'
let g:user_emmet_splitjointag_key = '<c-t>'
" }}}
" Ag {{{
let g:ag_prg="ag --column"
" }}}
" Python syntax {{{
let python_highlight_all = 1
" }}}
" VIM-Templates {{{
let g:username='Danny Tamez'
let g:email='zematynnad@gmail.com'
" }}}
map <F12> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
"  vim: fdm=marker
