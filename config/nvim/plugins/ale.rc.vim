let g:ale_sign_column_always = 1
let g:ale_sign_warning = "\uf071"
let g:ale_sign_error = "\uf05e"

let g:ale_linters = {
      \'php': ['phpcs'],
      \}

let g:ale_php_phpcs_standard = 'psr1,psr2'
