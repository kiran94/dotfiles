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

local async = require("plenary.async")

local packer_sync = function()
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

_G.edit_cell = function()
	local current_buffer_number = 0

	local row, col = unpack(vim.api.nvim_win_get_cursor(current_buffer_number))
	local node = vim.treesitter.get_node_at_pos(current_buffer_number, row - 1, col)
	if node == nil then
		return
	end

	local node_type = node:type()
	if node_type ~= "pipe_table_cell" and node_type ~= "pipe_table_header" then
		return
	end

	local current_contents = vim.treesitter.get_node_text(node, current_buffer_number)

	vim.ui.input({
		prompt = "edit>",
		default = current_contents,
	}, function(input)
		local start_row, start_col, end_row, end_col = node:range()
		vim.api.nvim_buf_set_text(current_buffer_number, start_row, start_col, end_row, end_col, { input })
	end)
end

