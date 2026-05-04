vim.opt.clipboard:append({ "unnamedplus" }) -- Clipboard

-- UI Stuff
vim.opt.nu = true
vim.opt.scrolloff = 8
vim.opt.relativenumber = true
vim.opt.pumheight = 6
-- Tabs as method of indenting
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.termguicolors = true
-- Search options
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Misc options
vim.g.mapleader = " "
vim.opt.cursorline = true
vim.opt.updatetime = 50
vim.opt.listchars:append("eol:↴")
vim.opt.list = true
vim.o.autoread = true
vim.opt.undofile = true

-- Automatically reload files changed outside Neovim
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {
    pattern = "*",
    command = "checktime",
})

-- Notify user when a buffer is reloaded automatically
vim.api.nvim_create_autocmd("FileChangedShellPost", {
    pattern = "*",
    callback = function()
        vim.notify("File changed on disk. Buffer reloaded.", vim.log.levels.INFO)
    end,
})

vim.diagnostic.config({
    virtual_text = false,
})


-- remaps
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { noremap = true })
vim.keymap.set('n', '<A-h>', ':tabprevious<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<A-l>', ':tabnext<CR>', { noremap = true, silent = true })
vim.keymap.set('t', '<A-h>', [[<C-\><C-n>:tabprevious<CR>]], { noremap = true, silent = true })
vim.keymap.set('t', '<A-l>', [[<C-\><C-n>:tabnext<CR>]], { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>tn', ':tabnew<CR>', { noremap = true, silent = true })


-- for windows use
if vim.loop.os_uname().sysname == "Windows_NT" then
    vim.o.shell = "pwsh.exe"
end

-- new UI
require("vim._core.ui2").enable({})

-- Loader
if vim.loader then
    vim.loader.enable()
end
