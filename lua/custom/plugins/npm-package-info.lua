return {
  "vuki656/package-info.nvim",
  dependencies = "MunifTanjim/nui.nvim",
  ft = { "json" },
  config = function(_, opts)
    local package_info = require("package-info")
    package_info.setup(opts)
    package_info.show()
  end,
}
