require('nvim-treesitter.configs').setup {
  ensure_installed = { "gitattributes", "gitignore", "gomod", "gosum", "go",
  		"c", "cpp", "python", "bash", "lua", "vim", "vimdoc", "query", "json5",
		"yaml", "html", "css", "javascript", "zig"},

  sync_install = false,

  auto_install = true,

  ignore_install = { "javascript" },

  highlight = {
    enable = true,

    additional_vim_regex_highlighting = false,
  },
}
