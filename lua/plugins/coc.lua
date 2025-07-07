return {
  {
    'neoclide/coc.nvim',
    branch = 'master',
    build = 'npm ci',
    config = function ()
      vim.fn['coc#config']('inlayHint.enable', false)
    end
  }
}
