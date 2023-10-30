--[[ [_], pv ]]--
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<leader>db", vim.cmd.DapToggleBreakpoint)
vim.keymap.set("n", "<leader>dr", vim.cmd.DapContinue)
