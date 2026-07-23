return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        build = ":TSUpdate",
        opts = {
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
            ensure_installed = {
                "c",
                "c3",
                "cpp",
                "rust",
                "lua",
                "vim",
                "vimdoc",
                "query",
                "javascript",
                "php",
                "html",
                "css",
                "scss",
                "vue",
                "phpdoc",
                "markdown",
                "markdown_inline",
                "php_only",
                "blade",
                "typescript",
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<leader>ss",
                    node_incremental = "<leader>si",
                    scope_incremental = "<leader>sc",
                    node_decremental = "<leader>sd",
                },
            },
        },

        blade_config = function(_, opts)
            local parser_blade = require("nvim-treesitter.parsers").blade

            parser_blade = {
                install_info = {
                    url = "https://github.com/EmranMR/tree-sitter-blade",
                    files = { "src/parser.c" },
                    branch = "main",
                },
                filetype = "blade",
            }
        end,

        c3_config = function(_, opts)
            local parser_c3 = require("nvim-treesitter.parsers").c3
            parser_c3 = {
                install_info = {
                    url = "https://github.com/c3lang/tree-sitter-c3",
                    files = { "src/parser.c", "src/scanner.c" },
                    branch = "main",
                },
                filetype = "c3",
            }

        end,
        vim.filetype.add({
            pattern = {
                [".*%.blade%.php"] = "blade",
            },
        }),

        nex_confid = function(_, opts)
            vim.treesitter.language.register('nex', 'html')
        end,
    },
}
