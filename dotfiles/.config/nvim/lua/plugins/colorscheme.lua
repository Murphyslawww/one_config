return {
  -- add tokyonight
  { "folke/tokyonight.nvim" },

  -- Configure LazyVim to load tokyonight
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = { style = "moon" },
  },
}
