pcall(require, "luarocks.loader")

-- The standard stuff
gears = require("gears")
awful = require("awful")
-- Widgets / Layout
wibox = require("wibox")
-- Theme handling
beaut = require("beautiful")
-- Better tiling
machi = require("layout-machi")
-- Bling - utilities
bling = require("bling")

-- Load theme
beaut.init("~/.config/awesome/theme/theme.lua")

-- DPI Correction (set true to enable)
dpi = require("beautiful.xresources").apply_dpi
awful.screen.set_auto_dpi_enabled(false)

-- Load startup script
awful.spawn.with_shell("~/.awesomerc")

-- User variable definitions
modkey = "Mod4"                         -- "Mod4" is win, "Mod1" is alt
terminal = "alacritty"
editor = os.getenv("EDITOR") or "emacs"
editor_cmd = editor                     -- Should launch a term if not a GUI editor
font = ""                               -- Should be a nerd font if you want icons
sloppy_focus = true                     -- Should the mouse focus windows on hover

-- Non-user variables
home_dir = os.getenv("HOME")

-- Set tiling layouts
awful.layout.layouts = {
  machi.default_layout,
  awful.layout.suit.floating,
  awful.layout.suit.tile,
}

-- Load external
require("misc.errors")          -- Error handling
require("misc.facts")           -- Gathers facts about the system

require("components.bar")       -- Not sure this one needs explaining...

-- Set up the mouse
mouse = {
  LEFT = 1, MIDDLE = 2, RIGHT = 3, SCROLL_UP = 4, SCROLL_DOWN = 5
}
clientbuttons = gears.table.join(
  awful.button({        }, mouse.LEFT, function(c)
    c:emit_signal("request::activate", "mouse_click", { raise = true })
  end),
  awful.button({ modkey }, mouse.LEFT, function(c)
    c:emit_signal("request::activate", "mouse_click", { raise = true })
    awful.mouse.client.move(c)
  end),
  awful.button({ modkey }, mouse.RIGHT, function(c)
    c:emit_signal("request::activate", "mouse_click", { raise = true })
    awful.mouse.client.resize(c)
  end)
)

-- Window layout rules
awful.rules.rules = {
  { -- This rule matches all clients
    rule = {},
    properties = {
      border_width = beaut.border_width,
      border_color = beaut.border_normal,
      focus = awful.client.focus.filter,
      raise = true,
      --keys = require("misc.keybindings.client"),
      buttons = clientbuttons,
      screen = awful.screen.preferred,
      placement = awful.placement.no_overlap + awful.placement.no_offscreen,
      titlebars_enabled = false
    }
  },
  { -- This rule will make specific clients floating
    rule_any = {
      instance = {
        "DTA",              -- DownThemAll Firefox addon
        "copyq",
      },
      class = {
        "Arandr",           -- arandr
        "gpick",            -- Color Picker for X
        "Tor Browser",      -- Fixed window size to prevent fingerprinting
      },
      name = {
        "Event Tester",     -- xev - X event tester
      },
      role = {
        "AlarmWindow",      -- Thunderbird calendar alarms
        "ConfigManager",    -- Thunderbird config manager
        "pop-up",           -- Chrome pop-out dev-tools
      }
    },
    properties = {
      floating = true
    }
  },
}

-- Signal management
client.connect_signal("manage",
function(c)
  if awesome.startup
    and not c.size_hints.user_position
    and not c.size_hints.program_position then
    -- Prevents clients from being off-screen when screen count changes
    awful.placement.no_offscreen(c)
  end
end)

-- Sloppy focus
if sloppy_focus then
  client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", { raise = false })
  end)
  client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
  client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
end
