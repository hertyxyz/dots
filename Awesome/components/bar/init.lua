
screen.connect_signal("request::desktop_decoration",
function(s)
  -- Create a tag table for each screen
  awful.tag(workspaces, s, awful.layout.layouts[1])
  -- Create a imagebox to show the current layout
  s.mylayoutbox = awful.widget.layoutbox {
    screen = s,
    buttons = {
      awful.button({  }, mouse.LEFT,        function() awful.layout.inc(1)  end),
      awful.button({  }, mouse.RIGHT,       function() awful.layout.inc(-1) end),
      awful.button({  }, mouse.SCROLL_UP,   function() awful.layout.inc(1)  end),
      awful.button({  }, mouse.SCROLL_DOWN, function() awful.layout.inc(-1) end),
    }
  }
  -- Create a default clock widget
  local clock = wibox.widget.textclock("%I:%M%P")
  -- Toggle clock format on click
  clock:connect_signal("button::press", function() if clock.format == "%I:%M%P" then clock.format = "%I:%M%P %d/%m/%y" else clock.format = "%I:%M%P" end end)
  -- Create the bar
  s.h_bar = awful.wibar {
    position = "top",
    screen = s,
    ontop = false,
    background = "#1c1f26"
  }

  s.h_bar.widget = {
    {
      require("components.bar.taglist")(s),
      layout = wibox.layout.fixed.horizontal
    },
    {
      widget = wibox.container.margin,
      margins = 3
    },
    {
      clock,
      wibox.widget.systray(),
      layout = wibox.layout.fixed.horizontal
    },
    layout = wibox.layout.align.horizontal,
    expand = "none"
  }


end)
