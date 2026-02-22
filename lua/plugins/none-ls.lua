-- Config file activated for v5

-- Customize None-ls sources

---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  opts = function(_, config)
    -- config variable is the default configuration table for the setup function call
    local null_ls = require "null-ls"

    -- Check supported formatters and linters
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    config.sources = {
      null_ls.builtins.formatting.prettier,
      null_ls.builtins.formatting.shfmt.with {
        extra_args = { "-i", "2", "-ci", "-sr", "-ln", "bash" },
      },
    }
    return config -- return final config table
  end,
}
