return {
  "catppuccin/nvim",
  lazy = false,
  name = "catppuccin",
  priority = 1000,
  config = function()
    local cat = require("catppuccin")

    cat.setup({
      flavour = "macchiato",
      background = {
        dark = "macchiato",
      },
      transparent_background = true,
    })

    vim.cmd.colorscheme("catppuccin")
  end,
}
