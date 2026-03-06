return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      -- Utiliser fish explicitement
      shell = "fish",
      -- La direction par défaut
      direction = "float",
	  start_in_insert = true,
      
      -- Configuration du style flottant
      float_opts = {
        border = "curved",
        width = 150,
        height = 30,
        winblend = 3,
      },
    })

    vim.keymap.set('n', '<leader>k', '<cmd>ToggleTerm<cr>', { desc = "Ouvrir terminal flottant" })
	 vim.api.nvim_create_autocmd("TermOpen", {
      pattern = "term://*",
      callback = function()
        local opts = { buffer = 0 }
        -- Utilise Esc pour sortir du mode terminal et repasser en mode Normal
        vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
      end,
    })   
  end
}
