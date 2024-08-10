return {
  "rebelot/heirline.nvim",
  opts = function(_, opts)
    local astro = require("astrocore")
    local status = require("astroui.status")
    local extend_tbl = astro.extend_tbl
    local hl = require("astroui.status.hl")

    opts.tabline = {
      { -- file tree padding
        condition = function(self)
          self.winid = vim.api.nvim_tabpage_list_wins(0)[1]
          self.winwidth = vim.api.nvim_win_get_width(self.winid)
          return self.winwidth ~= vim.o.columns -- only apply to sidebars
            and not require("astrocore.buffer").is_valid(
              vim.api.nvim_win_get_buf(self.winid)
            ) -- if buffer is not in tabline
        end,
        provider = function(self)
          return (" "):rep(self.winwidth + 1)
        end,
        hl = { bg = "tabline_bg" },
      },
      status.heirline.make_buflist(status.component.file_info(extend_tbl({
        file_icon = {
          condition = function(self) return not self._show_picker end,
          hl = hl.file_icon "tabline",
        },
        filename = {},
        filetype = false,
        unique_path = {
          hl = function(self) return hl.get_attributes(self.tab_type .. "_path") end,
        },
        padding = { right = 1 },
        hl = function(self)
          local tab_type = self.tab_type
          if self._show_picker and self.tab_type ~= "buffer_active" then tab_type = "buffer_visible" end
          return hl.get_attributes(tab_type)
        end,
        surround = false,
      }, opts))), -- component for each buffer tab
      status.component.fill({ hl = { bg = "tabline_bg" } }), -- fill the rest of the tabline with background color
      { -- tab list
        condition = function()
          return #vim.api.nvim_list_tabpages() >= 2
        end, -- only show tabs if there are more than one
        status.heirline.make_tablist({ -- component for each tab
          provider = status.provider.tabnr(),
          hl = function(self)
            return status.hl.get_attributes(
              status.heirline.tab_type(self, "tab"),
              true
            )
          end,
        }),
      },
    }
  end
}
