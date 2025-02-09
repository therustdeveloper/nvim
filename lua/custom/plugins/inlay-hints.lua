return {
  "MysticalDevil/inlay-hints.nvim",
  event = "LspAttach",
  dependencies = { "neovim/nvim-lspconfig" },
  config = function()
    require("inlay-hints").setup({
      inlay_hints = {
        type_hints = {
          show = true,
          prefix = "",
          remove_redundant = true,
        },
      },
      renderer = "inlay-hints/render/simple",
    })
  end,
}
