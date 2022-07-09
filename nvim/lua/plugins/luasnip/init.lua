local plugin = require('luasnip')

plugin.config.set_config({
  history = true,
  updateevents = 'TextChanged,TextChangedI',
  enable_autosnippets = true,
})

plugin.snippets = {
  all = {},
  html = {},
}

-- enable html in the following languages
plugin.snippets.javascript = plugin.snippets.html
plugin.snippets.javascriptreact = plugin.snippets.html
plugin.snippets.typescriptreact = plugin.snippets.html
plugin.snippets.svelte = plugin.snippets.html

require('luasnip.loaders.from_vscode').lazy_load()
