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
        mode = "buffers",
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
        always_show_bufferline = true,
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            text_aligned = "center",
            separator = true,
            padding = 1,
          },
        },
        show_buffer_close_icons = true,
        show_close_icon = true,
        separator_style = "slant",
      },
    })

    -- Reapply the offset configuration whenever buffers change
    local function reapply_offsets()
      bufferline.setup({
        options = {
          offsets = {
            {
              filetype = "NvimTree",
              text = "File Explorer",
              text_align = "center",
              separator = true,
              padding = 1,
            },
          },
        },
      })
    end

    -- Autocommands to reapply offsets on buffer events
    vim.api.nvim_create_autocmd({ "BufWinEnter", "BufWinLeave", "BufEnter", "BufLeave" }, {
      pattern = "*",
      callback = reapply_offsets,
    })
  end,
}
