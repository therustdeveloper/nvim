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
    })

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
  end,
}
