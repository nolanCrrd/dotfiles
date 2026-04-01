return {
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      -- Désactiver netrw
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      -- Fonction pour définir les raccourcis personnalisés
      local function my_on_attach(bufnr)
        local api = require("nvim-tree.api")

        local function opts(desc)
          return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        -- Charger les raccourcis par défaut d'abord
        api.config.mappings.default_on_attach(bufnr)

        -- --- TES NOUVEAUX RACCOURCIS ---
        -- 'l' pour ouvrir / entrer
        vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
        -- 'h' pour fermer le dossier ou remonter au parent
        vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close Directory'))
        
        -- Optionnel : 'L' pour ouvrir en split vertical si tu veux
        vim.keymap.set('n', 'L', api.node.open.vertical, opts('Open: Vertical Split'))
      end

      require("nvim-tree").setup({
        on_attach = my_on_attach, -- On injecte nos raccourcis ici
        git = {
          enable = true,
          ignore = false,
        },
        renderer = {
          highlight_git = true,
          icons = {
            show = {
              file = true,
              folder = true,
              folder_arrow = true,
              git = true,
            },
          },
        },
        view = {
          width = 35,
          side = "left",
        },
      })

      -- Raccourci pour ouvrir l'arbre (en dehors de l'arbre)
      vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle File Explorer" })
    end,
  },
}
