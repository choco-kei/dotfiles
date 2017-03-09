let g:neosnippet#snippets_directory = '~/dotfiles/config/nvim/snippets'

let g:neosnippet#disable_runtime_snippets = {
      \ '_': 1,
      \ }

" Plugin key-mappings.
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB> neosnippet#jumpable() ?
"      \ "\<Plug>(neosnippet_expand_or_jump)"
"      \: pumvisible() ? "\<C-n>" : "\<TAB>"
imap <expr><TAB> pumvisible() ? "\<C-n>"
      \: neosnippet#jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: "\<TAB>"
smap <expr><TAB> neosnippet#jumpable() ?
      \"\<Plug>(neosnippet_expand_or_jump)"
      \: "\<TAB>"

if has('conceal')
  set conceallevel=2 concealcursor=i
endif
