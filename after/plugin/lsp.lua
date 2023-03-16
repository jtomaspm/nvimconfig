local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
    'tsserver',
    'eslint',
    'lua_ls',
    'rust_analyzer',
    'pyright'
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
    ['Return'] = cmp.mapping.confirm({ select = true }),
    ['C-Space'] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr, remap = false}

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>ws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>d",  "<cmd>Telescope diagnostics<CR>", opts)
    vim.keymap.set("n", "<leader>gn", function() vim.lsp.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "<leader>gp", function() vim.lsp.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<C-m>", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>gr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>rr", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("n", "<leader>hh", function() vim.lsp.buf.signature_help() end, opts)
end)


lsp.setup()
