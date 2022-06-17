require "custom.autocmds"

vim.cmd "silent! command! EnableShade lua require('shade').toggle()"
vim.g.python3_host_prog = '/Users/mounirbennacer/.pyenv/shims/python3'
