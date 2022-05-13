local options = {}

options.config = function()
	vim.g.vmt_fence_text = "toc"
	vim.g.vmt_fence_closing_text = "/toc"
end

return options
