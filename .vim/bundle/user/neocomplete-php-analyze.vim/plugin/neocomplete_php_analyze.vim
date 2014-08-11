if exists("g:loaded_neocomplete_php_analyze")
  finish
endif
let g:loaded_neocomplete_php_analyze = 1

let s:save_cpo = &cpo
set cpo&vim

function! neocomplete_php_analyze#zend_include_files(lines, path) "{{{
  let include_files = []
  let dup_check = {}
  for line in a:lines
    if line =~ '\(new\|extends\|=\) \+\<\u\w*\>'
      "echomsg line
      let filename = substitute(matchstr(line, '\<\u\w*\>'),
            \ '_', '/', 'g') . '.php'
      "echomsg filename
      if filename == '' || has_key(dup_check, filename)
        continue
      endif
      let dup_check[filename] = 1

      let filename = fnamemodify(findfile(filename, a:path), ':p')
      if filereadable(filename)
        call add(include_files, filename)
      endif
    endif
  endfor

  return include_files
endfunction "}}}


let &cpo = s:save_cpo
unlet s:save_cpo
