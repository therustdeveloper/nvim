vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
--keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- navigate between buffers
keymap.set("n", "<leader>bn", "<cmd>bnext<CR>", { desc = "Open next buffer" }) -- open next buffer
keymap.set("n", "<leader>bp", "<cmd>bprevious<CR>", { desc = "Open previous buffer" }) -- open previous buffer

--keymap.set("n", "<leader>q", ":bd<CR>", { desc = "Close the current buffer" }) --  move current buffer to new tab
keymap.set("n", "<leader>q", function()
  local bufnr = vim.api.nvim_get_current_buf()

  -- Function to get a valid buffer (skipping side panels like Treesitter)
  local function get_valid_buffer()
    local buffers = vim.tbl_filter(function(b)
      return vim.api.nvim_buf_is_valid(b)
        and vim.bo[b].buflisted -- Ensure it's a listed file buffer
        and vim.bo[b].buftype == "" -- Exclude side panels (like Treesitter)
    end, vim.api.nvim_list_bufs())

    for _, next_buf in ipairs(buffers) do
      if next_buf ~= bufnr then
        return next_buf
      end
    end
    return nil
  end

  -- Find the next buffer to switch to
  local next_buf = get_valid_buffer()

  -- Switch to the next buffer before closing the current one
  if next_buf then
    vim.api.nvim_set_current_buf(next_buf)
  end

  -- Close the original buffer
  vim.cmd("bd " .. bufnr)

  -- If no valid buffer was found, open an empty buffer
  if not next_buf then
    vim.cmd("enew")
  end
end, { desc = "Close current buffer and switch to the next valid file buffer" })

-- Nvim DAP
--keymap.set("n", "<Leader>dl", "<cmd>lua require'dap'.step_into()<CR>", { desc = "Debugger step into" })
--keymap.set("n", "<Leader>dj", "<cmd>lua require'dap'.step_over()<CR>", { desc = "Debugger step over" })
--keymap.set("n", "<Leader>dk", "<cmd>lua require'dap'.step_out()<CR>", { desc = "Debugger step out" })
--keymap.set("n", "<Leader>dc", "<cmd>lua require'dap'.continue()<CR>", { desc = "Debugger continue" })
--keymap.set("n", "<Leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { desc = "Debugger toggle breakpoint" })
--keymap.set(
--  "n",
--  "<Leader>dd",
--  "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
--  { desc = "Debugger set conditional breakpoint" }
--)
--keymap.set("n", "<Leader>de", "<cmd>lua require'dap'.terminate()<CR>", { desc = "Debugger reset" })
--keymap.set("n", "<Leader>dr", "<cmd>lua require'dap'.run_last()<CR>", { desc = "Debugger run last" })
