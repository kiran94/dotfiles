local M = {}

local validate = vim.validate
local validator_aliases = {
	b = "boolean",
	c = "callable",
	f = "function",
	n = "number",
	s = "string",
	t = "table",
}

local function normalize_validator(validator)
	if type(validator) == "table" then
		local normalized = {}
		for key, value in pairs(validator) do
			normalized[key] = normalize_validator(value)
		end
		return normalized
	end

	return validator_aliases[validator] or validator
end

function M.setup()
	if vim.hl then
		vim.highlight = vim.hl
	end

	if vim.lsp and vim.lsp.get_clients then
		vim.lsp.buf_get_clients = function(bufnr)
			return vim.lsp.get_clients({ bufnr = bufnr or 0 })
		end
	end

	if vim.iter then
		vim.tbl_flatten = function(tbl)
			return vim.iter(tbl):flatten():totable()
		end
	end

	vim.validate = function(name, value, validator, optional_or_msg)
		if type(name) == "table" and value == nil and validator == nil and optional_or_msg == nil then
			for arg_name, spec in pairs(name) do
				local optional = spec[3]
				if optional == nil then
					optional = spec[4]
				end
				validate(arg_name, spec[1], normalize_validator(spec[2]), optional)
			end
			return
		end

		return validate(name, value, normalize_validator(validator), optional_or_msg)
	end
end

return M
