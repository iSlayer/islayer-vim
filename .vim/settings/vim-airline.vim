" Modeline and Notes {
" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell:
"
"                _
"        __   __(_)_ __ ___
"        \ \ / /| | '_ ` _ \
"         \ V / | | | | | | |
"          \_/  |_|_| |_| |_|
"
"   This is the personal vim-airline settings file of David Lester.
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

" statusline description {
" +-----------------------------------------------------------------------------+
" | A | B |                     C                            X | Y | Z |  [...] |
" +-----------------------------------------------------------------------------+
" 
" The statusline is the colored line at the bottom, which contains the sections
" (possibly in different colors):
" 
" section  meaning (example)~
" --------------------------
"   A      displays the mode + additional flags like crypt/spell/paste (INSERT)
"   B      VCS information (branch, hunk summary) (master)
"   C      filename + read-only flag (~/.vim/vimrc RO)
"   X      filetype  (vim)
"   Y      file encoding[fileformat] (utf-8[unix])
"   Z      current position in the file
"            percentage % ☰ current line/number of lines ln : column
"            So this: 10% ☰ 10/100 ln : 20   means: >
"               10%     - 10 percent
"               ☰ 10    - current line 10
"               /100 ln - of 100 lines
"               : 20    - current column 20
"   [...]  additional sections (warning/errors/statistics)
"          from external plugins (e.g. YCM/syntastic/...)
" }

" vim-airline {
    if count(g:bundle_groups, 'general')
        if !exists('g:airline_symbols')
          let g:airline_symbols = {}
        endif

        " Theme {
        let g:airline_theme = 'onedark' " 'dark'
        " }
        
        " Airline {

        let g:airline_mode_map = {
            \ '__' : '-',
            \ 'n'  : 'N',
            \ 'i'  : 'I',
            \ 'R'  : 'R',
            \ 'c'  : 'C',
            \ 'v'  : 'V',
            \ 'V'  : 'V',
            \ '' : 'V',
            \ 's'  : 'S',
            \ 'S'  : 'S',
            \ '' : 'S',
            \ 't'  : 'T',
            \ }

        let g:airline_right_sep = ''
        let g:airline_right_alt_sep = '|'

        let g:airline_left_sep = ''
        let g:airline_left_alt_sep = '|'
        
        let g:airline_symbols.linenr = ''
        let g:airline_symbols.spell = 'Ꞩ'
        let g:airline_symbols.whitespace = ''
        let g:airline_symbols.crypt = '🔒'

        " Tabline seperators
        let g:airline#extensions#tabline#left_sep = ''
        let g:airline#extensions#tabline#left_alt_sep = ''
        let g:airline#extensions#tabline#right_sep = ''
        let g:airline#extensions#tabline#right_alt_sep = ''

        " }

        " Tabline {
        " Enable/disable Tabline integration
        let g:airline#extensions#tabline#enabled = 1

        " enable/disable displaying buffers with a single tab.
        let g:airline#extensions#tabline#show_buffers = 0

        " configure whether buffer numbers should be shown.
        let g:airline#extensions#tabline#buffer_nr_show = 1

        let g:airline#extensions#tabline#formatter = 'unique_tail'
        let g:airline#extensions#tabline#show_tabs = 1
        " enable/disable displaying tab number in tabs mode.
        let g:airline#extensions#tabline#show_tab_nr = 0

        " configure whether close button should be shown
        let g:airline#extensions#tabline#show_close_button = 0

        " Hides the fugitive //**// part of the buffer names to only file
        let g:airline#extensions#fugitiveline#enabled = 1
        
        " enable/disable displaying index of the buffer.
        " When enabled, numbers will be displayed in the tabline and mappings will be
        " exposed to allow you to select a buffer directly.  Up to 9 mappings will be
        " exposed.
        let g:airline#extensions#tabline#buffer_idx_mode = 1
        nmap <leader>1 <Plug>AirlineSelectTab1
        nmap <leader>2 <Plug>AirlineSelectTab2
        nmap <leader>3 <Plug>AirlineSelectTab3
        nmap <leader>4 <Plug>AirlineSelectTab4
        nmap <leader>5 <Plug>AirlineSelectTab5
        nmap <leader>6 <Plug>AirlineSelectTab6
        nmap <leader>7 <Plug>AirlineSelectTab7
        nmap <leader>8 <Plug>AirlineSelectTab8
        nmap <leader>9 <Plug>AirlineSelectTab9
        nmap <leader>- <Plug>AirlineSelectPrevTab
        nmap <leader>+ <Plug>AirlineSelectNextTab
        " }
        
        " Branch {
        let g:airline#extensions#branch#enabled = 1
        " truncate long branch names to a fixed length
        let g:airline#extensions#branch#displayed_head_limit = 10
        " change the text for when no branch is detected
        let g:airline#extensions#branch#empty_message = ''
        " to truncate all path sections but the last one, e.g. a branch
        let g:airline#extensions#branch#format = 1
        " }

        " Bufferline {
        " enable/disable bufferline integration
        let g:airline#extensions#bufferline#enabled = 0
        " }

    endif 
" }
