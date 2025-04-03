return {
  "vuki656/package-info.nvim",
  dependencies = "MunifTanjim/nui.nvim",
  ft = { "json" },
  config = function(_, opts)
    local package_info = require("package-info")
    package_info.setup({
      auto_reload = false, -- Disables automatic refreshing
      hide_up_to_date = false, -- Hides packages that are already up to date
      notification_window = { -- Try setting this to `nil` to prevent popups
        border = "none",
        position = "top",
      },
    })
    -- vim.api.nvim_create_user_command("PackageInfo", function()
    --  package_info.show()
    -- end, {})
  end,
}
