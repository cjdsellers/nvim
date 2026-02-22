-- Config file activated for v5

-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {

  "arcticicestudio/nord-vim",
  "andweeb/presence.nvim",

  -- LazyGit
  {
    "kdheepak/lazygit.nvim",
    cmd = "LazyGit",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  -- Snacks picker configuration (replaces Telescope in v5)
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        enabled = true,
        layouts = {
          custom = {
            layout = {
              box = "horizontal",
              width = 0.95,
              height = 0.95,
              {
                box = "vertical",
                width = 0.35,
                { win = "input", height = 1, border = "rounded" },
                { win = "list", border = "rounded" },
              },
              { win = "preview", width = 0.65, border = "rounded" },
            },
          },
        },
        layout = "custom",
      },
    },
  },

  -- == Examples of Overriding Plugins ==

  -- customize dashboard options (snacks.nvim replaces alpha-nvim in v5)
  {
    "folke/snacks.nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      if opts.dashboard then
        opts.dashboard.sections = opts.dashboard.sections or {}
        for _, section in ipairs(opts.dashboard.sections) do
          if section.section == "header" then
            section.text = {
              "███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
              "████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
              "██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
              "██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
              "██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
              "╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
            }
            break
          end
        end
      end
      return opts
    end,
  },

  -- You can disable default plugins as follows:
  { "max397574/better-escape.nvim", enabled = false },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
            -- don't add a pair if the next character is %
            :with_pair(cond.not_after_regex "%%")
            -- don't add a pair if  the previous character is xxx
            :with_pair(
              cond.not_before_regex("xxx", 3)
            )
            -- don't move right when repeat character
            :with_move(cond.none())
            -- don't delete if the next character is xx
            :with_del(cond.not_after_regex "xx")
            -- disable adding a newline when you press <cr>
            :with_cr(cond.none()),
        },
        -- disable for .vim files, but it work for another filetypes
        Rule("a", "a", "-vim")
      )
    end,
  },

  -- Mason tool installer configuration for v5
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "json-lsp",
        "marksman",
        "ruff",
        "rust-analyzer",
        "taplo",
        "ty",
        "yaml-language-server",
        "yamllint",
        "prettier",
        "shellcheck",
        "shfmt",
        "codelldb",
        "debugpy",
      },
      auto_update = true,
      run_on_start = true,
    },
  },
}
