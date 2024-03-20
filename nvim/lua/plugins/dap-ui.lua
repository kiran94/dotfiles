return {
	"rcarriga/nvim-dap-ui",
	event = "VeryLazy",
	config = function(_, opts)
		local dap = require("dap")
		local dapui = require("dapui")

		dapui.setup(opts)

		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open({})
			dapui.toggle({ layout = 4 })

			vim.cmd(":FocusDisable")
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close({})

			vim.cmd(":FocusEnable")
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close({})

			vim.cmd(":FocusEnable")
		end
	end,
	dependencies = {
		"mfussenegger/nvim-dap",
		"nvim-neotest/nvim-nio",
	},
	opts = {
		layouts = {
			{
				elements = {
					"scopes",
				},
				size = 0.2, -- columns
				position = "left",
			},
			{
				elements = {
					"console",
				},
				size = 0.1, -- 25% of total lines
				position = "bottom",
			},
			{
				elements = {
					"repl",
				},
				size = 0.2, -- 25% of total lines
				position = "bottom",
			},
			{
				elements = {
					"breakpoints",
					"stacks",
					"watches",
				},
				size = 0.2, -- columns
				position = "right",
			},
		},
	},
}
