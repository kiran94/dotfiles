return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"leoluz/nvim-dap-go",
		"theHamsta/nvim-dap-virtual-text",
		"mfussenegger/nvim-dap-python",
	},
    opts = {},
	config = function(plugin, opts)
		--------------------------------
		-- ADAPTERS and CONFIGURATION
		--------------------------------
		local mason_install_directory = vim.fn.stdpath("data") .. "/mason/" .. "bin/"

		require("plugins.lsp.dap-python").setup(plugin, mason_install_directory)
		require("plugins.lsp.dap-bash").setup(plugin, mason_install_directory)
		require("plugins.lsp.dap-go").setup()
		require("plugins.lsp.dap-csharp").setup()

		require("dap.ext.vscode").load_launchjs(nil, nil)

		--------------------------------
		-- SIGNS
		--------------------------------
		vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "DiagnosticSignError", linehl = "", numhl = "" })
		vim.fn.sign_define(
			"DapBreakpointCondition",
			{ text = "💊", texthl = "DiagnosticSignError", linehl = "", numhl = "" }
		)
		vim.fn.sign_define("DapLogPoint", { text = "📝", texthl = "DiagnosticSignError", linehl = "", numhl = "" })
		vim.fn.sign_define(
			"DapBreakpointRejected",
			{ text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" }
		)
		vim.fn.sign_define("DapStopped", { text = "→", texthl = "DiagnosticSignError", linehl = "", numhl = "" })
	end,
}
