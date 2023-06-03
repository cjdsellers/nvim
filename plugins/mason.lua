-- customize mason plugins
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = {
      ensure_installed = {
        "marksman",
        "clangd",
        "jsonls",
        "lua_ls",
        "pyright",
        "rust_analyzer",
        "tsserver",
        "yamlls",
      },
    },
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      if not opts.ensure_installed then opts.ensure_installed = {} end
      require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
        "black",
        "clang-format",
        "mypy",
        "rustfmt",
        "ruff",
        "stylua",
        "shellcheck",
      })
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = function(_, opts)
      -- add more things to the ensure_installed table protecting against community packs modifying it
      if not opts.ensure_installed then opts.ensure_installed = {} end
      require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
        "codelldb",
      })
    end,
  },
}
