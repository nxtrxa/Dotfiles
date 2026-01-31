local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Language Server Protocol (LSP)
require("servers.lua_ls")(capabilities)
require("servers.pyright")(capabilities)
require("servers.gopls")(capabilities)
require("servers.jsonls")(capabilities)
require("servers.ts_ls")(capabilities)
require("servers.bashls")(capabilities)
require("servers.clangd")(capabilities)
require("servers.c3-lsp")(capabilities)
require("servers.dockerls")(capabilities)
require("servers.emmet_ls")(capabilities)
require("servers.yamlls")(capabilities)
require("servers.tailwindcss")(capabilities)
require("servers.solidity_ls_nomicfoundation")(capabilities)
require("servers.vue_ls")(capabilities)

-- Linters & Formatters
require("servers.efm-langserver")(capabilities)

vim.lsp.enable({
	"lua_ls",
	"pyright",
	"gopls",
	"jsonls",
	"ts_ls",
	"bashls",
	"clangd",
	"c3-lsp",
	"dockerls",
	"emmet_ls",
	"yamlls",
	"tailwindcss",
	"solidity_ls_nomicfoundation",
	"efm",
	"vue_ls",
})

vim.diagnostic.config({
    virtual_text = false,
    signs = false,
    update_in_insert = false,
    underline = false, -- This is what controls the squiggles
    severity_sort = true,
    float = {
        source = "always",
    },
})
