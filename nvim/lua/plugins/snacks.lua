return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    explorer = { enabled = true },
    picker = { enabled = true },
    dashboard = { enabled = true },
    indent = { enabled = true, animate = { enabled = false } },
    input = { enabled = true },
    notifier = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },

    -- AJOUTE CETTE SECTION ICI :
    styles = {
      explorer = {
        wo = {
          -- On dit à l'explorer d'utiliser SnacksNormal au lieu de Normal
          winhighlight = "Normal:SnacksNormal,NormalNC:SnacksNormalNC,EndOfBuffer:SnacksNormal",
        }
      },
      dashboard = {
        wo = {
          winhighlight = "Normal:SnacksNormal,NormalNC:SnacksNormalNC",
        }
      }
    },
  },
}
