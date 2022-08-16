" 現在のファイルパスをコピー
command! CopyPath
      \ let @*=expand('%') | echo 'copied'

" jsonを整形
command! JsonFormat :execute '%!jq'

" 保存時に行末スペースを削除
augroup saveFile
  autocmd!
  autocmd BufWritePre * %s/\s\+$//e
augroup END
