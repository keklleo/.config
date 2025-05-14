return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'vimpostor/vim-tpipeline',
  },
  opts = {
    options = { section_separators = '', component_separators = '' },
    sections = {
      lualine_b = { { 'branch', icon = '' } },
      lualine_c = { 'filename' },
      lualine_x = { 'filetype' },
    },
  },
}
