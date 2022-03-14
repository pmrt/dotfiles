vim.api.nvim_exec(
  [[
  " OSC52 - It makes copy/paste work, even through SSH or mosh!
    augroup OSC52Group
      autocmd!
      autocmd TextYankPost * silent! lua vim.highlight.on_yank({timeout=250})
      autocmd TextYankPost * if v:event.operator is "y" && v:event.regname is "" | OSCYankReg " | endif
    augroup END
  ]],
  false
)
