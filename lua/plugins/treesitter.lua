---@diagnostic disable: missing-fields
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,
  init = function()
    -- Auto-install parsers on new machines
    -- Run: :TSInstallSync <lang> to install parsers manually
    local parsers = {
      -- Web development - core
      'javascript', 'typescript', 'tsx', 'html', 'css', 'scss',
      'json', 'json5', 'yaml', 'markdown', 'markdown_inline',
      -- JS Frameworks (Nuxt/Vue, React, Svelte, Astro, Angular)
      'vue', 'svelte', 'astro', 'angular',
      -- Backend/API/Database
      'graphql', 'sql', 'prisma',
      -- Top programming languages
      'c', 'cpp', 'csharp', 'python', 'rust', 'go', 'java', 'lua', 'luadoc',
      -- Linux/shell/config
      'bash', 'fish', 'zsh', 'tmux', 'hyprlang', 'make',
      'dockerfile', 'toml', 'vim', 'vimdoc', 'regex',
      -- Git
      'git_config', 'gitcommit', 'gitignore', 'git_rebase', 'gitattributes',
      -- Config formats
      'ini', 'ssh_config', 'editorconfig', 'nginx',
      -- Documentation
      'jsdoc', 'comment',
    }

    -- Create a user command to install all parsers
    vim.api.nvim_create_user_command('TSInstallAll', function()
      vim.cmd('TSInstall! ' .. table.concat(parsers, ' '))
    end, { desc = 'Install all configured treesitter parsers' })

    -- Auto-install missing parsers (optional - comment out if you prefer manual control)
    vim.api.nvim_create_autocmd('VimEnter', {
      once = true,
      callback = function()
        local installed = require('nvim-treesitter').get_installed()
        if #installed < 10 then  -- If fewer than 10 parsers, likely first install
          vim.notify("Installing Treesitter parsers in background. Use :TSInstallAll to reinstall.", vim.log.levels.INFO)
          vim.schedule(function()
            vim.cmd('TSInstall! ' .. table.concat(parsers, ' '))
          end)
        end
      end,
    })
  end,
}
