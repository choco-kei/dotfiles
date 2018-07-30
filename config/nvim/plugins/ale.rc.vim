let g:ale_sign_column_always = 1
let g:ale_lint_on_text_changed = 'normal'
let g:ale_sign_warning = "\uf071"
let g:ale_sign_error = "\uf05e"

let g:ale_linters = {
      \'php': ['phpcs']
      \}

let g:ale_fixers = {
      \'php': ['phpcbf']
      \}

let g:ale_php_phpcs_standard = 'psr1,psr2'
let g:ale_php_phpcbf_executable = 'phpcbf'
let g:ale_php_phpcbf_standard = 'psr1,psr2'

nnoremap [Ale] <Nop>
nmap <Leader>a [Ale]
nmap <silent> [Ale]fx <Plug>(ale_fix)
" マップ先が決まらない問題
"nmap <silent> <C-> <Plug>(ale_previous)
"nmap <silent> <C-> <Plug>(ale_next)
