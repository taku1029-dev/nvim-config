return{
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    require("toggleterm").setup({
      size = 10,
      open_mapping =[[<c-t>]],
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      close_on_exit = true,
      autochdir = true,
    })
  end,
  keys = {
    {"<C-t>", "<cmd>ToggleTerm<cr>",mode = {"n", "i", "v", "t"}, desc = "Toggle terminal"},
      desc = "Toggle term"
    },
}
