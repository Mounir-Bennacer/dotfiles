local autocmd = vim.api.nvim_create_autocmd

local opt = vim.opt

autocmd("FileType", {
   pattern = "norg",
   callback = function()
      -- vim.opt.laststatus = 0
      opt.number = false
      opt.showtabline = 0
      opt.cole = 1
      opt.fillchars = "fold: "
      opt.foldlevel = 99
      vim.wo.foldmethod = "expr"
   end,
})
