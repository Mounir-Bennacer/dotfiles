local M = {}
local indent = 2
local g = vim.g
local cmd = vim.cmd
local opt = vim.opt -- to set options

function M.setup(n)
  -- cmd([[filetype plugin indent on]])
  -- cmd([[syntax enable]])

  opt.backspace = { "indent", "eol", "start" }
  opt.clipboard = "unnamedplus"
  opt.completeopt = "menu,menuone,noselect"
  opt.cursorline = true
  opt.cursorcolumn = true
  opt.encoding = "utf-8" -- Set default encoding to UTF-8
  opt.expandtab = true -- Use spaces instead of tabs
  opt.foldenable = false
  opt.foldmethod = "indent"
  opt.formatoptions = "l"
  opt.hidden = true
  opt.hidden = true -- Enable background buffers
  opt.hlsearch = true -- Highlight found searches
  opt.ignorecase = true -- Ignore case
  opt.inccommand = "split" -- Get a preview of replacements
  opt.incsearch = true -- Shows the match while typing
  opt.joinspaces = false -- No double spaces with join
  vim.o.lazyredraw = true
  opt.linebreak = true -- Stop words being broken on wrap
  opt.number = true -- Show line numbers
  opt.list = true -- Show some invisible characters
  opt.listchars = { tab = " ", trail = "·" }
  opt.relativenumber = false
  opt.scrolloff = 4 -- Lines of context
  opt.shiftround = true -- Round indent
  opt.shiftwidth = 4 -- Size of an indent
  opt.showmode = false -- Don't display mode
  opt.sidescrolloff = 8 -- Columns of context
  opt.signcolumn = "yes:1" -- always show signcolumns
  opt.smartcase = true -- Do not ignore case with capitals
  opt.smartindent = true -- Insert indents automatically
  opt.spelllang = { "en_gb" }
  opt.splitbelow = true -- Put new windows below current
  opt.splitright = true -- Put new windows right of current
  opt.tabstop = 4 -- Number of spaces tabs count for
  opt.termguicolors = true -- You will have bad experience for diagnostic messages when it's default 4000.
  vim.o.whichwrap = vim.o.whichwrap .. "<,>" -- Wrap movement between lines in edit mode with arrows
  opt.wrap = true
  -- opt.cc = "80"
  opt.mouse = "a"
  opt.guicursor =
    "n-v-c-sm:block-blinkwait50-blinkon50-blinkoff50,i-ci-ve:ver25-Cursor-blinkon100-blinkoff100,r-cr-o:hor20"
  opt.undodir = vim.fn.stdpath("config") .. "/undo"
  opt.undofile = true
  vim.cmd("au TextYankPost * lua vim.highlight.on_yank {on_visual = true}") -- disabled in visual mode
  -- Give me some fenced codeblock goodness
  vim.g.markdown_fenced_languages = { "html", "javascript", "typescript", "css", "scss", "lua", "vim" }

  opt.formatoptions = opt.formatoptions
    - "a" -- Auto formatting is BAD.
    - "t" -- Don't auto format my code. I got linters for that.
    + "c" -- In general, I like it when comments respect textwidth
    + "q" -- Allow formatting comments w/ gq
    - "o" -- O and o, don't continue comments
    - "r" -- Don't insert comment after <Enter>
    + "n" -- Indent past the formatlistpat, not underneath it.
    + "j" -- Auto-remove comments if possible.
    - "2" -- I'm not in gradeschool anymore

  g.python3_host_prog = "/opt/homebrew/bin/python3"
end

M.setup()
