-- This component is the tag list that is shown on the left side of the bar,
--   containing a list of the available tags on the current screen

-- Enable bling tag previews
bling.widget.tag_preview.enable {
  show_client_content = false,
  x = 10,
  y = 30,
  scale = 0.25,
  honor_padding = true,
  honor_workarea = true
}

-- Create the widget
return function(s)
  return awful.widget.taglist {
    screen = s,
    filter = awful.widget.taglist.filter.all,
    layout = wibox.layout.fixed.horizontal,
    style = {
      fg_focus =    "#81a1c1",
      fg_occupied = "#5a5f69",
      fg_empty =    "#2e3440"
    },
    widget_template = {
      {
        id = "text_role",
        widget = wibox.widget.textbox
      },
      widget = wibox.container.margin,
      margins = 6,
      create_callback = function(self, c3, _, _)
        self:connect_signal("mouse::enter", function()
                              if #c3:clients() > 0 then
                                awesome.emit_signal("bling::tag_preview::update", c3)
                                awesome.emit_signal("bling::tag_preview::visibility", s, true)
                              end
        end)
        self:connect_signal("mouse::leave", function()
                              awesome.emit_signal("bling::tag_preview::visibility", s, false)
        end)
      end
    },
    buttons = {
      awful.button({  },        mouse.LEFT,         function(t) t:view_only() end),
      awful.button({ modkey },  mouse.LEFT,         function(t)
        if client.focus then client.focus:move_to_tag(t) end
      end),
      awful.button({  },        mouse.RIGHT,        awful.tag.viewtoggle),
      awful.button({ modkey },  mouse.RIGHT,        function(t)
        if client.focus then client.focus:toggle_tag(t) end
      end),
      awful.button({  },        mouse.SCROLL_UP,    function(t) awful.tag.viewprev(t.screen) end),
      awful.button({  },        mouse.SCROLL_DOWN,  function(t) awful.tag.viewnext(t.screen) end)
    }
  }
end
