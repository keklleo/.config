require('lazy').setup({
  'tpope/vim-sleuth',
  require 'plugins.gitsigns',
  require 'plugins.which-key',
  require 'plugins.telescope',
  require 'plugins.lspconfig',
  require 'plugins.conform',
  require 'plugins.cmp',
  require 'plugins.tokyonight',
  require 'plugins.todo-comments',
  require 'plugins.mini',
  require 'plugins.treesitter',
  -- require 'plugins.debug',
  require 'plugins.indent_line',
  require 'plugins.lint',
  require 'plugins.autopairs',
  require 'plugins.neo-tree',
}, {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- vim: ts=2 sts=2 sw=2 et
