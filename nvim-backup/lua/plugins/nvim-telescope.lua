return {
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make"
            },
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            local telescope = require("telescope")
            local actions = require("telescope.actions")

            telescope.setup({
                defaults = {
                    path_display = { "truncate " },
                    layout_config = {
                        horizontal = {
                            preview_cutoff = 0,
                        },
                    },
					preview = {
						treesitter = false,
					},
                    mappings = {
                        i = {
                            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
                            ["<C-j>"] = actions.move_selection_next, -- move to next result
                            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                        },
                    },
                },
            })

            telescope.load_extension("fzf")

            local map = vim.keymap.set -- for conciseness

            map("n", "<C-p>", "<cmd>Telescope find_files hidden=true no_ignore=true<cr>", { desc = "Fuzzy find files in cwd" })
            map("n", "<leader>tr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
            map("n", "<leader>tg", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
            map("n", "<leader>tc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
			map("n", "<leader>tk", ":Telescope keymaps<CR>", { desc = "Telescope keymaps" })
        end
    },
    {
        'nvim-telescope/telescope-ui-select.nvim',
        config = function()
            require("telescope").setup {
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {}
                    }
                }
            }
            require("telescope").load_extension("ui-select")
        end
    },
}
