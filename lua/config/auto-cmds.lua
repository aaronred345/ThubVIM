-- Save/restore view settings (cursor position, etc)
-- Note: viewoptions excludes "folds" (set in defaults.lua) so treesitter folds work
vim.api.nvim_create_autocmd("BufLeave", {
  pattern = "*.*",
  command = "mkview",
})
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.*",
  command = "silent! loadview"
})

-- Session Manager and Splash Screen
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    require("telescope").load_extension("project")
  end
})

-- Enable Treesitter features for all supported languages
vim.api.nvim_create_autocmd('FileType', {
  pattern = {
    -- Web dev
    'javascript', 'typescript', 'typescriptreact', 'html', 'css', 'scss',
    'json', 'json5', 'yaml', 'markdown',
    'vue', 'svelte', 'astro', 'angular',
    'graphql', 'sql', 'prisma',
    -- Programming languages
    'c', 'cpp', 'csharp', 'python', 'rust', 'go', 'java', 'lua',
    -- Linux/shell/config
    'sh', 'bash', 'fish', 'zsh', 'tmux', 'hyprlang', 'make',
    'dockerfile', 'toml', 'vim',
    'gitcommit', 'gitconfig', 'gitrebase',
    'conf', 'sshconfig', 'nginx',
  },
  callback = function(args)
    -- Always set folds first (works even without parser)
    vim.wo.foldmethod = 'expr'
    vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

    -- Try to enable treesitter highlighting
    local lang = vim.treesitter.language.get_lang(args.match)
    local has_parser = pcall(vim.treesitter.language.add, lang or args.match)

    if has_parser then
      -- Syntax highlighting (provided by Neovim)
      pcall(vim.treesitter.start)

      -- Indentation (provided by nvim-treesitter)
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})
