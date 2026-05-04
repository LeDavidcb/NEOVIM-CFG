vim.pack.add({
    "https://github.com/L3MON4D3/LuaSnip",
    "https://github.com/rafamadriz/friendly-snippets",
})

-- Defer loading luasnip snippets until InsertEnter to speed up startup.
vim.api.nvim_create_autocmd("InsertEnter", {
  callback = function()
    -- run once
    pcall(vim.api.nvim_del_autocmd, vim.v.this_autocmd)
    local ok, loader = pcall(require, "luasnip.loaders.from_vscode")
    if not ok or not loader then
      return
    end
    -- use lazy_load to avoid scanning all snippets synchronously at startup
    pcall(loader.lazy_load)
  end,
})
