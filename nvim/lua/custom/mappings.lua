local M = {}

--
-- M.disabled = {
--    "<C-n>",
-- }

M.treesitter = {
   n = {
      ["<leader>cu"] = { "<cmd> TSCaptureUnderCursor <CR>", "  find media" },
   },
}

M.nvimtree = {
   n = {
      ["<leader>o"] = { "<cmd> NvimTreeToggle <CR>" },
   },
}

return M
