
require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'material',
    component_separators = {'', ''},
    section_separators = {'', ''},
    disabled_filetypes = {},
    sources = {'nvim_lsp'},
    color_error = '#ec5f67',
    color_warn = '#FF8800',
    color_info = '#008080'
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff'},
    lualine_c = {'filename', 'diagnostics'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
