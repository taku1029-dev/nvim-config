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
          local build_options = {
            "Build and Debug",
            "Build and no linkage",
            "Link .o file and Debug",
          }
          -- print out all options
          for index, value in ipairs(build_options) do
            print(index .. ": " .. value)
          end
          local input = vim.fn.input("Select an option: ")
          local option = tonumber(input)

          local current_file = vim.fn.expand('%:p')
          local current_dir = vim.fn.expand('%:p:h')
          local file_extension = vim.fn.expand('%:e')
          local file_name = vim.fn.expand('%:t:r') -- without file extension
          local output_file = vim.fn.expand('%:p:h') .. '/build/' .. file_extension .. '_' .. file_name

          local compile_cmd = "";
          if option == 1 then
            compile_cmd = string.format('g++ -g -o %s %s', output_file, current_file)
          elseif option == 2 then
            output_file = output_file .. '.o'
            compile_cmd = string.format('g++ -c -g %s -o %s', current_file, output_file)
          elseif option == 3 then
            local files_str = ''
            local input = ''
            local file_path = ''
            local flg = 0
            while flg ~= 1 do
              input = vim.fn.input(".o file: build/")
              if input == "" then
                flg = 1
                break
              end
              file_path = current_dir .. '/build/' .. input
              print('\n' .. file_path)
              files_str = files_str .. ' ' .. file_path
              print(files_str)
            end
            compile_cmd = string.format('g++ -g' .. files_str .. ' -o ' .. output_file)
          end
          print("\nCompiling: " .. compile_cmd)
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

    dap.configurations.c = {
      {
        name = "Build and Debug",
        type = "codelldb",
        request = "launch",
        program = function()
          local build_options = {
            "gcc Build and Debug",
            "g++ Build and Debug",
            "g++ Build and no linkage",
          }
          -- print out all options
          for index, value in ipairs(build_options) do
            print(index .. ": " .. value)
          end
          local input = vim.fn.input("Select an option: ")
          local option = tonumber(input)

          local current_file = vim.fn.expand('%:p')
          local file_extension = vim.fn.expand('%:e')
          local file_name = vim.fn.expand('%:t:r') -- without file extension
          local output_file = vim.fn.expand('%:p:h') .. '/build/' .. file_extension .. '_' .. file_name

          local compile_cmd = "";
          if option == 1 then
            compile_cmd = string.format('gcc -g -o %s %s', output_file, current_file)
          elseif option == 2 then
            compile_cmd = string.format('g++ -g -o %s %s', output_file, current_file)
          elseif option == 3 then
            output_file = output_file .. '.o'
            compile_cmd = string.format('g++ -c -g %s -o %s', current_file, output_file)
            -- Return nil to just generate .o file
            print("\nCompiling: " .. compile_cmd)
            local result = vim.fn.system(compile_cmd)
            return nil
          end
          print("\nCompiling: " .. compile_cmd)
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

  end,
  keys = {
    {"b", "<cmd>DapToggleBreakpoint<cr>", mode = {"n"}, desc = "Toggle Breakpoint"},
    {"<F5>", "<cmd>DapContinue<cr>", mode = {"n"}, desc = "Start Debugging"},
    {"<F10>", "<cmd>DapStepOver<cr>", mode = {"n"}, desc = "Step Over"},
    {"<F11>", "<cmd>DapStepInto<cr>", mode = {"n"}, desc = "Step Into"},
    {"<F12>", "<cmd>DapTerminate<cr>", mode = {"n", "i", "t"}, desc = "Step Into"},
  },
}
