return {
  "github/copilot.vim", -- Plugin repository

  config = function()
    -- Enable Copilot globally
    vim.g.copilot_enabled = true

    -- Keybinding to accept suggestions
    vim.api.nvim_set_keymap("i", "<C-l>", 'copilot#Accept("<CR>")', { expr = true, silent = true })

    -- Enable Copilot for specific filetypes
    vim.g.copilot_filetypes = {
      ["*"] = true,
      ["markdown"] = true,
      ["yaml"] = true,
    }
  end,
}
