" Modeline and Notes {
" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker nospell:
"
"                _
"        __   __(_)_ __ ___
"        \ \ / /| | '_ ` _ \
"         \ V / | | | | | | |
"          \_/  |_|_| |_| |_|
"
"   This is the personal syntastic settings file of David Lester.
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

" syntastic {
    if count(g:bundle_groups, 'programming')
        " Aggregates errors by all checkers, else grabs 1st one
        let g:syntastic_python_checkers = ['flake8', 'python']
        " let g:syntastic_aggregate_errors = 0
        "let g:syntastic_mode_map = {
        "    \ "mode": "passive",
        "    \ "active_filetypes": [],
        "    \ "passive_filetypes": [] }

        "let g:syntastic-c-cppcheck=1
        "let g:syntastic_c_checkers = ['Cppcheck']
        "let g:syntastic_cpp_checkers = ['Cppcheck']
    " if exists('g:loaded_syntastic_c_cppcheck_checker')
    "     finish
    " endif
    "let g:loaded_syntastic_c_cppcheck_checker = 1
    " 
    " let s:save_cpo = &cpo
    " set cpo&vim
    " 
    " function! SyntaxCheckers_c_cppcheck_GetLocList() dict
    "     let buf = bufnr('')
    " 
    "     let makeprg = self.makeprgBuild({
    "         \ 'args': syntastic#c#ReadConfig(syntastic#util#bufVar(buf, 'cppcheck_config_file')),
    "         \ 'args_after': '-q --enable=style' })
    " 
    "     let errorformat =
    "         \ '[%f:%l]: (%trror) %m,' .
    "         \ '[%f:%l]: (%tarning) %m,' .
    "         \ '[%f:%l]: (%ttyle) %m,' .
    "         \ '[%f:%l]: (%terformance) %m,' .
    "         \ '[%f:%l]: (%tortability) %m,' .
    "         \ '[%f:%l]: (%tnformation) %m,' .
    "         \ '[%f:%l]: (%tnconclusive) %m,' .
    "         \ '%-G%.%#'
    " 
    "     let loclist = SyntasticMake({
    "         \ 'makeprg': makeprg,
    "         \ 'errorformat': errorformat,
    "         \ 'preprocess': 'cppcheck',
    "         \ 'returns': [0] })
    " 
    "     for e in loclist
    "         if e['type'] =~? '\m^[SPI]'
    "             let e['type'] = 'w'
    "             let e['subtype'] = 'Style'
    "         endif
    "     endfor
    " 
    "     return loclist
    " endfunction
    " 
    " call g:SyntasticRegistry.CreateAndRegisterChecker({
    "     \ 'filetype': 'c',
    "     \ 'name': 'Cppcheck'})
    " 
    " let &cpo = s:save_cpo
    " unlet s:save_cpo
    endif 
" }
