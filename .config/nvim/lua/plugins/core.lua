-- Transparent Tokyonight with LazyVim
return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,            -- make Normal/side panels bg = none
      styles = {
        sidebars = "transparent",    -- Neo-tree, help, qf
        floats = "transparent",      -- Telescope, LSP popups
      },
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
      vim.cmd.colorscheme("tokyonight")

      -- Harden transparency across common UI groups
      local groups = {
        "Normal",
        "NormalNC",
        "NormalFloat",
        "FloatBorder",
        "SignColumn",
        "MsgArea",
        "Pmenu",
        "PmenuSel",
        "PmenuSbar",
        "StatusLine",
        "StatusLineNC",
        "WinSeparator",
        "LineNr",
        "FoldColumn",
        "CursorLineNr",
        "TelescopeNormal",
        "TelescopeBorder",
        "DiagnosticVirtualTextError",
        "DiagnosticVirtualTextWarn",
        "DiagnosticVirtualTextInfo",
        "DiagnosticVirtualTextHint",
        "NeoTreeNormal",
        "NeoTreeNormalNC",
      }
      for _, g in ipairs(groups) do
        vim.api.nvim_set_hl(0, g, { bg = "none" })
      end
    end,
  },
}

