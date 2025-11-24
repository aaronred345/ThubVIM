return {
  {
    "folke/lazydev.nvim",
    event = "InsertEnter",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  { -- optional blink completion source for require statements and module annotations
    "saghen/blink.cmp",
    version = "1.*",
    opts = {
      sources = {
        -- add lazydev to your completion providers
        default = { "lazydev", "lsp", "path", "snippets", "buffer", "nuxt-dx-tools" },
        providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            -- make lazydev completions top priority (see `:h blink.cmp`)
            score_offset = 100,
          },
          ['nuxt-dx-tools'] = {
            name = 'nuxt-dx-tools',
            module = 'nuxt-dx-tools.blink-source',
            score_offset = 10,
          },
        },
      },
    },
    -- completion = {
    --   menu = {
    --     enabled = true,
    --     draw = {
    --       columns = { { 'label', 'label_description', gap = 1 }, { 'kind_icon', 'kind' } },
    --     },
    --   },
    -- },
  }
  -- { "folke/neodev.nvim", enabled = false }, -- make sure to uninstall or disable neodev.nvim
}
