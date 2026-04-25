vim.pack.add({"http://github.com/nickjvandyke/opencode.nvim"})

vim.g.opencode_opts = {
    provider = {
        enabled = "terminal",
        terminal = {
            -- ...
        }
    }
}
vim.keymap.set({ "n", "x" }, "<leader>oa", function() require("opencode").ask("@this: ", { submit = true }) end, { desc = "Ask opencode…" })

