return {
  'akinsho/toggleterm.nvim',
  version = '*',
  opts = {
    open_mapping = [[<c-\>]],
    direction = 'float',
    float_opts = {
      border = 'curved',
      winblend = 5,
      title_pos = 'center'
    },
    highlights = {
      FloatBorder = {
        guifg = '#e67e80',
      },
    },
  }
}
