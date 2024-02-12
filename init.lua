--[[
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
--]]
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

if vim.loader then
  vim.loader.enable()
end

-- [[ Install `lazy.nvim` plugin manager ]]
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- [[ Configure plugins ]]
require('lazy').setup({
  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      indent = {
	char = "│",
	tab_char = "│",
      },
      scope = { enabled = true },
      exclude = {
	filetypes = {
	  "help",
	  "alpha",
	  "dashboard",
	  "neo-tree",
	  "Trouble",
	  "trouble",
	  "lazy",
	  "mason",
	  "notify",
	  "toggleterm",
	  "lazyterm",
	},
      },
    },
    main = "ibl",
  },

  -- notification timeout
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 20000,
    },
  },

  -- ZenMode 
  { "folke/zen-mode.nvim", opts = {} },

  -- Twilight
  { "folke/twilight.nvim", opts = {} },

  -- animation of cursor when moving
  {
    "echasnovski/mini.animate",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.scroll = {
	enable = false,
      }
    end,
  },

  -- tab customization
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
      { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
      { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
    },
    opts = {
      options = {
	mode = "tabs",
	show_buffer_close_icons = false,
	show_close_icon = false,
      },
    },
  },

  -- rails
  { 'tpope/vim-rails' },

  -- tmux shortcuts free
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },

  --navigate from neovim to split terminal
  {
    'numToStr/Navigator.nvim',
    opts = {
      vim.keymap.set({'n', 't'}, '<A-left>', '<CMD>NavigatorLeft<CR>'),
      vim.keymap.set({'n', 't'}, '<A-right>', '<CMD>NavigatorRight<CR>'),
      vim.keymap.set({'n', 't'}, '<A-up>', '<CMD>NavigatorUp<CR>'),
      vim.keymap.set({'n', 't'}, '<A-down>', '<CMD>NavigatorDown<CR>'),
    }
  },

  -- 'gc' to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },


  -- 'git diff old history'
  {
    'sindrets/diffview.nvim',
    config = function()
      local diffview = require('diffview')
      diffview:setup()
      vim.keymap.set('n', '<leader>f', '<CMD>DiffviewFileHistory %<CR>', { desc = 'Git history [F]ile' })
      vim.keymap.set('n', '<leader>g', '<CMD>DiffviewFileHistory<CR>', { desc = '[G]it history all' })
    end

  },

  { import = 'ninange.plugins' },
  { import = 'kickstart.plugins' },
  { import = 'config' },

}, {})
