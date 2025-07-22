return{
  "mfussenegger/nvim-dap-python",
  lazy = false,
  dependencies = {},
  config = function()
    require("dap-python").setup("python3")
  end,
  program = function ()
    require('dap-python').setup("python3")
  end
}
