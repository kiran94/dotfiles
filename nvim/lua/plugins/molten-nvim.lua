return {
	"benlubas/molten-nvim",
	version = "^1.0.0",
	dependencies = {
		"3rd/image.nvim",
		"GCBallesteros/jupytext.nvim",
	},
	event = "BufEnter *.ipynb",
	build = function()
		vim.fn.install_neovim_python_package({
			"pynvim",
			"jupyter_client",
			"cairosvg",
			"plotly",
			"kaleido",
			"pnglatex",
			"pyperclip",
			"ipykernel",
			"jupytext",
		})

		vim.cmd("UpdateRemotePlugins")
	end,
	init = function()
		vim.g.molten_wrap_output = true
		vim.g.molten_virt_text_output = true
		vim.g.molten_auto_open_output = false
	end,
	config = function()
		vim.g.molten_auto_init_behavior = "init"
		vim.g.python3_host_prog = vim.fn.expand("~/.virtualenvs/neovim/bin") .. "/python3"

		-- To create a kernel which has access to project dependencies
		-- source the virtual environment
		-- run jupyter_create_project_kernel from ../../../bash/utilities.sh
	end,
}
