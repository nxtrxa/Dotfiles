local M = {}

local diagnostic_signs = {
	Error = " ",
	Warn = " ",
	Hint = "",
	Info = "",
}

M.setup = function()
	vim.diagnostic.config({
		signs = {
			text = {
				[vim.diagnostic.severity.ERROR] = " ",
				[vim.diagnostic.severity.WARN] = " ",
				[vim.diagnostic.severity.HINT] = "󰠠 ",
				[vim.diagnostic.severity.INFO] = " ",
			},
			texthl = {
				[vim.diagnostic.severity.ERROR] = "ErrorMsg",
			},
			numhl = {
				[vim.diagnostic.severity.WARN] = "WarningMsg",
			},
		},

		virtual_text = false, -- Show text after diagnostics
		update_in_insert = false,
		underline = true,
		severity_sort = false,
		float = true,
	})
end

return M
