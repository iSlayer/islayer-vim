" Modeline and Notes {
" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell:
"
"                _
"        __   __(_)_ __ ___
"        \ \ / /| | '_ ` _ \
"         \ V / | | | | | | |
"          \_/  |_|_| |_| |_|
"
"   This is the personal tagbar settings file of David Lester.
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

" tagbar {
    if count(g:bundle_groups, 'general')
        nnoremap <silent> <leader>tt :TagbarToggle<CR>
        let g:tagbar_autoclose = 1
    endif 
" }
