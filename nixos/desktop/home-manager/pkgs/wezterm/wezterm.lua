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
  front_end = "OpenGL",
  -- front_end = "WebGpu",
  -- front_end = "Software",

  color_scheme = "Catppuccin Mocha",
  -- color_scheme = "Catppuccin Frappe",
  font = wezterm.font_with_fallback { "M PLUS Code Latin 60", "M PLUS 1" },
  font_size = 14,

  use_fancy_tab_bar = false,
  window_background_opacity = 0.9,
  text_background_opacity = 0.9,

  keys = {
    {
      key = 'd',
      mods = "ALT",
      action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
    {
      key = 'd',
      mods = "ALT|SHIFT",
      action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
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
}

