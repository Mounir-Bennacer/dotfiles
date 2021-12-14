-- gitsigns setup
require("gitsigns").setup({
  numhl = true,
  signcolumn = true,
  signs = {
    add = { hl = "GitGutterAdd", text = "│", numhl = "GitSignsAddNr" },
    change = { hl = "GitGutterChange", text = "│", numhl = "GitSignsChangeNr" },
    delete = { hl = "GitGutterDelete", text = "_", numhl = "GitSignsDeleteNr" },
    topdelete = { hl = "GitGutterDelete", text = "‾", numhl = "GitSignsDeleteNr" },
    changedelete = { hl = "GitGutterChange", text = "~", numhl = "GitSignsChangeNr" },
  },
})
