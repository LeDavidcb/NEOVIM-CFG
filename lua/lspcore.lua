local M = {}

local function set_lsp_keymaps(bufnr)
    local map = function(lhs, rhs, desc)
        vim.keymap.set("n", lhs, rhs, {
            buffer = bufnr,
            silent = true,
            noremap = true,
            desc = desc,
        })
    end

    map("gD", vim.lsp.buf.declaration, "LSP declaration")
    map("<leader>lw", vim.lsp.buf.code_action, "LSP code action")
    map("<leader>lr", vim.lsp.buf.rename, "LSP rename")
    map("<leader>la", vim.lsp.buf.hover, "LSP hover")
    map("gd", vim.lsp.buf.definition, "LSP definition")
    map("gi", vim.lsp.buf.implementation, "LSP implementation")
    map("<space>ld", vim.diagnostic.open_float, "Line diagnostics")

    map("<space>ls", function()
        local ok, telescope = pcall(require, "telescope.builtin")
        if ok then
            telescope.lsp_references()
            return
        end
        vim.lsp.buf.references()
    end, "LSP references")
end

function M.on_attach(ev)
    local client_id = ev.data and ev.data.client_id
    local client = client_id and vim.lsp.get_client_by_id(client_id) or nil
    if not client then
        return
    end

    set_lsp_keymaps(ev.buf)

    if client.name == "gopls" then
        client.server_capabilities.semanticTokensProvider = nil
    end
end

function M.capabilities()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    local ok, blink = pcall(require, "blink.cmp")
    if ok and type(blink.get_lsp_capabilities) == "function" then
        capabilities = blink.get_lsp_capabilities(capabilities)
    end
    return capabilities
end

return M
