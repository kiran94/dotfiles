local function is_helm_chart_file(path)
	if path == "" then
		return false
	end

	return vim.fs.find("Chart.yaml", {
		path = vim.fs.dirname(path),
		upward = true,
		type = "file",
	})[1] ~= nil
end

local function helm_filetype(filetype)
	return function(path)
		if is_helm_chart_file(path) then
			return filetype
		end
	end
end

vim.filetype.add({
	pattern = {
		[".*/templates/.*%.tpl"] = helm_filetype("helm"),
		[".*/templates/.*%.txt"] = helm_filetype("helm"),
		[".*/templates/.*%.ya?ml"] = helm_filetype("helm"),
		[".*/values.*%.yaml"] = helm_filetype("yaml.helm-values"),
	},
})
