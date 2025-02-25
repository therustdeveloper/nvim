local dap = require("dap")

-- Adapter configuration for codelldb
dap.adapters.codelldb = {
  type = "server",
  port = "${port}",
  executable = {
    command = vim.fn.stdpath("data") .. "/mason/bin/codelldb", -- Adjust if installed manually
    args = { "--port", "${port}" },
  },
}

-- Configuration for Rust debugging
dap.configurations.rust = {
  {
    name = "Launch",
    type = "codelldb",
    request = "launch",
    program = function()
      -- return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
      -- Automatically detect the executable from the Cargo.toml file
      local cargo_toml = vim.fn.findfile("Cargo.toml", vim.fn.getcwd() .. ";")
      if cargo_toml == "" then
        return vim.notify("Cargo.toml not found", vim.log.levels.ERROR)
      end

      -- Read the package name from Cargo.toml
      local package_name = nil
      for line in io.lines(cargo_toml) do
        if line:match("^name%s*=%s*") then
          package_name = line:match("^name%s*=%s*[\"']?([^\"']+)[\"']?")
          break
        end
      end

      if not package_name then
        return vim.notify("Could not determine package name from Cargo.toml", vim.log.levels.ERROR)
      end

      -- Construct the path to the debug executable
      return vim.fn.getcwd() .. "/target/debug/" .. package_name
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {},
  },
}
