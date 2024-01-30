return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		{ "nvim-tree/nvim-web-devicons", lazy = true },
		"linrongbin16/lsp-progress.nvim",
	},
	config = function()
		-- Gets the Active LSP
		local lsp_active = function()
			local msg = "🔌"
			local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
			local clients = vim.lsp.get_active_clients()

			-- If there are no clients then just return
			if next(clients) == nil then
				return msg
			end

			-- Find all the clients attached to Buffer
			local found_clients = {}
			local found_client_count = 0
			for _, client in ipairs(clients) do
				local filetypes = client.config.filetypes
				if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 and client.name ~= "null-ls" then
					table.insert(found_clients, client.name)
					found_client_count = found_client_count + 1
				end
			end

			-- For any found then concat them together and return
			if found_client_count > 0 then
				return table.concat(found_clients, " | ")
			end

			return msg
		end

		-- Get Python Environment
		local python_env = function()
			if vim.bo.filetype ~= "python" then
				return ""
			end

			local virtual_env = os.getenv("VIRTUAL_ENV")
			local conda_env = os.getenv("CONDA_DEFAULT_ENV")
			local poetry_active = os.getenv("POETRY_ACTIVE") == "1"

			-- Normalize the path
			-- e.g /home/user/projects/.venv => ~/projects/.env
			local user = os.getenv("USER")
			local home_path = "/home/" .. user
			virtual_env = virtual_env:gsub(home_path, "~")

			-- Poetry Paths can be very long
			-- e.g ~/.cache/pypoetry/virtualenvs/prfiesta-aI_TvpME-py3.11
			-- so we have some special handling
			if poetry_active then
				local virtual_env = string.match(virtual_env, "[^/]+$")
				local pos = string.find(virtual_env, "-") -- find the position of the first occurrence of "-"
				local virtual_env = string.sub(virtual_env, 1, pos - 1) -- extract the substring before "-"

				return virtual_env .. " (poetry)"
			end

			if virtual_env ~= nil then
				return virtual_env
			elseif conda_env ~= nil and conda_env ~= "base" then
				return conda_env
			end

			return ""
		end

		local dap_status = function()
			local ok, dap = pcall(require, "dap")
			if not ok then
				return
			end

			local status = dap.status()

			if status ~= "" then
				return " " .. status
			else
				return ""
			end
		end

		require("lualine").setup({
			options = {
				icons_enabled = true,
				globalstatus = true,
				theme = "vscode", -- material
				component_separators = { "", "" },
				section_separators = { "", "" },
				disabled_filetypes = {},
				sources = { "nvim_diagnostic" },
				color_error = "#ec5f67",
				color_warn = "#FF8800",
				color_info = "#008080",
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff" },
				lualine_c = { "filename", "diagnostics", dap_status },
				lualine_x = {
					require("lsp-progress").progress,
					"copilot",
					python_env,
					"encoding",
					"fileformat",
					"filetype",
					lsp_active,
				},
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			extensions = {},
		})
	end,
}
