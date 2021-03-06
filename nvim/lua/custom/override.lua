-- overriding default plugin configs!

local M = {}

M.treesitter = {
   ensure_installed = {
      "vim",
      "html",
      "css",
      "json",
      "toml",
      "markdown",
      "bash",
      "lua",
      "norg",
      "python",
      "javascript",
      "typescript",
      "yaml",
      "jsdoc",
      "dockerfile",
      "rust",
      "http",
      "go",
      "dot",
      "jsonc",
      "scss",
      "tsx",
   },

   rainbow = {
      enable = true,
      extended_mode = true,
      max_file_lines = nil,
   },

   incremental_selection = {
      enable = true,
      keymaps = {
         init_selection = "gnn",
         node_incremental = "grn",
         scope_incremental = "grc",
         node_decremental = "grm",
      },
   },

   indent = { enable = true },

   matchup = {
      enable = true,
   },
   -- nvim-treesitter-textobjects
   textobjects = {
      select = {
         enable = true,

         -- Automatically jump forward to textobj, similar to targets.vim
         lookahead = true,

         keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
         },
      },

      swap = {
         enable = true,
         swap_next = {
            ["<leader>cx"] = "@parameter.inner",
         },
         swap_previous = {
            ["<leader>cX"] = "@parameter.inner",
         },
      },

      move = {
         enable = true,
         set_jumps = true, -- whether to set jumps in the jumplist
         goto_next_start = {
            ["]m"] = "@function.outer",
            ["]]"] = "@class.outer",
         },
         goto_next_end = {
            ["]M"] = "@function.outer",
            ["]["] = "@class.outer",
         },
         goto_previous_start = {
            ["[m"] = "@function.outer",
            ["[["] = "@class.outer",
         },
         goto_previous_end = {
            ["[M"] = "@function.outer",
            ["[]"] = "@class.outer",
         },
      },

      -- lsp_interop = {
      --   enable = true,
      --   border = "none",
      --   peek_definition_code = {
      --     ["<leader>cf"] = "@function.outer",
      --     ["<leader>cF"] = "@class.outer",
      --   },
      -- },
      --
   },

   -- endwise
   endwise = {
      enable = true,
   },

   -- autotag
   autotag = {
      enable = true,
   },

   -- context_commentstring
   context_commentstring = {
      enable = true,
      enable_autocmd = false,
   },
}

M.nvimtree = {
   git = {
      enable = true,
      ignore = false,
   },

   renderer = {
      highlight_git = true,
      icons = {
         show = {
            git = true,
         },
      },
   },

   view = {
      auto_resize = true,
      width = 30,
   },
}

M.blankline = {
   filetype_exclude = {
      "help",
      "terminal",
      "alpha",
      "packer",
      "lspinfo",
      "TelescopePrompt",
      "TelescopeResults",
      "nvchad_cheatsheet",
      "lsp-installer",
      "norg",
      "",
   },
}

return M
