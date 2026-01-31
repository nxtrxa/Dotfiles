return {
	"nvim-tree/nvim-web-devicons", opts = {},
	config = function()
		require('nvim-web-devicons').setup {
			strict = true;
			override = {
				c3 = {
				  icon = "",
				  color = "#471474",
				  cterm_color = "209",
				  name = "C3"
				},
				c3i = {
				  icon = "",
				  color = "#00ffff",
				  cterm_color = "209",
				  name = "C3i"
				}
			},
			override_by_extension = {
				["c3"] = {
				  icon = " ",
				  color = "#471474",
				  name = "C3"
				},
				["c3i"] = {
				  icon = " ",
				  color = "#00ffff",
				  name = "C3i"
				},
                ["blade.php"] = {
                    icon="",
                    color="#ff2d20",
                    name = "blade",
                },
			}
		}
	end,
}
