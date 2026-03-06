-- =============================================================================
-- SECTION 0: CONFIGURATION GÉNÉRALE
-- =============================================================================
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

-- =============================================================================
-- SECTION 1: GESTION DES BUFFERS (Fichiers ouverts)
-- =============================================================================
map("n", "<leader>bn", ":bnext<CR>", { desc = "Buffer suivant" })
map("n", "<leader>bp", ":bprevious<CR>", { desc = "Buffer précédent" })
map("n", "<leader>bd", ":bdelete<CR>", { desc = "Fermer le buffer" })

-- =============================================================================
-- SECTION 2: FENÊTRES ET SPLITS (Navigation & Redimensionnement)
-- =============================================================================
-- Création des splits
map("n", "<leader>sv", ":vsplit<CR>", { desc = "Split vertical" })
map("n", "<leader>sh", ":split<CR>", { desc = "Split horizontal" })

-- Redimensionnement (Ctrl + Flèches)
map("n", "<C-Up>", ":resize -2<CR>", { desc = "Augmenter hauteur" })
map("n", "<C-Down>", ":resize +2<CR>", { desc = "Diminuer hauteur" })
map("n", "<C-Right>", ":vertical resize -2<CR>", { desc = "Augmenter largeur" })
map("n", "<C-Left>", ":vertical resize +2<CR>", { desc = "Diminuer largeur" })

-- Déplacement entre les fenêtres (Ctrl + hjkl)
map("n", "<C-h>", "<C-w>h", { desc = "Focus fenêtre gauche" })
map("n", "<C-j>", "<C-w>j", { desc = "Focus fenêtre bas" })
map("n", "<C-k>", "<C-w>k", { desc = "Focus fenêtre haut" })
map("n", "<C-l>", "<C-w>l", { desc = "Focus fenêtre droite" })

-- =============================================================================
-- SECTION 3: ÉDITION ET MANIPULATION DE TEXTE
-- =============================================================================
-- Déplacer des lignes (Alt + j/k)
map("n", "<A-j>", ":m .+1<CR>==", { desc = "Déplacer ligne vers le bas" })
map("n", "<A-k>", ":m .-2<CR>==", { desc = "Déplacer ligne vers le haut" })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Déplacer sélection vers le bas" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Déplacer sélection vers le haut" })

-- Indentation (garde la sélection active)
map("v", "<", "<gv", { desc = "Désindenter et garder sélection" })
map("v", ">", ">gv", { desc = "Indenter et garder sélection" })

-- Utilisation de obsidian
map("n", "<leader>on", ":ObsidianNew<cr>", { desc = "Nouvelle note Obsidian" })
map("n", "<leader>os", ":ObsidianSearch<cr>", { desc = "Rechercher une note" })
map("n", "<leader>ot", ":ObsidianTemplate<cr>", { desc = "Insérer un template" })
map("n", "<leader>ob", ":ObsidianBacklinks<cr>", { desc = "Voir les backlinks" })

-- =============================================================================
-- SECTION 4: NAVIGATION FICHIERS & SYSTÈME
-- =============================================================================
-- Sauvegarde et Quitter
map("n", "<leader>w", ":w<CR>", { desc = "Sauvegarder fichier" })
map("n", "<leader>q", ":q<CR>", { desc = "Quitter" })
map("n", "<leader>qa", ":qa<CR>", { desc = "Tout quitter" })

-- Accès rapide
map("n", "<leader>rc", ":e ~/.config/nvim/init.lua<CR>", { desc = "Ouvrir init.lua" })
map("n", "<leader>e", function() require("snacks").explorer() end, { desc = "Snacks Explorer" })

-- =============================================================================
-- SECTION 5: GESTION DES ONGLETS (Tabs)
-- =============================================================================
map('n', '<leader>tn', ':tabnew<CR>', { desc = 'Nouvel onglet' })
map('n', '<leader>tx', ':tabclose<CR>', { desc = 'Fermer onglet' })

-- Déplacement des onglets
map('n', '<leader>tm', ':tabmove<CR>', { desc = 'Déplacer onglet' })
map('n', '<leader>t>', ':tabmove +1<CR>', { desc = 'Déplacer onglet vers droite' })
map('n', '<leader>t<', ':tabmove -1<CR>', { desc = 'Déplacer onglet vers gauche' })

-- =============================================================================
-- SECTION 6: PLUGINS SPÉCIFIQUES (Documentation, etc.)
-- =============================================================================
map("n", "<leader>gdg", ":Neogen<CR>", { desc = "Générer Doc (Neogen)" })
