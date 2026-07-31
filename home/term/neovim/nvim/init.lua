do
    vim.loader.enable()

    vim.g.mapleader = ' ';
    vim.g.maplocalleader = ' ';

    vim.g.have_nerd_font = true;

    vim.o.number = true
    vim.o.relativenumber = true
    vim.o.mouse = 'a'
    vim.schedule(function() vim.o.clipboard = 'unnamedplus' end);
    vim.o.breakindent = true
    vim.o.undofile = true
    vim.o.ignorecase = true
    vim.o.smartcase = true
    vim.o.signcolumn = 'yes'

    vim.o.updatetime = 250
    vim.o.timeoutlen = 300

    vim.o.splitright = true
    vim.o.splitbelow = true

    vim.o.list = true

    vim.opt.listchars = {
       tab = "│ ",      -- Smooth vertical line (Nerd Font or Unicode)
       trail = "·",     -- Small, faint center dot
       nbsp = "␣",      -- Standard open space indicator for non-breaking spaces
    }

    vim.opt.expandtab = true
    vim.opt.shiftwidth = 2
    vim.opt.tabstop = 2
    vim.opt.softtabstop = 2

    vim.o.inccommand = 'split'

    vim.o.cursorline = true

    vim.o.scrolloff = 10

    vim.o.confirm = true

    vim.keymap.set('n', '<Tab>', '<cmd>bnext<CR>', { desc = 'Next buffer', })
    vim.keymap.set('n', '<S-Tab>', '<cmd>bprevious<CR>', { desc = 'Previous buffer', })

    vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Focus left window' })
    vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Focus lower window' })
    vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Focus upper window' })
    vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Focus right window' })

    vim.keymap.set('n', '<C-q>', '<cmd>bdelete<CR>', { desc = 'Close current buffer' })

    vim.keymap.set('n', '<C-up>', '<cmd>resize +2:<CR>', { desc = 'Resize horz up', })
    vim.keymap.set('n', '<C-down>', '<cmd>resize -2:<CR>', { desc = 'Resize horz down', })
    vim.keymap.set('n', '<C-right>', '<cmd>vertical resize +2:<CR>', { desc = 'Resize vert right', })
    vim.keymap.set('n', '<C-left>', '<cmd>vertical resize -2:<CR>', { desc = 'Resize vert left', })

    vim.keymap.set('n', '<leader>t', '<cmd>terminal fish<CR>', { desc = 'Spawn terminal' })

end

--[[
local current_script = debug.getinfo(1, 'S').source:sub(2)
local plugins_path = vim.fn.fnamemodify(current_script, ':p:h') .. '/lua/plugins'

print(plugins_path)

for name, type in vim.fs.dir(plugins_path) do
    if type == 'file' and name:match("%.lua$") then
        local module_name = name:sub(1, -5)
        pcall(require, 'plugins.' .. module_name)
    end
end
]]

local util = require('util')

-- Telescope
do
    vim.pack.add({
        util.gh('nvim-telescope/telescope.nvim'),
        util.gh('nvim-lua/plenary.nvim'),
	util.gh('nvim-telescope/telescope-file-browser.nvim')
    })
    require('telescope').setup {}
    require('telescope').load_extension 'file_browser'

    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
    vim.keymap.set("n", "<leader>b", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")
end

-- Oil
do
    vim.pack.add({
        util.gh('stevearc/oil.nvim')
    })
    require('oil').setup{
        float = {
	    padding = 20,
	    border = 'solid',
	},
    }

    vim.keymap.set('n', '<leader>o', '<cmd>Oil --float<CR>')
end

-- Blink
--[[
do
    vim.pack.add({
        util.gh('saghen/blink.lib'),
        util.gh('saghen/blink.cmp')
    })
    local cmp = require('blink.cmp')
    cmp.build():pwait()
    cmp.setup {
        keymap = {
            preset = 'default'
        },
    }
end
]]

-- nvim-lspconfig
do
    vim.pack.add{
        util.gh('neovim/nvim-lspconfig')
    }
end

-- Trouble
do
    vim.pack.add{
        util.gh('folke/trouble.nvim'),
    }
    require('trouble').setup()
    vim.keymap.set('n', '<leader>xx', '<cmd>Trouble diagnostics toggle<CR>', { desc = 'Diagnostics (Trouble)' })
end


-- mini.nvim
do
    vim.pack.add({
        util.gh('nvim-mini/mini.nvim'),
    })
    require('mini.statusline').setup{}
    require('mini.tabline').setup{}
    require('mini.icons').setup{}
    require('mini.pairs').setup{}
    require('mini.indentscope').setup{}
    require('mini.move').setup{
        mappings = {
            left = '<leader>h',
            right = '<leader>l',
            down = '<leader>j',
            up = '<leader>k',

            line_left = '<leader>h',
            line_right = '<leader>l',
            line_down = '<leader>j',
            line_up = '<leader>k',
        },
    }
    require('mini.completion').setup{}
    vim.opt.completeopt = { "menuone", "noinsert" }
end

vim.lsp.enable('lua_ls')
vim.lsp.enable('nil_ls')
