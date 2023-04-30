local settings = require('spsettings')

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "rust_analyzer" })

lvim.plugins = {
  'tpope/vim-surround',
  {
    'phaazon/hop.nvim',
    branch = 'v2',
    config = settings.setup_hop
  },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = settings.setup_catppuccin
  },
  {
    'simrat39/rust-tools.nvim',
    dependencies = { "neovim/nvim-lspconfig", "nvim-lua/plenary.nvim", "mfussenegger/nvim-dap" },
    config = settings.setup_rust_tools
  },
  {
    'rcarriga/nvim-notify',
    config = settings.setup_notify
  },
  { "MunifTanjim/nui.nvim" },
  {
    "folke/noice.nvim",
    config = settings.setup_noice,
  },
  {
    "tpope/vim-fugitive",
    cmd = {
      "G",
      "Git",
      "Gdiffsplit",
      "Gread",
      "Gwrite",
      "Ggrep",
      "GMove",
      "GDelete",
      "GBrowse",
      "GRemove",
      "GRename",
      "Glgrep",
      "Gedit"
    },
    ft = { "fugitive" }
  },
  'sbdchd/neoformat',
  'prettier/vim-prettier',
  {
    'ldelossa/nvim-dap-projects',
    config = function()
      require('nvim-dap-projects').search_project_config()
    end,
  },

  {
    'junegunn/vim-peekaboo',
    config = function()
      vim.g.peekaboo_delay = 800
    end
  },
  { 'Bekaboo/deadcolumn.nvim' },
  {
    'ThePrimeagen/harpoon',
    config = function()
      require("telescope").load_extension('harpoon')
      require("harpoon").setup({
        save_on_toggle = false,
        save_on_change = true,
        enter_on_sendcmd = false,
        tmux_autoclose_windows = false,
        -- filetypes that you want to prevent from adding to the harpoon list menu.
        excluded_filetypes = { "harpoon" },
        -- set marks specific to each git branch inside git repository
        mark_branch = false,
      })
    end
  },
}
