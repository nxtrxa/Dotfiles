local config_dir = vim.fn.stdpath("config")
package.path = package.path .. ";" .. config_dir .. "/?.lua" .. ";" .. config_dir .. "/?/init.lua"
require("configs.boot")
