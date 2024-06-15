return {
  "stevearc/oil.nvim",
  opts = {},

  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  config = function()
    local oil = require("oil")

    oil.setup({
      default_file_explorer = true,

      columns = {
        "icon",
      },

      -- Configuration for the floating window in oil.open_float
      float = {
        -- Padding around the floating window
        padding = 2,
        max_width = 0,
        max_height = 0,
        border = "rounded",
        win_options = {
          winblend = 0,
        },
        -- This is the config that will be passed to nvim_open_win.
        -- Change values here to customize the layout
        override = function(conf)
          return conf
        end,
      },
    })

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
  end,
}
