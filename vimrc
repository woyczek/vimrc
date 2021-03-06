syn on
set modeline
se et
se ts=2
se shiftwidth=2
ret
execute pathogen#infect()
set noai
nnoremap S "_diwP
nnoremap « :lprev<CR>
nnoremap » :lnext<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
autocmd WinEnter * if &buftype ==# 'quickfix' && winnr('$') == 1 | quit | endif

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_perl_checkers = ['perl']
let g:syntastic_always_populate_loc_list = 1 
let g:syntastic_auto_loc_list = 1 
let g:syntastic_check_on_open = 1 
let g:syntastic_check_on_wq = 1 
let g:syntastic_enable_highlighting = 1 
let g:syntastic_puppet_checkers = ['puppet', 'puppetlint', 'puppet-lint'] 
let g:syntastic_puppet_puppetlint_args = '--no-autoloader_layout-check' 
let g:syntastic_ruby_checkers = ['mri', 'rubocop'] 
let g:syntastic_yaml_checkers = ['yamllint']
let g:syntastic_yaml_yamllint_args = '-c ~/.vim/yamllint.yml'
let g:syntastic_enable_perl_checker = 1
let g:syntastic_python_checkers = ['python', 'flake8', 'pylint']
let g:pymode_options_max_line_length = 120
let g:syntastic_markdown_mdl_exec = 'mdl'
let g:syntastic_markdown_mdl_args = '-r ~MD013, ~MD035'

let g:syntastic_python_flake8_args  = '--ignore="E501,E305,E302"'
let g:syntastic_quiet_messages = {
       \ "regex":   '\[arrow_alignment\]',
       \ "file:p":  ['\m\c\.p$'] }

augroup filedetect
  au BufRead,BufNewFile *.psm1 setfiletype conf
  " associate .psm1 to conffile
augroup END

set bomb

au FileType python setl nobomb
au FileType python setl nu
au FileType yaml setl nu
au FileType yaml setl nobomb
au FileType markdown setl nu
au FileType ruby setl nu
au FileType ruby setl nobomb
set mouse=a

" see :h syntastic-loclist-callback
function! SyntasticCheckHook(errors)
    if !empty(a:errors)
        let g:syntastic_loc_list_height = min([len(a:errors), 10])
    endif
endfunction

" windows
"if has("multi_byte")
 set encoding=utf-8
 setglobal fileencoding=utf-8
" set termencoding=iso-8859-15
 " set term=xterm-256
 set termencoding=utf-8
 set fileencodings=utf-8,iso-8859-15,iso-8859-3,ucs-bom

"else
" echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"
"endif

" Workaround sous windows

" set term=xterm-256
set hlsearch
set t_Co=8
set t_Sb=m
set t_Sf=m

" set background=light
" colorscheme peachpuff-dark
colorscheme peachdark
