local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- MAP LEADER TO SPACE
vim.g.mapleader = " "

-- NVIM TREE
map("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true })
map("n", "<leader>u", ":NvimTreeFindFile<CR>", { silent = true })

-- UPDATE PLUGINS
map("n", "<Leader>u", ":PackerSync<CR>")

-- OPEN NVIMRC FILE
map("n", "<Leader>v", "<cmd>e $MYVIMRC<CR>")

-- SOURCE NVIMRC FILE
map("n", "<Leader>sv", ":luafile %<CR>")

-- QUICK NEW FILE
map("n", "<Leader>n", "<cmd>enew<CR>")

-- EASY SELECT ALL OF FILE
map("n", "<Leader>sa", "ggVG<c-$>")

-- MAKE VISUAL YANKS PLACE THE CURSOR BACK WHERE STARTED
map("v", "y", "ygv<Esc>")

-- EASIER FILE SAVE
map("n", "<Leader>w", "<cmd>:w<CR>")
map("n", "<Delete>", "<cmd>:w<CR>")

-- TAB TO SWITCH BUFFERS IN NORMAL MODE
map("n", "<Tab>", ":bnext<CR>")
map("n", "<S-Tab>", ":bprevious<CR>")

-- MORE MOLECULAR UNDO OF TEXT
-- map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", "!", "!<c-g>u")
map("i", "?", "?<c-g>u")
map("i", ";", ";<c-g>u")
map("i", ":", ":<c-g>u")

-- KEEP SEARCH RESULTS CENTRED
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "J", "mzJ`z")

-- MAKE Y YANK TO END OF THE LINE
map("n", "Y", "y$")

-- LINE BUBBLING
map("n", "<c-j>", "<cmd>m .+1<CR>==", { silent = true })
map("n", "<c-k>", "<cmd>m .-2<CR>==", { silent = true })
map("v", "<c-j>", ":m '>+1<CR>==gv=gv", { silent = true })
map("v", "<c-k>", ":m '<-2<CR>==gv=gv", { silent = true })

--AFTER SEARCHING, PRESSING ESCAPE STOPS THE HIGHLIGHT
map("n", "<esc>", ":noh<cr><esc>", { silent = true })

-- Easy add date/time
map("n", "<Leader>t", "\"=strftime('%c')<CR>Pa", { silent = true })

-- TELESCOPE
map("n", "<Leader>1", ":Telescope sessions [save_current=true]<CR>")
map("n", "<leader>p", '<cmd>lua require("telescope.builtin").find_files()<cr>')
map("n", "<leader>r", '<cmd>lua require("telescope.builtin").registers()<cr>')
map("n", "<leader>g", '<cmd>lua require("telescope.builtin").live_grep()<cr>')
map("n", "<leader>b", '<cmd>lua require("telescope.builtin").buffers()<cr>')
map("n", "<leader>j", '<cmd>lua require("telescope.builtin").help_tags()<cr>')
map("n", "<leader>h", '<cmd>lua require("telescope.builtin").git_bcommits()<cr>')
map("n", "<leader>f", '<cmd>lua require("telescope").extensions.file_browser.file_browser()<CR>')
map("n", "<leader>s", '<cmd>lua require("telescope.builtin").spell_suggest()<cr>')
map("n", "<leader>i", '<cmd>lua require("telescope.builtin").git_status()<cr>')
map("n", "<leader>ca", '<cmd>lua require("telescope.builtin").lsp_code_actions()<cr>')
map("n", "<leader>cs", '<cmd>lua require("telescope.builtin").lsp_document_symbols()<cr>')
map("n", "<leader>cd", '<cmd>lua require("telescope.builtin").lsp_document_diagnostics()<cr>')
map("n", "<leader>cr", '<cmd>lua require("telescope.builtin").lsp_references()<cr>')

map("i", "<F2>", '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })
map("n", "<leader>cn", '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })
map("v", "<leader>cn", '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })

map("n", "<leader>ci", "<cmd> lua vim.diagnostic.open_float()<cr>")

-- EASIER SPLIT MAPPINGS
map("n", "<Leader><Down>", "<C-W><C-J>", { silent = true })
map("n", "<Leader><Up>", "<C-W><C-K>", { silent = true })
map("n", "<Leader><Right>", "<C-W><C-L>", { silent = true })
map("n", "<Leader><Left>", "<C-W><C-H>", { silent = true })
map("n", "<Leader>;", "<C-W>R", { silent = true })
map("n", "<Leader>[", "<C-W>_", { silent = true })
map("n", "<Leader>]", "<C-W>|", { silent = true })
map("n", "<Leader>=", "<C-W>=", { silent = true })

-- LAZYGIT
map("n", "<Leader>l", "<cmd>:LazyGit<cr>", { silent = true })

-- DAP
map("n", "<leader>dh", ':lua require"dap".toggle_breakpoint()<CR>')
map("n", "<leader>dH", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
map("n", "<c-k>", ':lua require"dap".step_out()<CR>')
map("n", "<c-l>", ':lua require"dap".step_into()<CR>')
map("n", "<c-j>", ':lua require"dap".step_over()<CR>')
map("n", "<c-h>", ':lua require"dap".continue()<CR>')
map("n", "<leader>dn", ':lua require"dap".run_to_cursor()<CR>')
map("n", "<leader>dk", ':lua require"dap".up()<CR>')
map("n", "<leader>dj", ':lua require"dap".down()<CR>')
map("n", "<leader>dc", ':lua require"dap".terminate()<CR>')
map("n", "<leader>dr", ':lua require"dap".repl.toggle({}, "vsplit")<CR><C-w>l')
map("n", "<leader>de", ':lua require"dap".set_exception_breakpoints({"all"})<CR>')
map("n", "<leader>da", ':lua require"debugHelper".attach()<CR>')
map("n", "<leader>dA", ':lua require"debugHelper".attachToRemote()<CR>')
map("n", "<leader>di", ':lua require"dap.ui.widgets".hover()<CR>')
map("n", "<leader>d?", ':lua local widgets=require"dap.ui.widgets";widgets.centered_float(widgets.scopes)<CR>')

-- HOP
map("n", "h", "<cmd>lua require'hop'.hint_words()<cr>")
map("n", "l", "<cmd>lua require'hop'.hint_lines()<cr>")
map("v", "h", "<cmd>lua require'hop'.hint_words()<cr>")
map("v", "l", "<cmd>lua require'hop'.hint_lines()<cr>")

-- Symbols outline
map("n", "<leader>o", ":SymbolsOutline<cr>")
