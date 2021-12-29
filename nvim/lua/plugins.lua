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
        require("todo-comments").setup({
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        })
      end,
    })
    use({ "nvim-treesitter/nvim-treesitter-textobjects" })
    use({
      "windwp/nvim-autopairs",
      after = "nvim-cmp",
      config = get_setup("autopairs"),
    })
    use({
      "hrsh7th/nvim-cmp",
      requires = {
        { "David-Kunz/cmp-npm" },
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-nvim-lua" },
        { "hrsh7th/cmp-buffer" },
        { "hrsh7th/cmp-path" },
        { "hrsh7th/cmp-cmdline" },
        { "hrsh7th/vim-vsnip" },
        { "hrsh7th/cmp-vsnip" },
        { "hrsh7th/vim-vsnip-integ" },
        { "f3fora/cmp-spell", { "hrsh7th/cmp-calc" }, { "hrsh7th/cmp-emoji" } },
      },
      config = get_setup("cmp"),
    })
    use({ "kyazdani42/nvim-tree.lua", config = get_setup("tree") })

    use({
      "lewis6991/gitsigns.nvim",
      requires = { "nvim-lua/plenary.nvim" },
      config = get_setup("gitsigns"),
      event = "BufReadPre",
    })

    use("p00f/nvim-ts-rainbow")
    use("kdheepak/lazygit.nvim")

    use({ "jose-elias-alvarez/null-ls.nvim", config = get_setup("null-ls") })
    use({ "neovim/nvim-lspconfig", config = get_setup("lsp") })
    use({ "williamboman/nvim-lsp-installer", config = get_setup("lsp-installer") })
    use({ "ray-x/lsp_signature.nvim", config = get_setup("signature") })
    use({ "metakirby5/codi.vim" })
    use({
      "numToStr/Comment.nvim",
      opt = true,
      keys = { "gc", "gcc" },
      config = get_setup("comment"),
    })
    use({
      "nvim-telescope/telescope.nvim",
      module = "telescope",
      cmd = "Telescope",
      requires = {
        { "nvim-lua/popup.nvim" },
        { "nvim-lua/plenary.nvim" },
        { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
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
    use({ "Mofiqul/dracula.nvim" })
    use({ "mfussenegger/nvim-dap" })
    use({ "nvim-telescope/telescope-dap.nvim" })
    use({ "mfussenegger/nvim-dap-python" }) -- Python
    use({ "hrsh7th/vim-vsnip" })
    use({ "hrsh7th/vim-vsnip-integ" })
    use({ "marko-cerovac/material.nvim" })
    use({ "NLKNguyen/papercolor-theme" })
    use({ "theHamsta/nvim-dap-virtual-text" })
    use({ "puremourning/vimspector" })
    use({ "nvim-telescope/telescope-vimspector.nvim" })
    use({
      "simrat39/symbols-outline.nvim",
      cmd = { "SymbolsOutline" },
      setup = get_setup("outline"),
    })
    use({ "github/copilot.vim" })
    use({
      "neoclide/coc.nvim",
      branch = "release",
    })
    use({ "vim-test/vim-test" })
    use({ "ellisonleao/glow.nvim" })
    if packer_bootstrap then
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
