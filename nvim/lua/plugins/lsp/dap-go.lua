local M = {}

M.setup = function()
	local dap_go_ok, dap_go = pcall(require, "dap-go")
	if dap_go_ok then
		dap_go.setup()
	end
end

return M
