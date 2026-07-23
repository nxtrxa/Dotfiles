local mc = require("multicursor-nvim")

local function map(mode, lhs, rhs, opts)
	opts = vim.tbl_deep_extend("force", {
		noremap = true,
		silent = true,
	}, opts or {})
	vim.keymap.set(mode, lhs, rhs, opts)
end

mc.setup()
map({ "n", "x" }, "<up>", function()
	mc.lineAddCursor(-1)
end)
map({ "n", "x" }, "<down>", function()
	mc.lineAddCursor(1)
end)
map({ "n", "x" }, "<leader><up>", function()
	mc.lineSkipCursor(-1)
end)
map({ "n", "x" }, "<leader><down>", function()
	mc.lineSkipCursor(1)
end)

-- Add or skip adding a new cursor by matching word/selection
map({ "n", "x" }, "<leader>l", function()
	mc.matchAddCursor(1)
end)
map({ "n", "x" }, "<leader>j", function()
	mc.matchSkipCursor(1)
end)
map({ "n", "x" }, "<leader>h", function()
	mc.matchAddCursor(-1)
end)
map({ "n", "x" }, "<leader>k", function()
	mc.matchSkipCursor(-1)
end)

-- Add and remove cursors with control + left click.
map("n", "<c-leftmouse>", mc.handleMouse)
map("n", "<c-leftdrag>", mc.handleMouseDrag)
map("n", "<c-leftrelease>", mc.handleMouseRelease)

-- Disable and enable cursors.
map({ "n", "x" }, "<c-x>", mc.toggleCursor)

-- Mappings defined in a keymap layer only apply when there are
-- multiple cursors. This lets you have overlapping mappings.
mc.addKeymapLayer(function(layerSet)
	-- Select a different cursor as the main one.
	layerSet({ "n", "x" }, "<left>", mc.prevCursor)
	layerSet({ "n", "x" }, "<right>", mc.nextCursor)

	-- Delete the main cursor.
	layerSet({ "n", "x" }, "<leader>x", mc.deleteCursor)

	-- Enable and clear cursors using escape.
	layerSet("n", "<esc>", function()
		if not mc.cursorsEnabled() then
			mc.enableCursors()
		else
			mc.clearCursors()
		end
	end)
end)
