local cmd = vim.cmd -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn -- to call Vim functions e.g. fn.bufnr()
local g = vim.g -- a table to access global variables

-- Map leader to space
g.mapleader = " "

-- Bootstrap Paq when needed
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/paqs/start/paq-nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({ "git", "clone", "--depth=1", "https://github.com/savq/paq-nvim.git", install_path })
end

require("plugins")

require("gitsigns")

-- Do not source the default filetype.vim
vim.g.did_load_filetypes = 1

require("nvim-tree").setup()
require("renamer").setup()
require("stabilize").setup()
require("Comment").setup()

require("nvim-autopairs").setup({})
require("range-highlight").setup({})

require("nvim-treesitter.configs").setup({
  rainbow = {
    enable = true,
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
  },
  autotag = {
    enable = true,
    filetypes = {
      "html",
      "javascript",
      "typescript",
      "markdown",
    },
  },
})

-- gitsigns setup
require("gitsigns").setup({
  numhl = true,
  signcolumn = false,
})

-- Session
local sessionopts = {
  log_level = "info",
  auto_session_enable_last_session = false,
  auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/",
  auto_session_enabled = true,
  auto_save_enabled = true,
  auto_restore_enabled = true,
  auto_session_suppress_dirs = nil,
}
require("auto-session").setup(sessionopts)

-- LSP this is needed for LSP completions in CSS along with the snippets plugin
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    "documentation",
    "detail",
    "additionalTextEdits",
  },
}

-- Different machine VAR for office
local envMachine = os.getenv("MACHINE")
if envMachine == "work" then
  machineCmd =
    "/System/Volumes/Data/usr/local/lib/node_modules/vscode-langservers-extracted/bin/vscode-css-language-server"
else
  machineCmd = "vscode-css-language-server"
end

require("lsp")

-- Setup treesitter
local ts = require("nvim-treesitter.configs")
ts.setup({ ensure_installed = "maintained", highlight = { enable = true } })

-- Nightfox config
local nightfox = require("nightfox")
nightfox.setup({
  -- fox = "nordfox",
  fox = "palefox",
  alt_nc = true,
  visual = true,
  search = true,
  styles = {
    comments = "italic",
    keywords = "bold",
    functions = "italic,bold",
  },
})

-- Good info on overriding colors: https://gist.github.com/romainl/379904f91fa40533175dfaec4c833f2f
-- Note had to add the SpecialKey to keep highlight on yank working alongside the CursorLine override
vim.api.nvim_exec(
  [[
function! MyHighlights() abort
    highlight CursorLine guifg=NONE guibg=#353A54
    highlight CmpItemAbbr guifg=#9FA4B6
    highlight SpecialKey guibg=NONE
    highlight CmpItemKind guifg=#8289A0
    highlight CmpItemMenu guifg=#8289A0
    highlight PmenuSel guibg=#73daca guifg=#111111
    highlight Pmenu guibg=#2E3248
    highlight GitSignsAddNr guifg=#26A07A
    highlight GitSignsDeleteNr guifg=#E87D7D
    highlight GitSignsChangeNr guifg=#AD991F
    endfunction
augroup MyColors
    autocmd!
    autocmd ColorScheme * call MyHighlights()
augroup END]],
  true
)
cmd([[colorscheme palenight]]) -- Put your favorite colorscheme here

require("options")
-- This little monkey has to go after termguicolors is set or gets upset
require("colorizer").setup()

