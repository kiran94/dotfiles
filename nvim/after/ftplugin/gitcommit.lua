local ok, cmp = pcall(require, "cmp")

if ok then
	cmp.setup.buffer({
		sources = {
			{ name = "conventionalcommits", keyword_length = 1 },
			{ name = "buffer", keyword_length = 1 },
		},
	})
end
