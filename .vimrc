" Modeline and Notes {
" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker nospell:
"
"                _
"        __   __(_)_ __ ___
"        \ \ / /| | '_ ` _ \
"         \ V / | | | | | | |
"          \_/  |_|_| |_| |_|
"
"
"   This is the personal .vimrc file of David Lester.
"   While much of it is beneficial for general use, I would
"   recommend picking out the parts you want and understand.
"
"   You can find me at http://github.com/islayer
"
"   Copyright 2018 David Lester
"
"   Licensed under the Apache License, Version 2.0 (the "License");
"   you may not use this file except in compliance with the License.
"   You may obtain a copy of the License at
"
"       http://www.apache.org/licenses/LICENSE-2.0
"
"   Unless required by applicable law or agreed to in writing, software
"   distributed under the License is distributed on an "AS IS" BASIS,
"   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
"   See the License for the specific language governing permissions and
"   limitations under the License.
" }

" Environment {

    " Identify platform {
        silent function! OSX()
            return has('macunix')
        endfunction
        silent function! LINUX()
            return has('unix') && !has('macunix') && !has('win32unix')
        endfunction
        silent function! WINDOWS()
            return  (has('win32') || has('win64'))
        endfunction
    " }

    " Basics {
        set nocompatible        " Must be first line
        if !WINDOWS()
            set shell=/bin/sh
        endif
    " }

    " Windows Compatible {
        " On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
        " across (heterogeneous) systems easier.
        if WINDOWS()
          set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
        endif
    " }

    " Arrow Key Fix {
        if &term[:4] == "xterm" || &term[:5] == 'screen' || &term[:3] == 'rxvt'
            inoremap <silent> <C-[>OC <RIGHT>
        endif
    " }

" }

" Use Bundles config {
    if filereadable(expand("~/.vimrc.bundles"))
        source ~/.vimrc.bundles
    endif
" }

" General {

    set background=dark         " Assume a dark background

    filetype plugin indent on   " Automatically detect file types.
    syntax on                   " Syntax highlighting
    set mouse=a                 " Automatically enable mouse usage
    set mousehide               " Hide the mouse cursor while typing
    scriptencoding utf-8        " Encoding scheme to use

    " Always switch to the current file directory
    autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif

    set viewoptions=folds,options,cursor,unix,slash " Better unix/win compat
    set virtualedit=onemore     " Allow for cursor beyond last character
    set history=1000            " Store a ton of history (default is 20)
    set nospell                   " Spell checking on
    set hidden                  " Allow buffer switching without saving
    set autoread                " Reload files changed outside vim

    " Instead of reverting the cursor to the last position in the buffer, we
    " set it to the first line when editing a git commit message
    au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

    " http://vim.wikia.com/wiki/Restore_cursor_to_file_position_in_previous_editing_session
    " Restore cursor to file position in previous editing session
    function! ResCur()
        if line("'\"") <= line("$")
            silent! normal! g`"
            return 1
        endif
    endfunction

    augroup resCur
        autocmd!
        autocmd BufWinEnter * call ResCur()
    augroup END

    " Turn off swap files
    set noswapfile
    set nobackup
    set nowb

" }

" Vim UI {

    colorscheme onedark " default

    set tabpagemax=15               " Only show 15 tabs
    set showmode                    " Display the current mode
    set cursorline                  " Highlight current line

    highlight clear SignColumn      " SignColumn should match background
    highlight clear LineNr          " Current line number row will have same background color in relative mode
    "highlight clear CursorLineNr    " Remove highlight color from current line number

    if has('cmdline_info')
        set ruler                   " Show the ruler
        set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
        set showcmd                 " Show partial commands in status line and
    endif

    "" Statusline modifications, added Fugitive Status Line & Syntastic Error Message {
    "let g:last_mode = ''
    "function! Mode()
    "    let l:mode = mode()

    "    if l:mode !=# g:last_mode
    "        let g:last_mode = l:mode

    "        hi User2 guifg=#005f00 guibg=#dfff00 gui=BOLD ctermfg=22 ctermbg=190 cterm=BOLD
    "        hi User3 guifg=#FFFFFF guibg=#414243 ctermfg=255 ctermbg=241
    "        hi User4 guifg=#414234 guibg=#2B2B2B ctermfg=241 ctermbg=234
    "        hi User5 guifg=#4e4e4e guibg=#FFFFFF gui=bold ctermfg=239 ctermbg=255 cterm=bold
    "        hi User6 guifg=#FFFFFF guibg=#8a8a8a ctermfg=255 ctermbg=245
    "        hi User7 guifg=#ffff00 guibg=#8a8a8a gui=bold ctermfg=226 ctermbg=245 cterm=bold
    "        hi User8 guifg=#8a8a8a guibg=#414243 ctermfg=245 ctermbg=241

    "        if l:mode ==# 'n'
    "          hi User3 guifg=#dfff00 ctermfg=190
    "        elseif l:mode ==# "i"
    "          hi User2 guifg=#005fff guibg=#FFFFFF ctermfg=27 ctermbg=255
    "          hi User3 guifg=#FFFFFF ctermfg=255
    "        elseif l:mode ==# "R"
    "          hi User2 guifg=#FFFFFF guibg=#df0000 ctermfg=255 ctermbg=160
    "          hi User3 guifg=#df0000 ctermfg=160
    "        elseif l:mode ==? "v" || l:mode ==# ""
    "          hi User2 guifg=#4e4e4e guibg=#ffaf00 ctermfg=239 ctermbg=214
    "          hi User3 guifg=#ffaf00 ctermfg=214
    "        endif
    "    endif

    "    if l:mode ==# "n"
    "      return "  NORMAL "
    "    elseif l:mode ==# "i"
    "      return "  INSERT "
    "    elseif l:mode ==# "R"
    "      return "  REPLACE "
    "    elseif l:mode ==# "v"
    "      return "  VISUAL "
    "    elseif l:mode ==# "V"
    "      return "  V·LINE "
    "    elseif l:mode ==# ""
    "      return "  V·BLOCK "
    "    else
    "      return l:mode
    "    endif
    "endfunction

    "set statusline=%2*%{Mode()}%3*⮀%1*
    "set statusline+=%#StatusLine#
    "set statusline+=%{strlen(fugitive#statusline())>0?'\ ⭠\ ':''}
    "set statusline+=%{matchstr(fugitive#statusline(),'(\\zs.*\\ze)')}
    "set statusline+=%{strlen(fugitive#statusline())>0?'\ \ ⮁\ ':'\ '}
    "set statusline+=%f\ %{&ro?'⭤':''}%{&mod?'+':''}%<
    "set statusline+=%4*⮀
    "set statusline+=%#warningmsg#
    "set statusline+=%{SyntasticStatuslineFlag()}
    "set statusline+=%=
    "set statusline+=%4*⮂
    "set statusline+=%#StatusLine#
    "set statusline+=\ %{strlen(&fileformat)>0?&fileformat.'\ ⮃\ ':''}
    "set statusline+=%{strlen(&fileencoding)>0?&fileencoding.'\ ⮃\ ':''}
    "set statusline+=%{strlen(&filetype)>0?&filetype:''}
    "set statusline+=\ %8*⮂
    "set statusline+=%7*\ %p%%\
    "set statusline+=%6*⮂%5*⭡\ \ %l:%c\
    " }

    "if isdirectory("~/.vim/bundle/vim-airline") {
    ""    if has('statusline')
    ""        set laststatus=2

    ""        " Broken down into easily includeable segments
    ""        set statusline=%<%f\                     " Filename
    ""        set statusline+=%w%h%m%r                 " Options
    ""        "set statusline+=%{fugitive#statusline()} " Git Hotness
    ""        set statusline+=\ [%{&ff}/%Y]            " Filetype
    ""        set statusline+=\ [%{getcwd()}]          " Current dir
    ""        set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
    ""    endif
    ""endif
    " }

    set colorcolumn=80,100          " Set color column at length 80 & 100
    set backspace=indent,eol,start  " Backspace for dummies
    set linespace=0                 " No extra spaces between rows
    set number                      " Line numbers on
    set noerrorbells                " Disable sound
    set showmatch                   " Show matching brackets/parenthesis
    set incsearch                   " Find as you type search
    set hlsearch                    " Highlight search terms
    set ignorecase                  " Case insensitive search
    set smartcase                   " Case sensitive when uc present
    set smarttab                    " Best tab indent
    set smartindent                 " Set tab standard smart
    set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
    set scrolljump=5                " Lines to scroll when cursor leaves screen
    "set scrolloff=10                " Minimum lines to keep above and below cursor
    set foldenable                  " Auto fold code
    set nolist
    "set listchars=tab:\|\           " Highlight problematic whitespace

    set undodir=~/.vim/undodir
    set undofile

    set wildmenu                    " Show list instead of just completing
    set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
    set wildignore=*.o,*.obj,*~     " Stuff to ignore when tab completing
    set wildignore+=*sass-cache*
    set wildignore+=*DS_Store*

" }

" Formatting {

    set nowrap                      " Do not wrap long lines
    set autoindent                  " Indent at the same level of the previous line
    set shiftwidth=4                " Use indents of 4 spaces
    set expandtab                   " Tabs are spaces, not tabs
    set tabstop=4                   " An indentation every four columns
    set softtabstop=4               " Let backspace delete indent
    set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
    set splitright                  " Puts new vsplit windows to the right of the current
    set splitbelow                  " Puts new split windows to the bottom of the current
    set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)

    " Remove trailing whitespaces and ^M chars
    " autocmd FileType c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl,sql autocmd BufWritePre <buffer> call StripTrailingWhitespace()
    " autocmd BufNewFile,BufRead *.html.twig set filetype=html.twig
    autocmd FileType haskell,puppet,ruby,yml,yaml setlocal expandtab shiftwidth=2 softtabstop=2
    " autocmd BufWritePre *.py execute ':Black'
    " autocmd BufNewFile,BufRead *.coffee set filetype=coffee

    " Call Flake8 after saving python scripts
    " autocmd BufWritePost *.py :call Flake8()

" }

" Key (re)Mappings {

    " The default leader is '\', many people prefer ',' as it's in a standard
    let mapleader = ','

    " Remap the <Esc> key for easier finger position to exit insert mode
    imap jj <Esc>

    " Easier moving in tabs and windows
    map <C-j> <C-w>j
    map <C-k> <C-w>k
    map <C-l> <C-w>l
    map <C-h> <C-w>h

    " Remap to bring up list of tags
    map <C-]> g<C-]>

    " Code folding options
    nmap <leader>f0 :set foldlevel=0<CR>
    nmap <leader>f1 :set foldlevel=1<CR>
    nmap <leader>f2 :set foldlevel=2<CR>
    nmap <leader>f3 :set foldlevel=3<CR>
    nmap <leader>f4 :set foldlevel=4<CR>
    nmap <leader>f5 :set foldlevel=5<CR>
    nmap <leader>f6 :set foldlevel=6<CR>
    nmap <leader>f7 :set foldlevel=7<CR>
    nmap <leader>f8 :set foldlevel=8<CR>
    nmap <leader>f9 :set foldlevel=9<CR>

    " Adjust viewports to the same size
    map <Leader>= <C-w>=

    " Map <Leader>ff to display all lines with keyword under cursor
    " and ask which one to jump to
    nmap <Leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

" }

" Plugins {

    " Ctags {
        set tags=./tags;/,~/.vimtags

        " Make tags placed in .git/tags file available in all levels of a repository
        let gitroot = substitute(system('git rev-parse --show-toplevel'), '[\n\r]', '', 'g')
        if gitroot != ''
            let &tags = &tags . ',' . gitroot . '/.git/tags'
        endif
    " }

    " JSON {
        nmap <leader>jt <Esc>:%!python -m json.tool<CR><Esc>:set filetype=json<CR>
        let g:vim_json_syntax_conceal = 0
    " }

" }

" GUI Settings {

    " GVIM- (here instead of .gvimrc)
    if has('gui_running')
        set guioptions-=T           " Remove the toolbar
        set lines=53                " 53 lines of text instead of 24
        set columns=104             " 104 columns of text
        if LINUX() && has("gui_running")
            set guifont=Andale\ Mono\ Regular\ 12,Menlo\ Regular\ 11,Consolas\ Regular\ 12,Courier\ New\ Regular\ 14
        elseif OSX() && has("gui_running")
            set guifont=Andale\ Mono\ Regular:h12,Menlo\ Regular:h11,Consolas\ Regular:h12,Courier\ New\ Regular:h14
        elseif WINDOWS() && has("gui_running")
            set guifont=Andale_Mono:h10,Menlo:h10,Consolas:h10,Courier_New:h10
        endif
    else
        if &term == 'xterm' || &term == 'screen'
            set t_Co=256            " Enable 256 colors to stop the CSApprox warning and make xterm vim shine
        endif
    endif

" }

" Functions {

    " Initialize directories {
    function! InitializeDirectories()
        let parent = $HOME
        let prefix = 'vim'
        let dir_list = {
                    \ 'backup': 'backupdir',
                    \ 'views': 'viewdir',
                    \ 'swap': 'directory' }

        if has('persistent_undo')
            let dir_list['undo'] = 'undodir'
        endif

        " To specify a different directory in which to place the vimbackup,
        " vimviews, vimundo, and vimswap files/directories
        let common_dir = parent . '/.' . prefix

        for [dirname, settingname] in items(dir_list)
            let directory = common_dir . dirname . '/'
            if exists("*mkdir")
                if !isdirectory(directory)
                    call mkdir(directory)
                endif
            endif
            if !isdirectory(directory)
                echo "Warning: Unable to create backup directory: " . directory
                echo "Try: mkdir -p " . directory
            else
                let directory = substitute(directory, " ", "\\\\ ", "g")
                exec "set " . settingname . "=" . directory
            endif
        endfor
    endfunction
    call InitializeDirectories()
    " }

    " Initialize NERDTree as needed {
    function! NERDTreeInitAsNeeded()
        redir => bufoutput
        buffers!
        redir END
        let idx = stridx(bufoutput, "NERD_tree")
        if idx > -1
            NERDTreeMirror
            NERDTreeFind
            wincmd l
        endif
    endfunction
    " }

    " Strip whitespace {
    function! StripTrailingWhitespace()
        " Preparation: save last search, and cursor position.
        let _s=@/
        let l = line(".")
        let c = col(".")
        " do the business:
        %s/\s\+$//e
        " clean up: restore previous search history, and cursor position
        let @/=_s
        call cursor(l, c)
    endfunction
    " }

    " Shell command {
    function! s:RunShellCommand(cmdline)
        botright new

        setlocal buftype=nofile
        setlocal bufhidden=delete
        setlocal nobuflisted
        setlocal noswapfile
        setlocal nowrap
        setlocal filetype=shell
        setlocal syntax=shell

        call setline(1, a:cmdline)
        call setline(2, substitute(a:cmdline, '.', '=', 'g'))
        execute 'silent $read !' . escape(a:cmdline, '%#')
        setlocal nomodifiable
        1
    endfunction

    command! -complete=file -nargs=+ Shell call s:RunShellCommand(<q-args>)
    " e.g. Grep current file for <search_term>: Shell grep -Hn <search_term> %
    " }

    " Expand Filename and execute {
    function! s:ExpandFilenameAndExecute(command, file)
        execute a:command . " " . expand(a:file, ":p")
    endfunction
    " }

" }

" Use local vimrc if available {
    if filereadable(expand("~/.vimrc.local"))
        source ~/.vimrc.local
    endif
" }

" Use local gvimrc if available and gui is running {
    if has('gui_running')
        if filereadable(expand("~/.gvimrc.local"))
            source ~/.gvimrc.local
        endif
    endif
" }

" Source plugin settings {
    if filereadable(expand("~/.vim/settings.vim"))
        source ~/.vim/settings.vim
    endif
" }
