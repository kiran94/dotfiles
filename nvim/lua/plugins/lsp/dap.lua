local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
  return
end

local dap_ui_status_ok, dapui = pcall(require, "dapui")
if not dap_ui_status_ok then
  return
end

--------------------------------
-- ADAPTERS and CONFIGURATION
--------------------------------
require('dap.ext.vscode').load_launchjs(nil, nil)

local mason_install_directory = vim.fn.stdpath("data") .. "/mason/" .. "bin/"
dap.adapters.python = { type = 'executable'; command = mason_install_directory .. "debugpy-adapter"; }

local dap_go_ok, dap_go = pcall(require, "dap-go")
if dap_go_ok then
    dap_go.setup()
end

-- print(' ****** CONFIGURATIONS *******')
-- print(vim.inspect.inspect(dap.configurations))
-- print(' ****** ADAPTERS *******')
-- print(vim.inspect.inspect(dap.adapters))

--------------------------------
-- DAP UI
--------------------------------
dapui.setup {
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  expand_lines = vim.fn.has "nvim-0.7",
  layouts = {
    {
      elements = {
        { id = "scopes", size = 0.25 },
        "breakpoints",
        "stacks",
        "watches",
      },
      size     = 40, -- columns
      position = "right",
    },
    {
      elements = {
        "repl",
        "console",
      },
      size     = 0.25, -- 25% of total lines
      position = "bottom",
    },
  },
  controls = {
    enabled = vim.fn.has "nvim-0.8",
    element = "repl",
    icons = {
      pause = "",
      play = "",
      step_into = "",
      step_over = "",
      step_out = "",
      step_back = "",
      run_last = "↻",
      terminate = "□",
    },
  },
  floating = {
    max_height = nil,      -- These can be integers or a float between 0 and 1.
    max_width  = nil,      -- Floats will be treated as percentage of your screen.
    border     = "single", -- Border style. Can be "single", "double" or "rounded"
    mappings   = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
  render  = {
    max_type_length = nil,
    max_value_lines = 100,
  },
}

local dap_virtual_text_ok, dap_virtual_text = pcall(require, "nvim-dap-virtual-text")
if dap_virtual_text_ok then
    dap_virtual_text.setup()
end

--------------------------------
-- Signs
--------------------------------
vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })

--------------------------------
-- Events
--------------------------------
dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open {} end
dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close {} end
dap.listeners.before.event_exited["dapui_config"] = function() dapui.close {} end
