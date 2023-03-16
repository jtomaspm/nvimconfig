local linux_dir = os.getenv( "HOME" ) .. "/.vim/undodir"
local windows_dir = "C:/Users/jtoma/.vim/undodir"

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = linux_dir
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50


vim.diagnostic.config({
    virtual_text = {
        source = "always",  -- Or "if_many"
        prefix = '●', -- Could be '■', '▎', 'x', '●'
    },
    severity_sort = true,
    float = {
        source = "always",  -- Or "if_many"
    },
})


