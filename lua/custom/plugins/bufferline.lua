return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  --opts = {
  --  options = {
  --    mode = "tabs",
  --  },
  --},

  config = function()
    local bufferline = require("bufferline")

    bufferline.setup({
      options = {
        mode = "tabs",
        style_preset = bufferline.style_preset.default,
        themable = true,
        numbers = "ordinal",
        indicator = {
          icon = " ",
          style = "icon",
        },
        buffer_close_icon = "󰅖",
        modified_icon = "●",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
      },
    })
  end,
}
