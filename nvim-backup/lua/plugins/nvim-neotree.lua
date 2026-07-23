return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
		"antosha417/nvim-lsp-file-operations",
		"folke/snacks.nvim",
	},
	lazy = false,
	config = function()
		require("neo-tree").setup({
			sources = { "filesystem", "buffers", "git_status" },
			open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
			filesystem = {
				bind_to_cwd = false,
				follow_current_file = { enabled = true },
				use_libuv_file_watcher = true,
			},
			window = {
				position = "left",
				---@type table<string, string | fun(state: table) | { [1]: fun(state: table), desc?: string, config?: table }>
				mappings = {
					["l"] = "open",
					["h"] = "close_node",
					["E"] = "expand_all_nodes",
					["Z"] = "close_all_nodes",
					["<space>"] = "none",
					["Y"] = {
						function(state)
							local node = state.tree:get_node()
							local path = node:get_id()
							vim.fn.setreg("+", path, "c")
						end,
						desc = "Copy Path to Clipboard",
					},
					["O"] = {
						function(state)
							require("lazy.util").open(state.tree.get_node.path, { system = true })
						end,
						desc = "Open with System Application",
					},
					["P"] = { "toggle_preview", config = { use_float = false } },
				},
			},
			default_component_configs = {
				indent = {
					with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
					expander_collapsed = "",
					expander_expanded = "",
					expander_highlight = "NeoTreeExpander",
				},
				git_status = {
					symbols = {
						unstaged = "󰄱",
						staged = "󰱒",
					},
				},
			},
		})

		local fullscreen = false
		local saved_view = nil

		vim.keymap.set("n", "|", function()
			if not fullscreen then
				saved_view = vim.fn.winsaveview()
				vim.cmd("Neotree reveal")
				vim.cmd("only")
				fullscreen = true
			else
				vim.cmd("Neotree close")
				if saved_view then
					vim.fn.winrestview(saved_view)
				end
				fullscreen = false
			end
		end, { desc = "Neo-tree fullscreen" })
	end,
}
