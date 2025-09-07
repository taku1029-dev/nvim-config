-- <Tab> <C-i> differenciation
-- if vim.env.TERM == 'xterm-kitty' then
--   vim.cmd([[autocmd UIEnter * if v:event.chan ==# 0 | call chansend(v:stderr, "\x1b[>1u") | endif]])
--   vim.cmd([[autocmd UILeave * if v:event.chan ==# 0 | call chansend(v:stderr, "\x1b[<1u") | endif]])
-- end

-- Window Control
vim.keymap.set('n', '<C-w>t', ':tabnew<CR>', {desc = 'Create new tab', silent = true})
vim.keymap.set('n', '<C-w><C-t>', ':tabclose<CR>', {desc = 'Close current tab', silent = true})

-- <Up> <Down> keybind
vim.cmd([[
  cnoremap <expr> <Down> pumvisible() ? "\<C-n>" : "\<Down>"
  cnoremap <expr> <Up> pumvisible() ? "\<C-p>" : "\<Up>"
]])

-- <BS> for file path
vim.keymap.set('c', '<BS>', function()
 if vim.fn.pumvisible() == 1 then
   local cmdline = vim.fn.getcmdline()
   local last_char = cmdline:sub(-1)
   
   if last_char == '/' then
     return '<C-w><C-w>'  -- erase both dir name and slash
   else
     return '<C-w>'       -- just erase current word
   end
 else
   return '<BS>'          -- normal backspace
 end
end, { expr = true })

-- <C-]> indentation
vim.keymap.set({'v', 'n', 'i'}, '<C-]>', '>', {noremap = true})
vim.keymap.set({'v', 'n', 'i'}, '<C-[>', '<', {noremap = true})
