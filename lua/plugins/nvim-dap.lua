return {
  "mfussenegger/nvim-dap",
  dependencies = {},
  config = function()
    local dap = require("dap")

    -- Adapter Definitions --

    -- dgb adapter --
    dap.adapters.dgb = {
      type = "executable",
      command = "gdb",
      arg = { "--interpreter=dap", "--eval-command", "set print pretty on"}
    }

    -- codelldb adapter --
    dap.adapters.codelldb = {
      type = "executable",
      command = "/home/taku1029/src/codelldb/extension/adapter/codelldb",
    }
    -- Configurations --
    -- Each config must return a table --
    -- codelldb --
    dap.configurations.cpp = {
      {
        name = "Build and Debug",
        type = "codelldb",
        request = "launch",
        program = function()
          local current_file = vim.fn.expand('%:p')
          local file_name = vim.fn.expand('%:t:r') -- without file extension
          local output_file = vim.fn.expand('%:p:h') .. '/' .. file_name

          local compile_cmd = string.format('g++ -g -o %s %s', output_file, current_file)
          print("Compiling: " .. compile_cmd)
          local result = vim.fn.system(compile_cmd)
          if vim.v.shell_error ~= 0 then
            print("Compilation failed")
            print(result)
            return nil
          end
          print("Compilation Successfull!\nOutput: " .. output_file)
          return output_file
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
      }
    }
    dap.configurations.c = dap.configurations.cpp

  end,
  keys = {
    {"b", "<cmd>DapToggleBreakpoint<cr>", mode = {"n"}, desc = "Toggle Breakpoint"},
    {"<F5>", "<cmd>DapContinue<cr>", mode = {"n"}, desc = "Start Debugging"},
    {"<F9>", "<cmd>DapStepOver<cr>", mode = {"n"}, desc = "Step Over"},
    {"<F10>", "<cmd>DapStepInto<cr>", mode = {"n"}, desc = "Step Into"},
  },
}
