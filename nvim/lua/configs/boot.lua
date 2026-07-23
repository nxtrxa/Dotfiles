require("configs.options")
require("configs.vim-pack")
require("configs.mappings")
require("configs.autocmds")
require("configs.ui")
require("colors.nothy")

local config_dir = vim.fn.stdpath("config")
local dirs = { "plugins", "servers" }

for _, dir_name in ipairs(dirs) do
	-- Look inside lua/ directory, matching your file tree
	local full_path = config_dir .. "/lua/" .. dir_name

	-- Only proceed if the directory exists
	if vim.fn.isdirectory(full_path) == 1 then
		for file in vim.fs.dir(full_path) do
			if file:match("%.lua$") then
				local module_name = dir_name .. "." .. file:gsub("%.lua$", "")
				local ok, err = pcall(require, module_name)
				if not ok then
					vim.notify("Error loading " .. module_name .. ": " .. err, vim.log.levels.ERROR)
				end
			end
		end
	end
end
