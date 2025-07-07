return{
    "nvim-treesitter/nvim-treesitter",
    branch = 'master',
    lazy = false,
    build = ":TSUpdate",
    config = function () 
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html" },

          sync_install = false,

          highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
          },

          incremental_selection = {
            enable = true,
            keymaps = {
              init_selection = "gnn",
              node_incremental = "grn", 
              scope_incremental = "grc",
              node_decremental = "grm",             
            },
          },

          indent = {
            enable = true,
          },
        })

    -- Describe highlighting rules for each syntax group --
    vim.api.nvim_set_hl(0, "@foo.bar", { link = "Identifier" })

    end
}
