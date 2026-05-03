vim.pack.add({
    { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("^1") },
})
local cmp = require('blink.cmp')


cmp.setup({
    keymap = {
        preset = "enter",
        ["<C-k>"] = { "select_prev", "fallback" },
        ["<C-j>"] = { "select_next", "fallback" },
    },
    signature = { enabled = true },
    completion = { documentation = { auto_show = true, auto_show_delay_ms = 200 } },
    sources = { default = { 'lsp', 'path', 'snippets', 'buffer' } },
    fuzzy = { implementation = "rust" },
})
