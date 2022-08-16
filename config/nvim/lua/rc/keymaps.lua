-- */#をsmartcaseに対応できるように置き換え
--vim.keymap.set('n', '*', '/<C-r><C-w><CR>N', { noremap = true, silent = true })
--vim.keymap.set('n', '#', '?<C-r><C-w><CR>N', { noremap = true, silent = true })

-- Ctrl + hjkl でウィンドウ間を移動
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

-- Shift + 矢印でウィンドウサイズを変更
vim.keymap.set('n', '<S-Left>', '<C-w><', { noremap = true, silent = true })
vim.keymap.set('n', '<S-Right>', '<C-w>>', { noremap = true, silent = true })
vim.keymap.set('n', '<S-Up>', '<C-w>-', { noremap = true, silent = true })
vim.keymap.set('n', '<S-Down> ', '<C-w>+', { noremap = true, silent = true })

-- TABにて対応ペアにジャンプ
vim.keymap.set({'n', 'v'}, '<Tab>', '%', { noremap = true, silent = true })

-- コマンドラインモードカーソル移動
vim.keymap.set('c', '<C-a>', '<Home>', { noremap = true, silent = false }) -- 行頭に移動
vim.keymap.set('c', '<C-b>', '<Left>', { noremap = true, silent = false }) -- 一文字戻る
vim.keymap.set('c', '<C-d>', '<Del>', { noremap = true, silent = false }) -- カーソルの下の文字を削除
vim.keymap.set('c', '<C-e>', '<End>', { noremap = true, silent = false }) -- 行末へ移動
vim.keymap.set('c', '<C-f>', '<Right>', { noremap = true, silent = false }) -- 一文字進む
vim.keymap.set('c', '<C-n>', '<Down>', { noremap = true, silent = false }) -- コマンドライン履歴を一つ進む
vim.keymap.set('c', '<C-p>', '<Up>', { noremap = true, silent = false }) -- コマンドライン履歴を一つ戻る
vim.keymap.set('c', '<M-b>', '<S-Left>', { noremap = true, silent = false }) -- 前の単語へ移動
vim.keymap.set('c', '<M-f>', '<S-Right>', { noremap = true, silent = false }) -- 次の単語へ移動

-- TAB CR削除
vim.keymap.set('n', '<Leader>dc', ':<C-u>%s/<C-v><C-m>//ge<CR>:noh<CR>:retab<CR>gg', { noremap = true, silent = true })

-- タブ操作
-- bufferline側で設定移動
--vim.keymap.set('n', '[tab]', '<Nop>', { noremap = true, silent = true })
--vim.keymap.set('n', 't', '[tab]', { remap = true, silent = true })
--vim.keymap.set('n', '[tab]n', ':tabnew<CR>', { remap = true, silent = true }) -- tn 新規タブ
--vim.keymap.set('n', '[tab]l', ':tabnext<CR>', { remap = true, silent = true }) -- tl 次のタブ
--vim.keymap.set('n', '[tab]h', ':tabprevious<CR>', { remap = true, silent = true }) -- th 前のタブ

-- 検索で自動エスケープ
vim.keymap.set('c', '/', "getcmdtype() == '/' ? '\\/' : '/'", { noremap = true, silent = false, expr = true})
vim.keymap.set('c', '?', "getcmdtype() == '?' ? '\\?' : '?'", { noremap = true, silent = false, expr = true})

-- .vimrcや.gvimrcを編集するためのKey-mappingを定義する
vim.keymap.set('n', '<Space>ev', ':<C-u>edit $MYVIMRC<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Space>eg', ':<C-u>edit $MYGVIMRC<CR>', { noremap = true, silent = true })
