return {
  "olivercederborg/poimandres.nvim",
  lazy = true,
  opts = {},
  config = function()
    require("poimandres").setup {
      disable_background = true,
    }
  end,
}
