return {
  "olimorris/onedarkpro.nvim",
  priority = 1000,
  config = function()
    require('onedarkpro.config').set_theme('onedark_vivid')
    --require('onedarkpro').load()
  end
}
