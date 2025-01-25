
require('nvim-treesitter.configs').setup {
  ensure_installed = {
    'c', 'lua', 'vim', 'vimdoc', 'query', 'markdown', 'markdown_inline',
    'bash', 'commonlisp', 'css', 'csv', 'dart', 'desktop', 'diff', 'dockerfile',
    'elixir', 'embedded_template', 'erlang', 'git_config', 'git_rebase', 'gitattributes',
    'gitcommit', 'gitignore', 'go', 'graphql', 'haskell', 'html', 'http', 'hyprlang', 'java',
    'javascript', 'jsdoc', 'json', 'json5', 'julia', 'meson', 'nginx', 'nix', 'php', 'phpdoc',
    'prisma', 'python', 'rasi', 'regex', 'ruby', 'scss', 'sql', 'ssh_config',
    'typescript', 'udev', 'vue', 'xml', 'yaml', 'yuck'
  },

  sync_install = false,

  auto_install = true,

  highlight = {
    enable = true,

    disable = function(_, buf)
      local max_filesize = 10 * 1024 * 1024 -- 10MB
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))

      if ok and stats and stats.size > max_filesize then
        return true
      end
    end,

    additional_vim_regex_highlightingg = false
  }
}

