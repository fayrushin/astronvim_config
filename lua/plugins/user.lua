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
          local prefix = "<Leader>x"
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
  {
    "sindrets/diffview.nvim",
    event = "User AstroFile",
    cmd = "DiffviewOpen",
  },
}
