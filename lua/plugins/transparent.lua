return {
  -- Load transparent.nvim immediately (not lazy loaded)
  {
    "xiyaowong/transparent.nvim",
    lazy = false,
    config = function()
      require("transparent").setup({
        -- Optional: customize what highlight groups to clear; defaults are fine
        groups = {
          "Normal",
          "NormalNC",
          "Comment",
          "Constant",
          "Special",
          "Identifier",
          "Statement",
          "PreProc",
          "Type",
          "Underlined",
          "Todo",
          "String",
          "Function",
          "Conditional",
          "Repeat",
          "Operator",
          "Structure",
          "LineNr",
          "NonText",
          "SignColumn",
          "CursorLine",
          "CursorLineNr",
          "StatusLine",
          "StatusLineNC",
          "EndOfBuffer",
        },
        extra_groups = {}, -- clear additional groups if needed
        exclude_groups = {}, -- skip groups you want to keep
        on_clear = function() end, -- optional hook after clearing
      })
    end,
  },
}
