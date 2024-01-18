-- Prints the Object
-- https://github.com/nanotee/nvim-lua-guide#tips-3
function _G.put(...)
	local objects = {}
	for i = 1, select("#", ...) do
		local v = select(i, ...)
		table.insert(objects, vim.inspect(v))
	end

	print(table.concat(objects, "\n"))
	return ...
end


local packer_sync = function()
    local async = require("plenary.async")
	async.run(function()
		vim.notify.async("Syncing packer.", "info", {
			title = "Packer",
		})
	end)
	local snap_shot_time = os.date("!%Y-%m-%dT%TZ")
	vim.cmd("PackerSnapshot " .. snap_shot_time)
	vim.cmd("PackerSync")
end

vim.keymap.set("n", "<leader>ps", function() packer_sync() end)
