return {
  "MysticalDevil/inlay-hints.nvim",
  event = "LspAttach",
  dependencies = { "neovim/nvim-lspconfig" },
  config = function()
    local inlay_hints = require("inlay-hints")

    inlay_hints.setup({
      inlay_hints = {
        type_hints = {
          show = true,
          prefix = "",
          remove_redundant = true,
        },
      },
      renderer = "inlay-hints/render/simple",
    })

    -- Automatically enable inlay hints when opening a file
    vim.api.nvim_create_authcmd("LspAttach", {
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client and client.server_capabilities.inlayHintProvider then
          inlay_hints.on_attach(client, args.buf)
        end
      end,
    })
  end,
}
