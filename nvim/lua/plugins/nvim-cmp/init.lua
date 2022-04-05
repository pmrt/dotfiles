local plugin = require('cmp')
local luasnip = require('luasnip')
local icons = require('core.theme.icons')
local config = require('config')

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

plugin.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-d>'] = plugin.mapping(plugin.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-u>'] = plugin.mapping(plugin.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = plugin.mapping(plugin.mapping.complete(), { 'i', 'c' }),
    ['<C-e>'] = plugin.mapping({
      i = plugin.mapping.abort(),
      c = plugin.mapping.close(),
    }),
    -- disabled for autopairs mapping
    ['<CR>'] = plugin.mapping.confirm({
      behavior = plugin.ConfirmBehavior.Insert,
      select = true,
    }),
    ['<C-l>'] = plugin.mapping(function(fallback)
      luasnip.jump(1)
    end, {
      'i',
      's',
    }),
    ['<C-h>'] = plugin.mapping(function(fallback)
      luasnip.jump(-1)
    end, {
      'i',
      's',
    }),
    ['<Tab>'] = plugin.mapping(function(fallback)
      if plugin.visible() then
        plugin.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        plugin.complete()
      else
        fallback()
      end
    end, {
      'i',
      's',
    }),
    ['<S-Tab>'] = plugin.mapping(function(fallback)
      if plugin.visible() then
        plugin.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {
      'i',
      's',
    }),
  },
  documentation = {
    border = config.border,
    winhighlight = 'FloatBorder:FloatBorder,Normal:Normal',
  },
  experimental = {
    ghost_text = true,
  },
  sources = plugin.config.sources({
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    {
      name = 'buffer',
      option = {
        get_bufnrs = function()
          return vim.api.nvim_list_bufs()
        end
      }
    },
    { name = 'luasnip' },
    { name = 'path' },
  }),
  formatting = {
    format = function(entry, vim_item)
      -- Kind icons
      vim_item.kind = string.format('%s %s', icons.kind_icons[vim_item.kind], vim_item.kind)
      vim_item.menu = ({
        nvim_lsp = '[lsp]',
        luasnip = '[snip]',
        buffer = '[buf]',
        path = '[path]',
        nvim_lua = '[nvim_api]',
      })[entry.source.name]
      return vim_item
    end,
  },
})

plugin.setup.cmdline('/', {
  sources = {
    { name = 'buffer' },
  }
})
plugin.setup.cmdline(':', {
  sources = plugin.config.sources({
  { name = 'path' }
  }, {
    { name = 'cmdline' }
    })
})

vim.cmd([[
  augroup DisableCmpOnTelescopeGroup
   autocmd!
   autocmd FileType TelescopePrompt lua require('cmp').setup.buffer { enabled = false }
  augroup END
]])
