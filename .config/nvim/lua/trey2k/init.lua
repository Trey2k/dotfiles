require("trey2k.remap")

local options = vim.opt
options.number = true
options.signcolumn = "auto"
options.wrap = false
options.shiftwidth = 4
options.tabstop = 4
options.clipboard = "unnamedplus"

-- Load .vscode/launch.json
require('dap.ext.vscode').load_launchjs(nil, {codelldb = {'cpp', 'c', 'h'}})
