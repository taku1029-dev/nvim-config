return{
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  keys = {
    {"ff", "<cmd>Telescope find_files<cr>", mode = {"n", "v", "t"}, desc = "Open telescope"},
  },
}
