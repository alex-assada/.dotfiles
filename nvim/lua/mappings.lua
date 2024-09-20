require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- vim-tmux-navigator mappings
map("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>", { silent = true, desc = "Navigate left" })
map("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>", { silent = true, desc = "Navigate down" })
map("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>", { silent = true, desc = "Navigate up" })
map("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>", { silent = true, desc = "Navigate right" })
map("n", "<C-\\>", "<cmd>TmuxNavigatePrevious<CR>", { silent = true, desc = "Navigate previous" })
