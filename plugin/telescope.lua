vim.pack.add({
    "https://github.com/nvim-telescope/telescope.nvim",
    "https://github.com/nvim-lua/plenary.nvim"
})

require("telescope").setup({
    pickers = {
        find_files = {
            previewer = false,
            theme = "dropdown",
            layout_config = {
                height = 40,
                width = 70,
            },
        },
    },
    extensions = {
        fzf = {
            fuzzy = true,                   -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true,    -- override the file sorter
            case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        },
        file_browser = {
            path = "%:p:h",
            cwd = vim.fn.expand("%:p:h"),
            theme = "dropdown",
            initial_mode = "normal",
            hijack_netrw = true,
            previewer = false,
            grouped = true,
            layout_config = {
                height = 40,
                width = 70,
            },
        },
    },
})

-- keybinds
vim.keymap.set('n', '<leader>a', "<cmd>Telescope find_files<cr>", {desc = "Opening telescope files"})
