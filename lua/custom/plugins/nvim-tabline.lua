return {
  "crispgm/nvim-tabline",

  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  config = function()
    local tabline = require("tabline")

    tabline.setup({
      show_index = true, -- show tab index
      show_modify = true, -- show buffer modification indicator
      show_icon = true, -- show file extension icon
      modify_indicator = "[+]", -- modify indicator
    })
  end,
}
