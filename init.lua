-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

require("lazy-loader")

-- Auto Commands
require("config.auto-cmds")

-- Toggle Term Functions
require("utils.toggle-term")

-- Color Scheme
vim.cmd.colorscheme("catppuccin-mocha")
local cp = require("catppuccin.palettes").get_palette("mocha")
vim.api.nvim_set_hl(0, "BufferInactiveSign", { fg = cp.base, bg = cp.mantle })
vim.api.nvim_set_hl(0, "BufferCurrentSign", { fg = cp.base, bg = cp.mantle })

-- VTSLS needs to fucking work
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.signatureHelp = {
  dynamicRegistration = true,
  signatureInformation = {
    documentationFormat = { 'markdown', 'plaintext' },
    parameterInformation = {
      labelOffsetSupport = true,
    },
  },
}
local vue_language_server_path = vim.fn.stdpath("data") ..
    "/mason/packages/vue-language-server/node_modules/@vue/language-server"
local vue_plugin = {
  name = "@vue/typescript-plugin",
  location = vue_language_server_path,
  languages = { "vue" },
  configNamespace = "typescript",
}
vim.lsp.config["vtsls"] = {
  capabilities = capabilities,
  root_markers = { '.nuxt', 'package.json', 'tsconfig.json' },
  settings = {
    vtsls = {
      tsserver = {
        globalPlugins = {
          vue_plugin,
        },
      },
      experimental = {
        completion = {
          enableServerSideFuzzyMatch = true,
        },
      },
    },
    typescript = { -- This should be at the same level as vtsls, NOT nested inside it
      tsserver = {
        projectReferences = true,
      },
      preferences = {
        importModuleSpecifier = "relative",
      },
    },
    javascript = {
      tsserver = {
        projectReferences = true,
      },
    },
  },
  filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
}
vim.lsp.config["vue_ls"] = {
  capabilities = capabilities,
}

-- CSS Lsp/TS
vim.lsp.config["cssls"] = {
  filetypes = { "css", "scss", "pcss", "postcss" },
  settings = {
    css = {
      validate = true
    }
  }
}

vim.lsp.config["tailwindcss"] = {
  filetypes = { 'html', 'css', 'scss', 'javascript', 'typescript', 'vue', 'pcss' },
  init_options = {
    userLanguages = {
      pcss = 'css',
    },
  },
  settings = {
    tailwindCSS = {
      experimental = {
        classRegex = {
          { "class:\\s*?[\"'`]([^\"'`]*).*?[\"'`]", "[\"'`]([^\"'`]*).*?[\"'`]" },
        },
      },
    },
  },
}

vim.filetype.add({
  extension = {
    pcss = 'css'
  }
})

-- Setup Key Bindingd
require("config.key-maps")
