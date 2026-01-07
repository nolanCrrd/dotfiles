return {
	"brenoprata10/nvim-highlight-colors",
	config = function()
		require("nvim-highlight-colors").setup({
			render = "background", -- ou "foreground" ou "virtual"
			enable_tailwind = true, -- Important pour Tailwind!
		})
	end,
}
