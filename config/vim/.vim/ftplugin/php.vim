" 文字列中のSQLをハイライト
let php_sql_query = 1

" 文字列中のHTMLをハイライト
let php_htmlInStrings = 1

" ショートタグを無効
let php_noShortTags = 1

" switch内のcase/defaultでインデントさせる
let g:PHP_vintage_case_default_indent = 1

" 自動コメントをやめる
let g:PHP_autoformatcomment = 0

" PHPの折りたたみ設定
"let php_folding = 1
set foldmethod=indent
set foldlevel=2
set foldnestmax=2

" 単語からハイフンを除外
setlocal iskeyword-=-
