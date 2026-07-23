-- ============================================================================
-- [LSP], Linting, Formatting & Completion
-- ============================================================================
local diagnostic_signs = {
	Error = " ",
	Warn = " ",
	Hint = "",
	Info = "",
}

vim.diagnostic.config({
	virtual_text = { prefix = "●", spacing = 4 },
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = diagnostic_signs.Error,
			[vim.diagnostic.severity.WARN] = diagnostic_signs.Warn,
			[vim.diagnostic.severity.INFO] = diagnostic_signs.Info,
			[vim.diagnostic.severity.HINT] = diagnostic_signs.Hint,
		},
	},
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = {
		border = "rounded",
		source = true,
		header = "",
		prefix = "",
		focusable = true,
		style = "minimal",
	},
})

-- do
-- 	local orig = vim.lsp.util.open_floating_preview
-- 	function _G.open_floating_preview(contents, syntax, opts, ...)
-- 		opts = opts or {}
-- 		opts.border = opts.border or "rounded"
-- 		return orig(contents, syntax, opts, ...)
-- 	end
-- end

local function lsp_on_attach(ev)
	local client = vim.lsp.get_client_by_id(ev.data.client_id)
	if not client then
		return
	end

	local map = function(keys, func, desc)
		vim.keymap.set("n", keys, func, { buffer = ev.buf, desc = "Lsp: " .. desc })
	end

	map("<C-f>", function()
		vim.lsp.buf.format()
	end, "format buffer")

	-- Diagnostics
	map("gp", function()
		vim.diagnostic.jump({ count = 1 })
	end, "Next diagnostic")

	map("gP", function()
		vim.diagnostic.jump({ count = -1 })
	end, "Previous diagnostic")

	-- Hover
	map("K", vim.lsp.buf.hover, "Hover documentation")

	-- Fzf-lua integrations
	map("gd", function()
		require("fzf-lua").lsp_definitions({ jump1 = true })
	end, "[LSP] definitions (fzf)")

	map("g;", ":Lspsaga peek_definition<cr>", "[Lspsaga] peek definition")

	-- [LSP] navigation
	map("gh", function()
		vim.cmd("split")
		vim.lsp.buf.definition()
	end, "[LSP] Go to definition (Horizontal split)")

	map("gV", function()
		vim.cmd("vsplit")
		vim.lsp.buf.definition()
	end, "[LSP] Go to definition (vertical split)")

	map("gR", function()
		require("fzf-lua").lsp_references()
	end, "[LSP] references (fzf)")

	map("gT", function()
		require("fzf-lua").lsp_typedefs()
	end, "[LSP] type definitions (fzf)")

	map("gs", function()
		require("fzf-lua").lsp_document_symbols()
	end, "[LSP] Document symbols (fzf)")

	map("gS", function()
		require("fzf-lua").lsp_workspace_symbols()
	end, "[LSP] Workspace symbols (fzf)")

	map("gI", function()
		require("fzf-lua").lsp_implementations()
	end, "[LSP] implementations (fzf)")

	local dap = require("dap")
	map("<leader>dt", dap.toggle_breakpoint, "Toggle Break")
	map("<leader>dc", dap.continue, "Continue")
	map("<leader>dr", dap.repl.open, "Inspect")
	map("<leader>dk", dap.terminate, "Kill")

	map("<leader>do", dap.step_over, "Step Over")
	map("<leader>di", dap.step_into, "Step Into")
	map("<leader>dO", dap.step_out, "Step Out")
	map("<leader>dl", dap.run_last, "Run Last")

	local dapui = require("dapui")
	map("<leader>du", dapui.toggle, "Toggle ui")
	map("<leader>dw", function()
		dapui.eval()
	end, "Watch")
	map("<leader>dW", function()
		dapui.eval(nil, { enter = true })
	end, "Watch [enter]")
end

vim.api.nvim_create_autocmd("LspAttach", { group = augroup, callback = lsp_on_attach })

vim.lsp.config["*"] = {
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
}

do
	local luacheck = require("efmls-configs.linters.luacheck")
	luacheck.lintCommand = "luacheck --globals vim Snacks --formatter plain --codes --ranges --filename ${INPUT} -"

	local stylua = require("efmls-configs.formatters.stylua")

	local flake8 = require("efmls-configs.linters.flake8")
	local black = require("efmls-configs.formatters.black")

	local prettier_d = require("efmls-configs.formatters.prettier_d")
	local eslint_d = require("efmls-configs.linters.eslint_d")

	local fixjson = require("efmls-configs.formatters.fixjson")

	local shellcheck = require("efmls-configs.linters.shellcheck")
	local shfmt = require("efmls-configs.formatters.shfmt")

	local cpplint = require("efmls-configs.linters.cpplint")
	cpplint.lintCommand = "cpplint --filter=-legal/copyright,-build/header_guard,-whitespace/tab --output=vs7 ${INPUT}"
	local clangfmt = require("efmls-configs.formatters.clang_format")

	local go_revive = require("efmls-configs.linters.go_revive")
	local gofumpt = require("efmls-configs.formatters.gofumpt")

	vim.lsp.config("efm", {
		filetypes = {
			"c",
			"cpp",
			"css",
			"go",
			"html",
			"javascript",
			"javascriptreact",
			"json",
			"jsonc",
			"lua",
			"markdown",
			"python",
			"sh",
			"typescript",
			"typescriptreact",
			"vue",
			"svelte",
		},
		init_options = { documentFormatting = true },
		settings = {
			languages = {
				c = { clangfmt, cpplint },
				go = { gofumpt, go_revive },
				cpp = { clangfmt, cpplint },
				css = { prettier_d },
				html = { prettier_d },
				javascript = { eslint_d, prettier_d },
				javascriptreact = { eslint_d, prettier_d },
				json = { eslint_d, fixjson },
				jsonc = { eslint_d, fixjson },
				lua = { luacheck, stylua },
				markdown = { prettier_d },
				python = { flake8, black },
				sh = { shellcheck, shfmt },
				typescript = { eslint_d, prettier_d },
				typescriptreact = { eslint_d, prettier_d },
				vue = { eslint_d, prettier_d },
				svelte = { eslint_d, prettier_d },
			},
		},
	})
end

vim.lsp.enable({
	"lua_ls",
	"pyright",
	"bashls",
	"ts_ls",
	"gopls",
	"clangd",
	"c3-lsp",
	"efm",
})
