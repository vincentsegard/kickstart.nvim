M = {}

-- Cursor
vim.opt.guicursor= "n-v-c-sm:block,i-ci:ver30-iCursor-blinkwait300-blinkon200-blinkoff150"

-- Set highlight on search
vim.o.hlsearch = true

-- Make line numbers default
-- full gutters with absolute & relative:
-- vim.opt.nu = true
-- vim.opt.relativenumber = true
-- vim.o.statuscolumn = "%s %l %r "
-- gutter with relative (absolute just current line)
vim.opt.number = true
vim.opt.relativenumber = true
-- switch between relative and absolute (when sharing view with coworkers)
vim.keymap.set('n', '<leader>C', '<CMD>set rnu!<CR>', { desc = '[C]olumn numbers flip' })
-- Enable mouse mode
vim.o.mouse = 'a'

-- Delay for keymap in ms (if nothing typed then keymap is not activated)
vim.o.timeoutlen = 300

-- Sync clipboard between OS and Neovim.
-- Remove this option if you want your OS clipboard to remain independent.
-- May need to install xclip or wl-copy (and ssh maybe lemonade)
vim.o.clipboard = "unnamedplus"

if vim.fn.getenv("SSH_CONNECTION") ~= vim.NIL then
  local function paste()
    return {
      vim.fn.split(vim.fn.getreg(""), "\n"),
      vim.fn.getregtype(""),
    }
  end

  vim.g.clipboard = {
    name = 'OSC 52',
    copy = {
      ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
      ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
    },
    paste = {
      -- ['+'] = require('vim.ui.clipboard.osc52').paste('+'),
      -- ['*'] = require('vim.ui.clipboard.osc52').paste('*'),
      ['+'] = paste,
      ['*'] = paste,
    },
  }
end
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true
vim.opt.wrap = true
-- go back to line without breaking a word 
vim.opt.linebreak = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.o.signcolumn = 'yes:2'

-- Decrease update time
vim.o.updatetime = 250

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect,preview'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- Set default tab at 4 and use space as characters, can be override by plugins
vim.opt.smartindent = false
vim.opt.cindent = true          -- Autoindent new lines, smarter? (experimental)
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- title
vim.opt.title = true

-- Display at least X lines before/after cursolr
vim.opt.scrolloff = 10

-- TRYING SOME CUSTOM CONF
-- remove the ~ from end of buffer
vim.opt.fillchars:append({ eob = ' ' })

-- Allow hovering in bufferline
vim.opt.mousemoveevent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
-- persistent undo
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("data") .. "undo"

return M
