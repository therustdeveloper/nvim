local dap = require("dap")

-- Adapter configuration for codelldb (Rust)
dap.adapters.codelldb = {
  type = "server",
  port = "${port}",
  executable = {
    command = vim.fn.stdpath("data") .. "/mason/bin/codelldb", -- Adjust if installed manually
    args = { "--port", "${port}" },
  },
}

-- Adapter configuration for Delve (Go)
dap.adapters.delve = {
  type = "server",
  port = "${port}",
  executable = {
    command = vim.fn.stdpath("data") .. "/mason/bin/dlv",
    args = { "dap", "-l", "127.0.0.1:${port}" },
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

-- Configuration for Go debugging
dap.configurations.go = {
  {
    name = "Launch File",
    type = "delve",
    request = "launch",
    program = "${file}",
  },
  {
    name = "Debug Package *",
    type = "delve",
    request = "launch",
    program = "${workspaceFolder}/cmd/api",
  },
  {
    name = "Attach to Running Process",
    type = "delve",
    request = "attach",
    processId = function()
      local output = vim.fn.system("pgrep -n dlv")
      return tonumber(output) or vim.fn.input("Enter Process ID: ")
    end,
  },
  {
    name = "Remote Debugging",
    type = "delve",
    request = "attach",
    mode = "remote",
    substitutePath = {
      {
        from = "${workspaceFolder}",
        to = "/app/cmd/api",
      },
    },
    port = 2345,
  },
}
