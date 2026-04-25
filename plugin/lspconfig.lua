vim.pack.add({ "https://github.com/neovim/nvim-lspconfig" })

local lspcore = require("lspcore")
local capabilities = lspcore.capabilities()

vim.lsp.config("*", {
    capabilities = capabilities,
})

vim.lsp.config("gopls", {
    capabilities = capabilities,
    settings = {
        gopls = {
            semanticTokens = false,
        },
    },
})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = lspcore.on_attach,
})

vim.lsp.enable({
    "lua_ls",
    -- "cssls",
    -- "gopls",
    -- "svelte",
    -- "rust_analyzer",
})
