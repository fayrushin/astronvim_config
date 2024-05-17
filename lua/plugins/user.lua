-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {

  -- == Examples of Adding Plugins ==

  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    dependencies = {
      { "AstroNvim/astroui", opts = { icons = { Trouble = "󱍼" } } },
      {
        "AstroNvim/astrocore",
        opts = function(_, opts)
          local maps = opts.mappings
          local prefix = "<Leader>a"
          maps.n[prefix] = { desc = require("astroui").get_icon("Trouble", 1, true) .. "Trouble" }
          maps.n[prefix .. "r"] = { "<Cmd>Trouble lsp_references<cr>", desc = "references" }
          maps.n[prefix .. "t"] = { "<cmd>TroubleToggle<cr>", desc = "toggle" }
          maps.n[prefix .. "d"] = { "<cmd>Trouble document_diagnostics<cr>", desc = "document" }
          maps.n[prefix .. "w"] = { "<cmd>Trouble workspace_diagnostics<cr>", desc = "workspace" }
        end,
      },
    },
    opts = {
      use_diagnostic_signs = true,
      action_keys = {
        close = { "q", "<ESC>" },
        cancel = "<C-e>",
      },
    },
  },
  -- {
  --   "sindrets/diffview.nvim",
  --   event = "User AstroFile",
  --   cmd = "DiffviewOpen",
  -- },
  {
    "Exafunction/codeium.vim",
    config = function()
      -- Change '<C-g>' here to any keycode you like.
      vim.keymap.set("i", "<C-g>", function() return vim.fn["codeium#Accept"]() end, { expr = true, silent = true })
      vim.keymap.set(
        "i",
        "<c-;>",
        function() return vim.fn["codeium#CycleCompletions"](1) end,
        { expr = true, silent = true }
      )
      vim.keymap.set(
        "i",
        "<c-,>",
        function() return vim.fn["codeium#CycleCompletions"](-1) end,
        { expr = true, silent = true }
      )
      vim.keymap.set("i", "<c-x>", function() return vim.fn["codeium#Clear"]() end, { expr = true, silent = true })
    end,
  },
  {
    "mfussenegger/nvim-lint",
    event = "User AstroFile",
    config = function()
      local lint = require "lint"
      lint.linters_by_ft = {
        cpp = { "cpplint" },
      }
      lint.try_lint() -- start linter immediately
      local timer = vim.loop.new_timer()
      vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave", "TextChanged" }, {
        group = vim.api.nvim_create_augroup("auto_lint", { clear = true }),
        desc = "Automatically try linting",
        callback = function()
          timer:start(100, 0, function()
            timer:stop()
            vim.schedule(lint.try_lint)
          end)
        end,
      })
    end,
  },
  {
    "p00f/clangd_extensions.nvim",
    lazy = true,
    dependencies = {
      "AstroNvim/astrocore",
      opts = {
        autocmds = {
          clangd_extensions = {
            {
              event = "LspAttach",
              desc = "Load clangd_extensions with clangd",
              callback = function(args)
                if assert(vim.lsp.get_client_by_id(args.data.client_id)).name == "clangd" then
                  require "clangd_extensions"
                  vim.api.nvim_del_augroup_by_name "clangd_extensions"
                end
              end,
            },
          },
        },
      },
    },
  },
}
