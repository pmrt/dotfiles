local plugin = require('telescope')
local map = require('core.utils').map
local actions = require('telescope.actions')

local mappings = {
  i = {
    ['<C-n>'] = actions.cycle_history_next,
    ['<C-p>'] = actions.cycle_history_prev,

    ['<C-j>'] = actions.move_selection_next,
    ['<C-k>'] = actions.move_selection_previous,

    ['<C-c>'] = actions.close,

    ['<Down>'] = actions.move_selection_next,
    ['<Up>'] = actions.move_selection_previous,

    ['<CR>'] = actions.select_default,
    ['<C-x>'] = actions.select_horizontal,
    ['<C-v>'] = actions.select_vertical,
    ['<C-t>'] = actions.select_tab,

    ['<C-u>'] = actions.preview_scrolling_up,
    ['<C-d>'] = actions.preview_scrolling_down,

    ['<PageUp>'] = actions.results_scrolling_up,
    ['<PageDown>'] = actions.results_scrolling_down,

    ['<Tab>'] = actions.toggle_selection + actions.move_selection_worse,
    ['<S-Tab>'] = actions.toggle_selection + actions.move_selection_better,
    ['<C-q>'] = actions.send_to_qflist + actions.open_qflist,
    ['<M-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
    ['<C-l>'] = actions.complete_tag,
    ['<C-_>'] = actions.which_key, -- keys from pressing <C-/>
  },

  n = {
    ['<esc>'] = actions.close,
    ['<CR>'] = actions.select_default,
    ['<C-x>'] = actions.select_horizontal,
    ['<C-v>'] = actions.select_vertical,
    ['<C-t>'] = actions.select_tab,

    ['<Tab>'] = actions.toggle_selection + actions.move_selection_worse,
    ['<S-Tab>'] = actions.toggle_selection + actions.move_selection_better,
    ['<C-q>'] = actions.send_to_qflist + actions.open_qflist,
    ['<M-q>'] = actions.send_selected_to_qflist + actions.open_qflist,

    ['j'] = actions.move_selection_next,
    ['k'] = actions.move_selection_previous,
    ['H'] = actions.move_to_top,
    ['M'] = actions.move_to_middle,
    ['L'] = actions.move_to_bottom,

    ['<Down>'] = actions.move_selection_next,
    ['<Up>'] = actions.move_selection_previous,
    ['gg'] = actions.move_to_top,
    ['G'] = actions.move_to_bottom,

    ['<C-u>'] = actions.preview_scrolling_up,
    ['<C-d>'] = actions.preview_scrolling_down,

    ['<PageUp>'] = actions.results_scrolling_up,
    ['<PageDown>'] = actions.results_scrolling_down,

    ['?'] = actions.which_key,
  },
}

plugin.setup {
  defaults = {
    prompt_prefix = ' ',
    selection_caret = ' ',
    path_display = { 'smart' },
    file_ignore_patterns = { 'node_modules' },
    mappings = mappings,
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
    --  find_files = {
    --   prompt_title = '✨ Search Project ✨',
    --   mappings = mappings,
    --   hidden = true,
    -- },
    -- diagnostics = {
    --   mappings = mappings,
    -- },
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false = exact matching
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = 'smart_case',
    }
  },
}
plugin.load_extension('fzf')

map('n', '<leader>ff', ':Telescope find_files<cr>')
map('n', '<leader>fa', ':Telescope find_files follow=true no_ignore=true hidden=true<cr>')
map('n', '<leader>fc', ':Telescope git_commits<CR>')
map('n', '<leader>fb', ':Telescope git_bcommits<CR>')
map('n', '<leader>fh', ':Telescope help_tags <CR>')
map('n', '<leader>fg', ':Telescope live_grep<cr>')
map('n', '<leader>fo', ':Telescope oldfiles<cr>')
map('n', '<leader>fs', '<cmd>lua require("telescope.builtin").lsp_document_symbols()<cr>')
