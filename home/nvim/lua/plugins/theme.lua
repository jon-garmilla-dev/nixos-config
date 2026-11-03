return {
  "mcchrish/zenbones.nvim",
  dependencies = { "rktjmp/lush.nvim" },
  lazy = false,
  priority = 1000,
  config = function()
    vim.g.zenbones_transparent_background = true
    vim.cmd.colorscheme("zenwritten")
  end,
}
