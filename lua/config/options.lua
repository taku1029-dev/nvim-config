-- General Configurations --
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.opt.clipboard = "unnamedplus"
vim.cmd("set number")
vim.cmd("colorscheme desert")

-- configure nvcode-color-schemes
vim.g.nvcode_termcolors = 256
vim.cmd('syntax on')
vim.cmd('colorscheme desert')

-- Path to node executable 
vim.g.coc_node_path = '/usr/bin/node'

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- Display the signcolumn of each line
vim.opt.signcolumn = "yes"

local keyset = vim.keymap.set
-- Enable Autocomplete
function _G.check_back_space()
  local col = vim.fn.col('.') - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Tab to autocomplete
local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#confirm() : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
keyset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)
