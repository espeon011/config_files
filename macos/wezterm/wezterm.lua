local wezterm = require "wezterm"

wezterm.on("update-right-status",
  function(window, _)
    local date = wezterm.strftime "%Y-%m-%d(%a) %H:%M"

    local hostname = wezterm.hostname()
    local dot = hostname:find "[.]"
    if dot then
      hostname = hostname:sub(1, dot-1)
    end

    local username = os.getenv("USER")

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

wezterm.on("format-tab-title",
  function(tab, _, _, _, _, _)
    local pane = tab.active_pane
    local title = tab.tab_index .. ": " .. basename(pane.foreground_process_name)
    return {
      { Text = ' ' ..  title .. ' ' },
    }
  end
)

return {
  -- color_scheme = "Ayu Mirage (Gogh)",
  -- color_scheme = "Ayu Mirage",
  -- color_scheme = "Ayu Dark (Gogh)",
  color_scheme = "Catppuccin Mocha",
  -- color_scheme = "Catppuccin Mocha (Gogh)",

  -- font = wezterm.font "SF Mono Square",
  -- font_size = 20,

  font = wezterm.font "Moralerspace Argon HWNF",
  font_size = 18,

  -- font = wezterm.font_with_fallback { "SF Mono", "Hiragino Sans" },
  -- font_size = 16,

  use_fancy_tab_bar = false,

  window_background_opacity = 0.75,
  text_background_opacity = 0.75,
  macos_window_background_blur = 20,

  keys = {
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
}
