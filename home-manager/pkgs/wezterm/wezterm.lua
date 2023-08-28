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

local font_with_fallback = wezterm.font_with_fallback {
  {
    family = 'M PLUS Code Latin 60',
    weight = 'Regular',
    italic = false,
  },
  {
    family = 'M PLUS 1',
    weight = 'Regular',
    italic = false,
  }
}

return {
  -- front_end = "WebGpu",

  color_scheme = "kanagawabones",
  -- color_scheme = "Catppuccin Mocha",
  -- color_scheme = "Catppuccin Frappe",
  -- font = wezterm.font "SF Mono Square",
  -- font_size = 19,
  font_rules = {
    {
      intensity = 'Half',
      font = font_with_fallback,
    },
    {
      intensity = 'Normal',
      font = font_with_fallback,
    },
    {
      intensity = 'Bold',
      font = font_with_fallback,
    },
  },
  font_size = 14,

  use_fancy_tab_bar = false,

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

