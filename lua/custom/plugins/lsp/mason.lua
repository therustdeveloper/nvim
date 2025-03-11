return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "jay-babu/mason-nvim-dap.nvim",
  },
  config = function()
    -- import mason
    local mason = require("mason")

    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

    local mason_tool_installer = require("mason-tool-installer")

    local mason_nvim_dap = require("mason-nvim-dap")

    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      -- list of servers for mason to install
      ensure_installed = {
        --"tsserver",
        --"html",
        --"cssls",
        --"tailwindcss",
        --"svelte",
        --"lua_ls",
        --"graphql",
        --"emmet_ls",
        --"prismals",
        --"pyright",
      },
    })

    mason_tool_installer.setup({
      ensure_installed = {
        --"prettier", -- prettier formatter
        "stylua", -- lua formatter
        "isort", -- python formatter
        "black", -- python formatter
        "pylint",
        "rust-analyzer",
        "gopls",
        "clangd",
        "terraform-ls",
        --"eslint_d",
      },
    })

    mason_nvim_dap.setup({
      ensure_installed = { "codelldb", "delve" },
      handlers = {
        function(config)
          require("mason-nvim-dap").default_setup(config)
        end,
      },
    })
  end,
}
