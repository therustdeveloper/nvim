  return {
    "stevearc/dressing.nvim",
    lazy = true,
    event = "VeryLazy",
    config = function()
      require("dressing").setup({
        input = {
          enabled = true,
          border = "rounded", -- Options: single, double, rounded, solid, etc.
          win_options = {
            winblend = 10, -- Transparency
            winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
          },
        },
        select = {
          enabled = true,
          backend = { "telescope", "fzf", "builtin" },
          telescope = require("telescope.themes").get_cursor({}),
          builtin = {
            border = "rounded",
            win_options = {
              winblend = 10,
              winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
            },
          },
        },
      })
    end,
  }
