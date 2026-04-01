---@diagnostic disable: undefined-global
return {
  -- 1. Le switch automatique Système (KDE) -> Neovim
  {
    "f-person/auto-dark-mode.nvim",
    opts = {
      update_interval = 1000,
      set_dark_mode = function()
        vim.api.nvim_set_option_value("background", "dark", {})
        vim.cmd("colorscheme flexoki-dark") 
      end,
      set_light_mode = function()
        vim.api.nvim_set_option_value("background", "light", {})
        vim.cmd("colorscheme flexoki-light") 
      end,
    },
  },

  -- 2. Flexoki (Le thème de Kepano)
  {
    "kepano/flexoki-neovim",
    name = "flexoki",
    lazy = false,
    priority = 1000,
    config = function()
      -- Pas besoin de config complexe, Flexoki est parfait de base
      vim.cmd("colorscheme flexoki-dark")
      
      -- Si tu veux quand même la transparence pour ton flou KDE :
      -- (Attention : Flexoki perd un peu de son aspect "papier" sans son fond d'origine)
      -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end,
  },
}
