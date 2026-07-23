return {
    {
    "xiyaowong/nvim-transparent",
    lazy = false,
    priority = 1000,
    },

	{
    "eldritch-theme/eldritch.nvim",
    lazy = false,
    priority = 1000,
    opts = require("configs.eldritch"),
    config = function()
		vim.cmd('colorscheme eldritch')
	end,
	}

}
