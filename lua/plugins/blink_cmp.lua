local M = {

  {
    'saghen/blink.cmp',
    lazy = false,
    enabled = true,
    build = "cargo build --release",
    opts = {
      hightlight = {
        use_nvim_cmp_as_default = true,
      },
      nerd_font_variant = 'normal',
      keymap = {
        accept = '<cr>',
        select_next = '<Tab>',
        select_prev = '<S-Tab>',
      }
    }
  }

}

return M
