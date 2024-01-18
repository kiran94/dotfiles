return {
	"mzlogin/vim-markdown-toc",
	config = function()
		vim.g.vmt_fence_text = "toc"
		vim.g.vmt_fence_closing_text = "/toc"
	end,
	cmd = { "GenTocGFM" },
}
