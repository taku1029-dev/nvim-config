return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  -- Plugin specific key mapping  --
  keys = {
    {"<C-f>", "<cmd>NvimTreeToggle<cr>", mode = {"n", "v", "t"}, desc = "Toggle NvimTree"},
  },
  config = function()
    require("nvim-tree").setup {}
  end,
}
