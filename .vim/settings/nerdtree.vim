" Modeline and Notes {
" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell:
"
"                _
"        __   __(_)_ __ ___
"        \ \ / /| | '_ ` _ \
"         \ V / | | | | | | |
"          \_/  |_|_| |_| |_|
"
"   This is the personal nerdtree settings file of David Lester.
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

" nerdtree {
    if isdirectory(expand("~/.vim/bundle/nerdtree"))
        " Disable warnings from NERDCommenter
        let g:NERDShutUp = 1
        map <C-e> <plug>NERDTreeTabsToggle<CR>
        map <leader>e :NERDTreeFind<CR>
        nmap <leader>nt :NERDTreeFind<CR>
        nnoremap <silent> <leader>nt :NERDTreeToggle<CR>

        " Use natural sort 
        let NERDTreeNaturalSort = 1
        " Show bookmarks in window
        let NERDTreeShowBookmarks = 1
        " Ignore file types in NERDTree window
        let NERDTreeIgnore = ['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
        " NERDTree does not change the cwd
        let NERDTreeChDirMode = 0
        " Close NERDTree after opening a file
        let NERDTreeQuitOnOpen = 1
        " Single click will open directory, double for file nodes
        let NERDTreeMouseMode = 2
        " Show hidden files
        let NERDTreeShowHidden = 1
        let NERDTreeHighlightCursorline = 0
        let NERDTreeShowLineNumbers = 1
    endif
" }
