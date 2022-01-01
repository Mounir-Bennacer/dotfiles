vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
end
vim.api.nvim_command("packadd packer.nvim")
-- reference for new plugins: https://github.com/alpha2phi/dotfiles/tree/main/config/nvim/lua
-- returns the require for use in `config` parameter of packer's use
-- expects the name of the config file
function get_setup(name)
  return string.format('require("setup/%s")', name)
end

return require("packer").startup({
  function(use)
    -- Packer can manage itself
    use({ "wbthomason/packer.nvim" })
    use({ "nathom/filetype.nvim", config = get_setup("filetype") })
    use({ "EdenEast/nightfox.nvim", config = get_setup("themes.nightfox") })
    use({ "kyazdani42/nvim-web-devicons" })
    use({
      "nvim-lualine/lualine.nvim",
      config = get_setup("lualine"),
      event = "VimEnter",
      requires = { "kyazdani42/nvim-web-devicons", opt = true },
    })
    use({
      "folke/zen-mode.nvim",
      config = get_setup("zen-mode"),
    })
    use({
      "norcalli/nvim-colorizer.lua",
      event = "BufReadPre",
      config = get_setup("colorizer"),
    })
    -- Post-install/update hook with neovim command
    use({
      "nvim-treesitter/nvim-treesitter",
      config = get_setup("treesitter"),
      run = ":TSUpdate",
    })
    use({ "nvim-treesitter/playground" })
    use({
      "romgrk/nvim-treesitter-context",
      config = function()
        require("treesitter-context.config").setup({ enable = true })
      end,
    })
    use({
      "folke/todo-comments.nvim",
      requires = "nvim-lua/plenary.nvim",
      config = function()
        require("todo-comments").setup({})
      end,
    })
    use({ "junegunn/vim-easy-align" })
    use({ "antoinemadec/FixCursorHold.nvim" })
    use({ "nvim-treesitter/nvim-treesitter-textobjects" })
    use({
      "windwp/nvim-autopairs",
      after = "nvim-cmp",
      config = get_setup("autopairs"),
    })
    use({"kevinoid/vim-jsonc"})
    use({
      "hrsh7th/nvim-cmp",
      requires = {
        { "David-Kunz/cmp-npm" },
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-nvim-lua" },
        { "hrsh7th/cmp-buffer" },
        { "quangnguyen30192/cmp-nvim-ultisnips" },
        { "octaltree/cmp-look" },
        { "hrsh7th/cmp-path" },
        { "hrsh7th/cmp-calc" },
        { "f3fora/cmp-spell" },
        { "hrsh7th/cmp-emoji" },
        { "ray-x/cmp-treesitter" },
        { "hrsh7th/cmp-cmdline" },
        { "hrsh7th/cmp-nvim-lsp-document-symbol" },
        { "hrsh7th/cmp-path" },
        { "hrsh7th/cmp-cmdline" },
        { "hrsh7th/vim-vsnip" },
        { "hrsh7th/cmp-vsnip" },
        { "hrsh7th/vim-vsnip-integ" },
      },
      config = get_setup("cmp"),
    })
    use({ "kyazdani42/nvim-tree.lua", config = get_setup("tree") })
    use({ "windwp/nvim-spectre", event = "VimEnter" })
    use({
      "lewis6991/gitsigns.nvim",
      requires = { "nvim-lua/plenary.nvim" },
      config = get_setup("gitsigns"),
      event = "BufReadPre",
    })

    use("p00f/nvim-ts-rainbow")
    use("kdheepak/lazygit.nvim")

    -- use({ "jose-elias-alvarez/null-ls.nvim", config = get_setup("null-ls") })
    use({ "jose-elias-alvarez/null-ls.nvim" })
    use({ "jose-elias-alvarez/nvim-lsp-ts-utils" })
    use({
      "neovim/nvim-lspconfig",
      config = function()
        get_setup("lsp")
        get_setup("dap")
      end,
    })
    use({ "williamboman/nvim-lsp-installer", config = get_setup("lsp-installer") })
    use({ "ray-x/lsp_signature.nvim", config = get_setup("signature") })
    use({ "metakirby5/codi.vim" })
    use({
      "numToStr/Comment.nvim",
      opt = true,
      keys = { "gc", "gcc" },
      config = function()
        require("Comment").setup({
          mappings = { extra = true },
        })
      end,
    })
    use({
      "tanvirtin/vgit.nvim",
      event = "BufWinEnter",
      config = function()
        require("vgit").setup()
      end,
    })
    use({
      "sindrets/diffview.nvim",
      cmd = {
        "DiffviewOpen",
        "DiffviewClose",
        "DiffviewToggleFiles",
        "DiffviewFocusFiles",
      },
    })
    use({ "unblevable/quick-scope", event = "VimEnter" })
    use({ "voldikss/vim-floaterm", event = "VimEnter" })
    use({
      "folke/which-key.nvim",
      config = get_setup("whichkey"),
    })
    use({
      "nvim-telescope/telescope.nvim",
      module = "telescope",
      cmd = "Telescope",
      requires = {
        { "nvim-lua/popup.nvim" },
        { "nvim-lua/plenary.nvim" },
        { "nvim-telescope/telescope-project.nvim" },
        { "nvim-telescope/telescope-symbols.nvim" },
        { "nvim-telescope/telescope-media-files.nvim" },
        { "nvim-telescope/telescope-github.nvim" },
        { "fhill2/telescope-ultisnips.nvim" },
        { "cljoly/telescope-repo.nvim" },
        { "jvgrootveld/telescope-zoxide" },
        { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
        { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
        { "nvim-telescope/telescope-frecency.nvim", requires = { "tami5/sql.nvim" } },
        { "nvim-telescope/telescope-vimspector.nvim", event = "BufWinEnter" },
        { "nvim-telescope/telescope-dap.nvim" },
      },
      config = get_setup("telescope"),
    })
    use({ "nvim-telescope/telescope-file-browser.nvim" })
    use({ "onsails/lspkind-nvim", requires = { { "famiu/bufdelete.nvim" } } })
    use({ "tpope/vim-repeat" })
    use({ "tpope/vim-surround" })
    use({ "wellle/targets.vim" })
    use({
      "phaazon/hop.nvim",
      event = "BufReadPre",
      config = get_setup("hop"),
    })
    use({ "Shatur/neovim-session-manager", config = get_setup("session") })
    use({ "windwp/nvim-ts-autotag" })
    use({ "pineapplegiant/spaceduck", branch = "main" })

    use({
      "winston0410/range-highlight.nvim",
      requires = { { "winston0410/cmd-parser.nvim" } },
      config = get_setup("range-highlight"),
    })
    use({ "filipdutescu/renamer.nvim", config = get_setup("renamer") })
    use({ "luukvbaal/stabilize.nvim", config = get_setup("stabilize") })

    use({ "drewtempelmeyer/palenight.vim" })
    use({ "fatih/vim-go" })
    use({ "mfussenegger/nvim-dap" })
    use({ "nvim-telescope/telescope-dap.nvim" })
    use({ "mfussenegger/nvim-dap-python" }) -- Python
    use({ "hrsh7th/vim-vsnip-integ" })
    use({ "theHamsta/nvim-dap-virtual-text" })
    use({ "rcarriga/nvim-dap-ui" })
    use({ "Pocco81/DAPInstall.nvim" })
    use({ "jbyuki/one-small-step-for-vimkind" })
    use({ "puremourning/vimspector" })
    use({ "nvim-telescope/telescope-vimspector.nvim" })
    use({
      "simrat39/symbols-outline.nvim",
      cmd = { "SymbolsOutline" },
      setup = get_setup("outline"),
    })
    use({ "github/copilot.vim" })
    use({
      "rcarriga/vim-ultest",
      config = get_setup("test"),
      run = ":UpdateRemotePlugins",
      requires = { "vim-test/vim-test" },
    })
    use({ "ellisonleao/glow.nvim" })
    use({ "sainnhe/gruvbox-material" })
    use({ "folke/tokyonight.nvim" })
    use({ "sainnhe/everforest" })
    use({ "sainnhe/edge" })
    use({ "sainnhe/sonokai" })
    use({
      "catppuccin/nvim",
      as = "catppuccin",
      config = function()
        require("catppuccin").setup({})
      end,
    })
    use({ "rebelot/kanagawa.nvim" })
    use({ "mhartington/oceanic-next" })
    use({ "bluz71/vim-nightfly-guicolors" })
    use({ "dracula/vim" })
    use({ "marko-cerovac/material.nvim" })
    use({ "fenetikm/falcon" })
    use({ "shaunsingh/nord.nvim" })
    use({ "NLKNguyen/papercolor-theme" })
    use({ "navarasu/onedark.nvim" })
    use({
      "rcarriga/nvim-notify",
      event = "VimEnter",
      config = function()
        vim.notify = require("notify")
      end,
    })
    use({
      "ahmedkhalf/project.nvim",
      event = "VimEnter",
      config = get_setup("project"),
    })
    use({
      "tami5/lspsaga.nvim",
      config = get_setup("lspsaga"),
    })
    use({ "sbdchd/neoformat" })
    use({ "kevinhwang91/nvim-bqf" })
    use({ "andymass/vim-matchup", event = "CursorMoved" })
    use({
      "folke/trouble.nvim",
      event = "VimEnter",
      cmd = { "TroubleToggle", "Trouble" },
      config = function()
        require("trouble").setup({ auto_open = false })
      end,
    })
    use({
      "SirVer/ultisnips",
      requires = { { "honza/vim-snippets", rtp = "." }, "mlaursen/vim-react-snippets" },
      config = function()
        vim.g.UltiSnipsExpandTrigger = "<Plug>(ultisnips_expand)"
        vim.g.UltiSnipsJumpForwardTrigger = "<Plug>(ultisnips_jump_forward)"
        vim.g.UltiSnipsJumpBackwardTrigger = "<Plug>(ultisnips_jump_backward)"
        vim.g.UltiSnipsListSnippets = "<c-x><c-s>"
        vim.g.UltiSnipsRemoveSelectModeMappings = 0
      end,
    })
    use({
      "SmiteshP/nvim-gps",
      config = function()
        require("nvim-gps").setup()
      end,
    })

    -- Development workflow
    use({ "voldikss/vim-browser-search", event = "VimEnter" })
    use({ "tyru/open-browser.vim", event = "VimEnter" })
    use({
      "kkoomen/vim-doge",
      run = ":call doge#install()",
      config = get_setup("doge"),
      event = "VimEnter",
    })
    use({
      "stevearc/gkeep.nvim",
      run = ":UpdateRemotePlugins",
    })
    use({
      "michaelb/sniprun",
      run = "bash install.sh",
      config = get_setup("sniprun"),
    })

    -- Better configuration
    use({
      "max397574/better-escape.nvim",
      config = get_setup("better-escape"),
      -- config = function()
      --   require("better_escape").setup()
      -- end,
    })
    use({
      "hrsh7th/vim-vsnip",
      event = "VimEnter",
      requires = {
        "rafamadriz/friendly-snippets",
        "cstrap/python-snippets",
        "ylcnfrht/vscode-python-snippet-pack",
        "xabikos/vscode-javascript",
        "golang/vscode-go",
        "rust-lang/vscode-rust",
      },
    })
    use({ "hrsh7th/cmp-vsnip" })
    use({
      "AckslD/nvim-neoclip.lua",
      config = function()
        require("neoclip").setup()
      end,
    })

    if packer_bootstrap then
      print("Setting up Neovim. Restart required after installation!")
      require("packer").sync()
    end
  end,
  config = {
    display = {
      open_fn = require("packer.util").float,
    },
    profile = {
      enable = true,
      threshold = 1, -- the amount in ms that a plugins load time must be over for it to be included in the profile
    },
  },
})
