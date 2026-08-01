local wezterm = require "wezterm"

wezterm.on("update-right-status",
  function(window, _)
    local date = wezterm.strftime "%Y-%m-%d(%a) %H:%M"

    -- hostname
    local hostname = wezterm.hostname()
    local dot = hostname:find "[.]"
    if dot then
      hostname = hostname:sub(1, dot-1)
    end

    -- username
    local username = os.getenv("USER")
    if username == nil then
      username = os.getenv("USERNAME") -- for Windows
    end

    window:set_right_status(wezterm.format {
      { Text = " " .. username .. " | " .. hostname ..  " | "  .. date .. " " },
    })
  end
)

-- Equivalent to POSIX basename(3)
-- Given "/foo/bar" returns "bar"
-- Given "c:\\foo\\bar" returns "bar"
local function basename(s)
  return string.gsub(s, "(.*[/\\])(.*)", "%2")
end

local function remove_exe(s)
  return string.gsub(s, "(.*)([.]exe)", "%1")
end

wezterm.on("format-tab-title",
  function(tab, _, _, _, _, _)
    local pane = tab.active_pane
    local title = tab.tab_index .. ": " .. remove_exe(basename(pane.foreground_process_name))
    return {
      { Text = ' ' ..  title .. ' ' },
    }
  end
)

-- local font_with_fallback = wezterm.font_with_fallback {
--   {
--     family = 'M PLUS Code Latin 60',
--     weight = 'Regular',
--     italic = false,
--   },
--   {
--     family = 'M PLUS 1',
--     weight = 'Regular',
--     italic = false,
--   }
-- }

return {
  -- color_scheme = "Ayu Mirage",
  color_scheme = "Ayu Mirage (Gogh)",

  -- font = wezterm.font "Moralerspace Argon HW",
  -- font_size = 14,

  font = wezterm.font_with_fallback {'M PLUS Code Latin 60', 'M PLUS 1',},
  -- font = wezterm.font_with_fallback {'M PLUS Code Latin 60', 'M PLUS U',},
  font_size = 13,

  -- font = wezterm.font_with_fallback {"monofur for Powerline", "M PLUS 1", "Moralerspace Argon HW"},
  -- font_size = 16,

  -- font_rules = {
  --   {
  --     intensity = 'Half',
  --     font = font_with_fallback,
  --   },
  --   {
  --     intensity = 'Normal',
  --     font = font_with_fallback,
  --   },
  --   {
  --     intensity = 'Bold',
  --     font = font_with_fallback,
  --   },
  -- },

  use_fancy_tab_bar = false,

  window_background_opacity = 0.95,
  text_background_opacity = 0.95,

  keys = {
    -- {
    --   key = 't',
    --   mods = "ALT",
    --   action = wezterm.action.SpawnTab "CurrentPaneDomain",
    -- },
    -- {
    --   key = 'n',
    --   mods = "ALT",
    --   action = wezterm.action.SpawnWindow,
    -- },
    -- {
    --   key = 'w',
    --   mods = "ALT",
    --   action = wezterm.action.CloseCurrentPane { confirm = true },
    -- },
    {
      key = 'd',
      mods = "ALT",
      action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" },
    },
    {
      key = 'd',
      mods = "ALT|SHIFT",
      action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" },
    },
    {
      key = 'h',
      mods = "CTRL|SHIFT",
      action = wezterm.action.ActivatePaneDirection "Left"
    },
    {
      key = 'j',
      mods = "CTRL|SHIFT",
      action = wezterm.action.ActivatePaneDirection "Down"
    },
    {
      key = 'k',
      mods = "CTRL|SHIFT",
      action = wezterm.action.ActivatePaneDirection "Up"
    },
    {
      key = 'l',
      mods = "CTRL|SHIFT",
      action = wezterm.action.ActivatePaneDirection "Right"
    },
  },

  -- default_prog = { "pwsh" },
  default_prog = { "C:/Users/psian/scoop/apps/git/current/usr/bin/bash.exe", "--login" },
}
