-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 1000, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
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
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "auto", -- sets vim.opt.signcolumn to auto
        wrap = false, -- sets vim.opt.wrap
        clipboard = "",
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        ["<Leader>gd"] = { "<cmd>DiffviewOpen<cr>", desc = "View git diff" },
        ["<Leader>gq"] = { "<cmd>DiffviewClose<cr>", desc = "Close git diff" },
        ["<Leader>gh"] = { "<cmd>DiffviewFileHistory<cr>", desc = "View file history" },
        ["<Leader>gf"] = { "<cmd>DiffviewToggleFiles<cr>", desc = "Toggle files bar" },
        ["<Leader>gr"] = { "<cmd>Gitsigns reset_hunk<cr>", desc = "Reset git hunk" },
        ["<Leader>gR"] = { "<cmd>Gitsigns reset_buffer<cr>", desc = "Reset git buffer" },
        ["<Leader>gj"] = { "<cmd>Gitsigns next_hunk<cr>", desc = "Next hunk" },
        ["<Leader>gk"] = { "<cmd>Gitsigns prev_hunk<cr>", desc = "Previous hunk" },

        ["<leader>lt"] = { "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Toggle source/header" },
        ["<A-k>"] = { "<cmd>m .-2<CR>", desc = "move line up" },
        ["<A-j>"] = { "<cmd>m .+1<CR>", desc = "move line down" },
      },
      v = {
        -- move line up/down
        ["<A-j>"] = { ":m '>+1<cr>gv=gv" },
        ["<A-k>"] = { ":m '<-2<cr>gv=gv" },
      },
      t = {
        -- setting a mapping to false will disable it
        -- ["<esc>"] = false,
      },
    },
  },
}
