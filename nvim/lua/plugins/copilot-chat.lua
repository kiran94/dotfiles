return {
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		enabled = false,
		opts = {
			show_help = "yes", -- Show help text for CopilotChatInPlace, default: yes
			disable_extra_info = "yes", -- Disable extra information (e.g: system prompt) in the response.
			prompts = {
				Explain = "Please explain how the following code works.",
				Review = "Please review the following code and provide suggestions for improvement.",
				Tests = "Please explain how the selected code works, then generate unit tests for it.",
				PythonTest = "Generate pytest tests for the following code",
				Refactor = "Please refactor the following code to improve its clarity and readability.",
				FixCode = "Please fix the following code to make it work as intended.",
				BetterNamings = "Please provide better names for the following variables and functions.",
				Documentation = "Please provide documentation for the following code.",
				-- SwaggerApiDocs = "Please provide documentation for the following API using Swagger.",
				-- SwaggerJsDocs = "Please write JSDoc for the following API using Swagger.",
				-- Summarize = "Please summarize the following text.",
				-- Spelling = "Please correct any grammar and spelling errors in the following text.",
				-- Wording = "Please improve the grammar and wording of the following text.",
				-- Concise = "Please rewrite the following text to make it more concise.",
			},
		},
		build = function()
			vim.cmd("UpdateRemotePlugins")
			vim.fn.install_neovim_python_package({
				"python-dotenv",
				"requests",
				"pynvim",
				"prompt-toolkit",
				"tiktoken",
			})

			-- May need to do an additional Lazy build
		end,
		event = "VeryLazy",
		keys = {
			{ "<leader>cce", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain code" },
			{ "<leader>cct", "<cmd>CopilotChatTests<cr>", desc = "CopilotChat - Generate tests" },
			{ "<leader>ccv", ":CopilotChatVisual", mode = "x", desc = "CopilotChat - Open in vertical split" },
			{ "<leader>ccx", ":CopilotChatInPlace<cr>", mode = "x", desc = "CopilotChat - Run in-place code" },
		},
	},
}
