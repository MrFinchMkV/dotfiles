return {
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = true,
        theme = 'dracula',
        -- theme = 'tokyonight',
        -- theme = 'onedark',
        -- theme = 'nightfox',
        component_separators = '|',
        section_separators = '',
      },
      sections = {
        lualine_c = { { 'filename', path = 1 } },
      },
      inactive_sections = {
        lualine_c = { { 'filename', path = 1 } },
      }
    }
  },
}
