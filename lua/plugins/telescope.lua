return {
    'nvim-telescope/telescope.nvim',
    lazy = false,
    dependencies = {
        'nvim-lua/plenary.nvim',
        "nvim-telescope/telescope-file-browser.nvim",
        -- optional but recommended
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    opts = {
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
    },
    config = function(_, opts)
        require("telescope").setup(opts)
    end,
    keys = {
        { "<leader>a", "<cmd>Telescope find_files<cr>" }
    }
}
