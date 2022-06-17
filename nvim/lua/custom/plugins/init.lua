return {
  ["windwp/nvim-ts-autotag"] = {
    ft = { "html", "javascriptreact" },
    after = "nvim-treesitter",
    config = function()
      local present, autotag = pcall(require, "nvim-ts-autotag")

      if present then
        autotag.setup()
      end
    end,
  },

  ["jose-elias-alvarez/null-ls.nvim"] = {

    after = "nvim-lspconfig",
    config = function()
      require("custom.plugins.null-ls").setup()
    end,
  },

  ["nvim-telescope/telescope-media-files.nvim"] = {
    after = "telescope.nvim",
    config = function()
      require("telescope").load_extension "media_files"
    end,
  },

  ["Pocco81/TrueZen.nvim"] = {
    cmd = {
      "TZAtaraxis",
      "TZMinimalist",
      "TZFocus",
    },
    config = function()
      require "custom.plugins.truezen"
    end,
  },

  ["nvim-neorg/neorg"] = {
    ft = "norg",
    after = "nvim-treesitter",

    config = function()
      require "custom.plugins.neorg"
    end,
  },

  ["nvim-treesitter/playground"] = {
    cmd = "TSCaptureUnderCursor",
    config = function()
      require "custom.plugins.configs"
    end,
  },

  ["jose-elias-alvarez/typescript.nvim"] = {
    config = function()
      require "custom.plugins.typescript"
    end,
  },

  ["github/copilot.vim"] = {

    event = "InsertEnter",
  },

  ["Pocco81/dap-buddy.nvim"] = { branch = "dev" },
  ["theHamsta/nvim-dap-virtual-text"] = {},
  ["rcarriga/nvim-dap-ui"] = {},
  ["mfussenegger/nvim-dap-python"] = {},
  ["nvim-telescope/telescope-dap.nvim"] = {},
  ["leoluz/nvim-dap-go"] = { module = "dap-go" },
  ["jbyuki/one-small-step-for-vimkind"] = { module = "osv" },

  -- DAP
  ["mfussenegger/nvim-dap"] = {
    opt = true,
    -- event = "BufReadPre",
    keys = { [[<leader>d]] },
    module = { "dap" },
    wants = { "nvim-dap-virtual-text", "dap-buddy.nvim", "nvim-dap-ui", "nvim-dap-python", "which-key.nvim" },
    config = function()
      require "custom.plugins.dap"
    end,
  },

  -- Test

  ["rcarriga/vim-ultest"] = {
    requires = { "vim-test/vim-test" },
    opt = false,
    keys = { "<leader>t" },
    cmd = {
      "TestNearest",
      "TestFile",
      "TestSuite",
      "TestLast",
      "TestVisit",
      "Ultest",
      "UltestNearest",
      "UltestDebug",
      "UltestLast",
      "UltestSummary",
    },
    module = "ultest",
    run = ":UpdateRemotePlugins",
    config = function()
      require "custom.plugins.test"
    end,
  },

  -- Python indent (follows the PEP8 style)
  ["Vimjas/vim-python-pep8-indent"] = {
    ft = { "python" },
  },

  -- Python-related text object
  ["jeetsukumaran/vim-pythonsense"] = {
    ft = { "python" },
  },

  ["lifepillar/vim-gruvbox8"] = { opt = true },
  ["navarasu/onedark.nvim"] = { opt = true },
  ["sainnhe/edge"] = { opt = true },
  ["sainnhe/sonokai"] = { opt = true },
  ["sainnhe/gruvbox-material"] = { opt = true },
  ["shaunsingh/nord.nvim"] = { opt = true },
  ["NTBBloodbath/doom-one.nvim"] = { opt = true },
  ["sainnhe/everforest"] = { opt = true },
  ["EdenEast/nightfox.nvim"] = { opt = true },
  ["rebelot/kanagawa.nvim"] = { opt = true },
  ["catppuccin/nvim"] = { as = "catppuccin" },

  -- Lazygit
  ["kdheepak/lazygit.nvim"] = {
    opt = true,
    -- keys = { [[<leader>gg]] },
  },

  ["ellisonleao/glow.nvim"] = { cmd = "Glow" },

  ["williamboman/nvim-lsp-installer"] = {},

  ["David-Kunz/jester"] = {},

  ["mrjones2014/legendary.nvim"] = {
    opt = true,
    keys = { [[<C-p>]] },
    wants = { "dressing.nvim" },
    config = function()
      require "custom.plugins.legendary"
    end,
    requires = { "stevearc/dressing.nvim" },
  },

  ["danymat/neogen"] = {
    config = function()
      require("neogen").setup {}
    end,
    cmd = { "Neogen" },
  },

  ["sunjon/shade.nvim"] = {},

  ["tpope/vim-surround"] = { event = "InsertEnter" },

  -- Lua
  ["folke/todo-comments.nvim"] = {
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {}
    end,
  },

  ["TimUntersberger/neogit"] = {},

  ["nvim-telescope/telescope-github.nvim"] = {},

  ["AckslD/nvim-neoclip.lua"] = {
    config = function()
      require "custom.plugins.neoclip"
    end,
  },

  -- Database
  ["tpope/vim-dadbod"] = {
    event = "VimEnter",
    requires = { "kristijanhusak/vim-dadbod-ui", "kristijanhusak/vim-dadbod-completion" },
    config = function()
      require "custom.plugins.dadbod"
    end,
  },

  -- note taking

  ["vimwiki/vimwiki"] = {},
  ["hrsh7th/cmp-buffer"] = { opt = true },
  ["hrsh7th/cmp-path"] = { opt = true },
  ["hrsh7th/cmp-nvim-lua"] = { opt = true },
  ["ray-x/cmp-treesitter"] = { opt = true },
  ["hrsh7th/cmp-cmdline"] = { opt = true },
  ["saadparwaiz1/cmp_luasnip"] = { opt = true },
  ["hrsh7th/cmp-nvim-lsp"] = { opt = true },
  ["L3MON4D3/LuaSnip"] = {
    branch = "master",
    wants = "friendly-snippets",
    config = function()
      require "custom.plugins.luasnip"
    end,
  },
  ["rafamadriz/friendly-snippets"] = { opt = true },

  ["ryanoasis/vim-devicons"] = {
    config = function()
      require "custom.plugins.devicons"
    end,
  },

  -- Terminal
  ["NvChad/nvterm"] = {
    config = function()
      require "plugins.configs.nvterm"
    end,
  },

  ["ThePrimeagen/git-worktree.nvim"] = {},
  ["nvim-neotest/neotest"] = {
    opt = true,
    wants = {
      "plenary.nvim",
      "nvim-treesitter",
      "FixCursorHold.nvim",
      "neotest-python",
      "neotest-plenary",
      "neotest-go",
      "neotest-jest",
      "neotest-vim-test",
    },
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/neotest-python",
      "nvim-neotest/neotest-plenary",
      "nvim-neotest/neotest-go",
      "haydenmeade/neotest-jest",
      "nvim-neotest/neotest-vim-test",
    },
    module = { "neotest" },
    config = function()
      require("plugins.configs.neotest").setup()
    end,
  },

  ["folke/which-key.nvim"] = {
    event = "VimEnter",
    config = function()
      require("plugins.configs.whichkey").setup()
    end,
  },

  ['NTBBloodbath/rest.nvim'] = {}
}
