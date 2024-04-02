-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.cmake" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.motion.flash-nvim" },
  { import = "astrocommunity.colorscheme.nightfox-nvim" },
  { import = "astrocommunity.recipes.heirline-vscode-winbar" },
  { import = "astrocommunity/recipes/heirline-nvchad-statusline" },

  -- import/override with your plugins folder
}
