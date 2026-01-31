--local on_attach = require("utils.lsp").on_attach

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(args)
        local bufnr = args.buf
        local opts = { buffer = bufnr, noremap = true, silent = true }

        -- Keymaps
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    end
})
-- Restore last cursor position when reopening a file
local last_cursor_group = vim.api.nvim_create_augroup("LastCursorGroup", {})
vim.api.nvim_create_autocmd("BufReadPost", {
    group = last_cursor_group,
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

-- Highlight the yanked text for 200ms
local highlight_yank_group = vim.api.nvim_create_augroup("HighlightYank", {})
vim.api.nvim_create_autocmd("TextYankPost", {
    group = highlight_yank_group,
    pattern = "*",
    callback = function()
        vim.hl.on_yank({
            higroup = "IncSearch",
            timeout = 200,
        })
    end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
        local groups = {
            "Normal",
            "NormalNC",
            "NormalFloat",
            "FloatBorder",
            "SignColumn",
            "EndOfBuffer",
            "MsgArea",
            "NeoTreeNormal",
            "NeoTreeNormalNC",
            "TroubleNormal",
            "TroubleNormalNC",
            "TroubleIndent",
            "TroubleCount",
            "TroubleText",
            "TelescopeNormal",
            "TelescopeBorder",
            "TelescopePromptNormal",
            "TelescopePromptBorder",
            "TelescopePromptTitle",
            "TelescopeResultsNormal",
            "TelescopeResultsBorder",
            "TelescopeResultsTitle",
            "TelescopePreviewNormal",
            "TelescopePreviewBorder",
            "TelescopePreviewTitle",
            "TelescopeSelection",
            "TelescopeSelectionCaret",
            "TelescopeQuickFix",
            "TelescopeQuickFixLine",
            "TelescopeQuickFixFilename",
            "TelescopeResultsNormal",
            "TelescopeResultsBorder",
            "TelescopeSelection",
            "TelescopeSelectionCaret",
            "FzfLuaHelpNormal",
            "FzfLuaNormal",
            "FzfLuaBorder",
            "FzfLuaTitle",
            "FzfLuaPrompt",
            "FzfLuaCursor",
            "FzfLuaCursorLine",
            "FzfLuaHeader",
        }

        for _, group in ipairs(groups) do
            vim.api.nvim_set_hl(0, group, { bg = "none" })
        end
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "c3" },
    callback = function()
        vim.treesitter.start()
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "*.c",
    callback = function()
        vim.keymap.set("n",
        "<leader>bc",
        "i#include <stdio.h><CR> #include <stdlib.h><CR><CR> int main(int argc, char **argv) {<CR><CR> return 0; }<ESC>2k4l ")
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "*.cpp",
    callback = function()
        vim.keymap.set("n",
        "<leader>bc",
        "i#include <stdio.h><CR> #include <stdlib.h><CR><CR> int main(int argc, char **argv) {<CR><CR> return 0; }<ESC>2k4l ")
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "*.c3",
    callback = function()
        vim.keymap.set("n",
        "<leader>bc",
        "i module<CR> import<CR><CR> int main(String[] args){<CR><CR> return 0; }<ESC>2k4l ")
    end,
})

vim.api.nvim_create_autocmd("User", {
    pattern = "MasonToolsStartingInstall",
    callback = function()
        vim.schedule(function()
            print("mason-tool-installer is starting")
        end)
    end,
})

vim.api.nvim_create_autocmd("User", {
    pattern = "MasonToolsUpdateCompleted",
    callback = function(e)
        vim.schedule(function()
            print(vim.inspect(e.data)) -- print the table that lists the programs that were installed
        end)
    end,
})

-- local lsp_fmt_group = vim.api.nvim_create_augroup("FormatOnSaveGroup", {})
-- vim.api.nvim_create_autocmd("BufWritePre", {
    -- 	group = lsp_fmt_group,
    -- 	callback = function()
        -- 		local efm = vim.lsp.get_clients({ name = "efm" })
        --
        -- 		if vim.tbl_isempty(efm) then
        -- 			return
        -- 		end
        -- 		vim.lsp.buf.format({ name = "efm", async = true })
        -- 	end,
        -- })

        vim.api.nvim_create_autocmd("CursorHold", {
            command = "lua vim.diagnostic.open_float()",
            group = vim.api.nvim_create_augroup("Lsp", { clear = true }),
        })

