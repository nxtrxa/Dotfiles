vim.pack.add({
	"https://github.com/mfussenegger/nvim-dap",
	"https://github.com/rcarriga/nvim-dap-ui",
	"https://github.com/nvim-neotest/nvim-nio",
	"https://github.com/jay-babu/mason-nvim-dap.nvim",
	"https://github.com/leoluz/nvim-dap-go",
	"https://github.com/theHamsta/nvim-dap-virtual-text",
})

require("nvim-dap-virtual-text").setup()

require("mason-nvim-dap").setup({
	automatic_installation = true,
	handlers = {
		function(config)
			require("mason-nvim-dap").default_setup(config)
		end,
	},
	ensure_installed = {
		"delve",
		"codelldb",
		"cppdbg",
	},
})

vim.api.nvim_set_hl(0, "DapBreak", { fg = "#740074" })
vim.api.nvim_set_hl(0, "DapStop", { fg = "#4a00ff" })
local breakpoint_icons = vim.g.have_nerd_font
		and {
			Breakpoint = "",
			BreakpointCondition = "",
			BreakpointRejected = "",
			LogPoint = "",
			Stopped = "",
		}
	or { Breakpoint = "●", BreakpointCondition = "⊜", BreakpointRejected = "⊘", LogPoint = "◆", Stopped = "" }

for type, icon in pairs(breakpoint_icons) do
	local tp = "Dap" .. type
	local hl = (type == "Stopped") and "DapStop" or "DapBreak"
	vim.fn.sign_define(tp, { text = icon, texthl = hl, numhl = hl })
end

local dapui = require("dapui")

dapui.setup({
	icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
	controls = {
		enabled = false,
		icons = {
			pause = "⏸",
			play = "▶",
			step_into = "⏎",
			step_over = "⏭",
			step_out = "⏮",
			step_back = "b",
			run_last = "▶▶",
			terminate = "⏹",
			disconnect = "⏏",
		},
	},
	expand_lines = true,
})

local dap = require("dap")

dap.listeners.after.event_initialized["dapui_config"] = dapui.open
dap.listeners.before.event_terminated["dapui_config"] = dapui.close
dap.listeners.before.event_exited["dapui_config"] = dapui.close

dap.configurations.c = {
	{
		name = "Launch file",
		type = "codelldb",
		request = "launch",
		MIMode = "gdb",
		miDebuggerPath = "/usr/bin/gdb",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopAtEntry = true,
	},
	{
		name = "Attach to gdbserver :1234",
		type = "codelldb",
		request = "launch",
		MIMode = "gdb",
		miDebuggerServerAddress = "localhost:1234",
		miDebuggerPath = "/usr/bin/gdb",
		cwd = "${workspaceFolder}",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
	},
}

dap.configurations.cpp = {
	{
		name = "Launch file",
		type = "cppdbg",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopAtEntry = true,
	},
	{
		name = "Attach to gdbserver :1234",
		type = "cppdbg",
		request = "launch",
		MIMode = "gdb",
		miDebuggerServerAddress = "localhost:1234",
		miDebuggerPath = "/usr/bin/gdb",
		cwd = "${workspaceFolder}",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
	},
}

require("dap-go").setup({
	delve = {
		detached = vim.fn.has("win32") == 0,
	},
})
