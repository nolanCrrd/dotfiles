---@diagnostic disable: undefined-global
return {
  -- 1. Le switch automatique Système -> Neovim
  {
    "f-person/auto-dark-mode.nvim",
    opts = {
      update_interval = 1000,
      set_dark_mode = function()
        vim.api.nvim_set_option_value("background", "dark", {})
        vim.cmd("colorscheme gruvbox-material")
      end,
      set_light_mode = function()
        vim.api.nvim_set_option_value("background", "light", {})
        vim.cmd("colorscheme gruvbox-material")
      end,
    },
  },

  -- 2. Gruvbox Material
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    config = function()
      -- Paramètres essentiels
      vim.opt.termguicolors = true
      vim.opt.cursorline = true

      -- Configuration du thème
      vim.g.gruvbox_material_background = 'medium'
      vim.g.gruvbox_material_foreground = 'material'
      vim.g.gruvbox_material_enable_italic_comment = 1
      vim.g.gruvbox_material_transparent_background = 0 

      -- Fonction de personnalisation (Overrides)
      local function apply_overrides()
        -- Vérification de sécurité : si le thème n'est pas chargé, on arrête
        if vim.fn.exists("*gruvbox_material#get_palette") == 0 then return end
        
        local config = vim.fn['gruvbox_material#get_configuration']()
        
        -- Utilisation de pcall pour éviter l'erreur E119 si les arguments changent selon la version
        local ok, palette = pcall(vim.fn['gruvbox_material#get_palette'], config.background, {})
        
        if not ok or not palette then return end

        -- Amélioration de la visibilité
        vim.api.nvim_set_hl(0, "CursorLine", { bg = palette.bg1[1] })
        vim.api.nvim_set_hl(0, "CursorLineNr", { fg = palette.orange[1], bold = true })

        -- Correction pour Snacks
        vim.api.nvim_set_hl(0, "SnacksNormal", { bg = palette.bg0[1] })
        vim.api.nvim_set_hl(0, "SnacksPickerMatch", { fg = palette.orange[1], bold = true })
        vim.api.nvim_set_hl(0, "UnfoldSelected", { bg = palette.bg4[1] }) 
      end

      -- Charger le thème
      vim.cmd.colorscheme("gruvbox-material")

      -- Appliquer les réglages en différé pour laisser le plugin s'initialiser
      vim.schedule(apply_overrides)

      -- Ré-appliquer si le mode change (ex: via auto-dark-mode)
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "gruvbox-material",
        callback = function()
            vim.schedule(apply_overrides)
        end,
      })
    end,
  },
}
