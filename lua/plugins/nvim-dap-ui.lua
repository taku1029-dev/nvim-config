return{
  "rcarriga/nvim-dap-ui",
  dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio",
  },
  opts = {},
  config = function ()
    require("dapui").setup{
    }
  end,
  keys = {
    {"<C-d>", "<cmd>lua require('dapui').toggle()<cr>", mode = {"n", "t", "v", desc = "Toggle dapui"}}
  },
}
