" Modeline and Notes {
" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell:
"
"                _
"        __   __(_)_ __ ___
"        \ \ / /| | '_ ` _ \
"         \ V / | | | | | | |
"          \_/  |_|_| |_| |_|
"
"   This is the personal python-mode settings file of David Lester.
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

" PyMode {
    if isdirectory(expand("~/.vim/bundle/python-mode"))
        " Disable if python support not present
        if !has('python') && !has('python3')
            let g:pymode = 0
        else 
            let g:pymode = 1
        endif

        " Set default python to python3
        if has('python3')
            let g:pymode_python = 'python3'
        endif

        " Turn on/off plugin's warnings
        let g:pymode_warnings = 1
        " Set the lint checker to pyflakes
        let g:pymode_lint_checkers = ['pyflakes']
        " Remove white spaces on save
        let g:pymode_trim_whitespaces = 0
        " Setup default python options
        let g:pymode_options = 0
        " Show error message if cursor placed at the error line
        let g:pymode_lint_message = 1
        " Turn on code checking
        let g:pymode_lint = 1
        " Turn off rope script
        let g:pymode_rope = 0
    endif
" }