-- Use spelling for markdown files ‘]s’ to find next, ‘[s’ for previous, 'z=‘ for suggestions when on one.
-- Source: http:--thejakeharding.com/tutorial/2012/06/13/using-spell-check-in-vim.html
-- Also I'm adding different sources for completion here, if you aren't on Mac you might need to install "look"
vim.api.nvim_exec(
  [[
augroup markdownSpell
    autocmd!
    autocmd FileType markdown,md,txt setlocal spell
    autocmd BufRead,BufNewFile *.md,*.txt,*.markdown setlocal spell
autocmd FileType markdown,md,txt lua require'cmp'.setup.buffer {
\   sources = {
\     { name = 'spell' },
\     { name = 'buffer' },
\     { name = 'look', keyword_length=3 },
\   },
\ }
augroup END
]],
  false
)

require("functions")

nightfox.load()
-- get colors from Nightfox to use in the words count
local nfColors = require("nightfox.colors").init("nordfox")

-- print(vim.inspect(nfColors))
require("lualine").setup({
  options = {
    icons_enabled = true,
    theme = "nightfox",
    component_separators = { " ", " " },
    section_separators = { left = "", right = "" },
    disabled_filetypes = {},
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = {
      { "branch", icon = "" },
      {
        "diff",
        source = diff_source,
        color_added = "#a7c080",
        color_modified = "#ffdf1b",
        color_removed = "#ff6666",
      },
    },
    lualine_c = {
      { "diagnostics", sources = { "nvim_diagnostic" } },
      function()
        return "%="
      end,
      "filename",
      {
        getWords,
        color = { fg = nfColors["bg_alt"] or "#333333", bg = nfColors["fg"] or "#eeeeee" },
        separator = { left = "", right = "" },
      },
    },
    lualine_x = { "filetype" },
    lualine_y = {
      { blank, padding = 0 },
    },
    lualine_z = {
      { getColumn, padding = { left = 1, right = 0 } },
      { getLines, icon = "", padding = 1 },
    },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {
    "quickfix",
  },
})

-- Give me some fenced codeblock goodness
g.markdown_fenced_languages = { "html", "javascript", "typescript", "css", "scss", "lua", "vim" }

-- Telescope Global remapping
local action_state = require("telescope.actions.state")
local actions = require("telescope.actions")
require("telescope").setup({
  defaults = {
    winblend = 20,
    sorting_strategy = "descending",
    layout_strategy = "flex",
    layout_config = {
      flex = {
        flip_columns = 140,
      },
      vertical = {
        preview_cutoff = 40,
        prompt_position = "bottom",
      },
      horizontal = {
        width = 0.9,
        height = 0.8,
      },
    },
    mappings = {
      i = {
        ["<esc>"] = actions.close,
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
      },
    },
  },
  pickers = {
    buffers = {
      sort_lastused = true,
      mappings = {
        i = {
          ["<C-w>"] = "delete_buffer",
        },
        n = {
          ["<C-w>"] = "delete_buffer",
        },
      },
    },
    -- https://gitter.im/nvim-telescope/community?at=6113b874025d436054c468e6 Fabian David Schmidt
    find_files = {
      on_input_filter_cb = function(prompt)
        local find_colon = string.find(prompt, ":")
        if find_colon then
          local ret = string.sub(prompt, 1, find_colon - 1)
          vim.schedule(function()
            local prompt_bufnr = vim.api.nvim_get_current_buf()
            local picker = action_state.get_current_picker(prompt_bufnr)
            local lnum = tonumber(prompt:sub(find_colon + 1))
            if type(lnum) == "number" then
              local win = picker.previewer.state.winid
              local bufnr = picker.previewer.state.bufnr
              local line_count = vim.api.nvim_buf_line_count(bufnr)
              vim.api.nvim_win_set_cursor(win, { math.max(1, math.min(lnum, line_count)), 0 })
            end
          end)
          return { prompt = ret }
        end
      end,
      attach_mappings = function()
        actions.select_default:enhance({
          post = function()
            -- if we found something, go to line
            local prompt = action_state.get_current_line()
            local find_colon = string.find(prompt, ":")
            if find_colon then
              local lnum = tonumber(prompt:sub(find_colon + 1))
              vim.api.nvim_win_set_cursor(0, { lnum, 0 })
            end
          end,
        })
        return true
      end,
    },
  },
})

require("telescope").load_extension("fzy_native")

-------------------- COMMANDS ------------------------------
cmd("au TextYankPost * lua vim.highlight.on_yank {on_visual = true}") -- disabled in visual mode

local lspkind = require("lspkind")
local cmp = require("cmp")

cmp.setup({
  snippet = {
    expand = function(args)
      -- For `vsnip` user.
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ["<C-e>"] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  },
  completion = {
    completeopt = "menu,menuone,noinsert",
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "vsnip" },
    { name = "buffer" },
  },
  formatting = {
    format = lspkind.cmp_format({
      with_text = true,
      maxwidth = 50,
      menu = {
        buffer = "",
        nvim_lsp = "",
        spell = "",
        look = "",
      },
    }),
  },
  experimental = {
    ghost_text = true,
    native_menu = false,
  },
})

-- Setup lspconfig.
-- Here is the formatting config
local null_ls = require("null-ls")
local lSsources = {
  null_ls.builtins.formatting.prettier.with({
    filetypes = {
      "javascript",
      "golang",
      "typescript",
      "css",
      "scss",
      "html",
      "json",
      "yaml",
      "markdown",
      "graphql",
      "md",
      "txt",
    },
  }),
  null_ls.builtins.formatting.stylua.with({
    args = { "--indent-width", "2", "--indent-type", "Spaces", "-" },
  }),
}
require("null-ls").config({
  sources = lSsources,
})
require("lspconfig")["null-ls"].setup({})
-- the duration in there is to stop timeouts on massive files
vim.cmd("autocmd BufWritePost * lua vim.lsp.buf.formatting_seq_sync(nil, 7500)")
vim.o.updatetime = 250
vim.cmd([[autocmd CursorHold,CursorHoldI * lua vim.lsp.diagnostic.show_line_diagnostics({focusable=false})]])
require("mappings")

require("ale")
