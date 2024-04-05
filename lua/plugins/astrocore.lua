-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = false, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "auto", -- sets vim.opt.signcolumn to auto
        wrap = false, -- sets vim.opt.wrap
        cmdheight = 1, -- sets vim.opt.cmdheight
        colorcolumn = "80,100,120",
      },
      g = { -- vim.g.<key>
        mapleader = " ", -- sets vim.g.mapleader
        autopairs_enabled = true, -- enable autopairs at start
        diagnostics_mode = 3, -- set the visibility of diagnostics in the UI (0=off, 1=only show in status line, 2=virtual text off, 3=all on)
        icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      n = {
        -- second key is the lefthand side of the map
        -- mappings seen under group name "Buffer"
        ["<Leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
        ["<Leader>bD"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Pick to close",
        },
        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        ["<Leader>b"] = { desc = "Buffers" },
        -- quick save
        -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
        ["<Leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
        ["<Leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
        ["<Leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },
        -- tables with the `name` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        ["<S-h>"] = { "<cmd>bprev<cr>", desc = "Goto previous buffer" },
        ["<S-l>"] = { "<cmd>bnext<cr>", desc = "Goto next buffer" },
        -- quick save
        -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command

        ["<C-u>"] = { "<C-u>zz" },
        ["<C-d>"] = { "<C-d>zz" },
        ["<C-Q>"] = { "<nop>" },
        -- Search terms
        ["n"] = { "nzzzv" },
        ["N"] = { "Nzzzv" },
        -- Telescope
        ["<Leader>fr"] = { "<cmd>Telescope resume<cr>", desc = "Resume last search" },
      },
      -- first key is the mode
      -- n = {
      --   -- second key is the lefthand side of the map
      --
      --   -- navigate buffer tabs with `H` and `L`
      --   -- L = {
      --   --   function() require("astrocore.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      --   --   desc = "Next buffer",
      --   -- },
      --   -- H = {
      --   --   function() require("astrocore.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      --   --   desc = "Previous buffer",
      --   -- },
      --
      --   -- mappings seen under group name "Buffer"
      --   ["<Leader>bD"] = {
      --     function()
      --       require("astroui.status.heirline").buffer_picker(
      --         function(bufnr) require("astrocore.buffer").close(bufnr) end
      --       )
      --     end,
      --     desc = "Pick to close",
      --   },
      --   -- tables with just a `desc` key will be registered with which-key if it's installed
      --   -- this is useful for naming menus
      --   ["<Leader>b"] = { desc = "Buffers" },
      --   -- quick save
      --   -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
      -- },
      t = {
        -- setting a mapping to false will disable it
        -- ["<esc>"] = false,
      },
      v = {
        ["J"] = { ":m '>+1<CR>gv=gv" },
        ["K"] = { ":m '<-2<CR>gv=gv" },
      },
      x = {
        ["p"] = { '"_dP' },
      },
    },
  },
}
