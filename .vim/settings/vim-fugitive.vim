" Modeline and Notes {
" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell:
"
"                _
"        __   __(_)_ __ ___
"        \ \ / /| | '_ ` _ \
"         \ V / | | | | | | |
"          \_/  |_|_| |_| |_|
"
"   This is the personal vim-fugitive settings file of David Lester.
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

" Fugitive {
     if isdirectory(expand("~/.vim/bundle/vim-fugitive/"))
         nnoremap <silent> <leader>gs :Gstatus<CR>
         nnoremap <silent> <leader>gd :Gdiff<CR>
         nnoremap <silent> <leader>gc :Gcommit<CR>
         nnoremap <silent> <leader>gb :Gblame<CR>
         nnoremap <silent> <leader>gl :Glog<CR>
         nnoremap <silent> <leader>gp :Git push<CR>
         nnoremap <silent> <leader>gr :Gread<CR>
         nnoremap <silent> <leader>gw :Gwrite<CR>
         nnoremap <silent> <leader>ge :Gedit<CR>
         " Mnemonic _i_nteractive
         nnoremap <silent> <leader>gi :Git add -p %<CR>
         nnoremap <silent> <leader>gg :SignifyToggle<CR>
     endif
" }

