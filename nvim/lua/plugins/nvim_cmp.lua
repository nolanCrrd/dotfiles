
return {
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "onsails/lspkind.nvim", -- Ajoute ce plugin pour les icônes
    },
    config = function()
      local cmp = require("cmp")
      local lspkind = require("lspkind")

      -- 1. On définit les couleurs pour chaque type (Kind)
      -- Tu peux modifier les codes hex pour matcher ton thème Flexoki/Everforest
local highlights = {
        CmpItemKindMethod = { fg = "#24837B" },    -- Cyan
        CmpItemKindFunction = { fg = "#24837B" },  -- Cyan
        CmpItemKindVariable = { fg = "#205EA6" },  -- Blue
        CmpItemKindInterface = { fg = "#66800B" }, -- Green
        CmpItemKindClass = { fg = "#66800B" },     -- Green
        CmpItemKindColor = { fg = "#AD8301" },     -- Yellow
        CmpItemKindProperty = { fg = "#BC3F19" },  -- Orange
        CmpItemKindField = { fg = "#BC3F19" },     -- Orange
        CmpItemKindEnum = { fg = "#5E409D" },      -- Purple
        CmpItemKindSnippet = { fg = "#AF3029" },   -- Red
        CmpItemKindText = { fg = "#878580" },      -- Base 500 (Gris)
        CmpItemKindKeyword = { fg = "#BC3F19" },   -- Orange
        CmpItemKindUnit = { fg = "#AD8301" },      -- Yellow
      }

      for group, hl in pairs(highlights) do
        vim.api.nvim_set_hl(0, group, hl)
      end

      for group, hl in pairs(highlights) do
        vim.api.nvim_set_hl(0, group, hl)
      end

      cmp.setup({
        -- 3. Formatage pour inclure les icônes
        formatting = {
          format = lspkind.cmp_format({
            mode = 'symbol_text', -- 'symbol', 'text', or 'symbol_text'
            maxwidth = 50,
            ellipsis_char = '...',
          })
        },

        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },

        mapping = cmp.mapping.preset.insert({
          ["<C-k>"] = cmp.mapping.select_prev_item(), -- Navigation haut
          ["<C-j>"] = cmp.mapping.select_next_item(), -- Navigation bas
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<C-e>"] = cmp.mapping.abort(),
        }),

        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end,
  },
}
