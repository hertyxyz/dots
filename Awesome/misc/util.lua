-- This file is home to a bunch of small helper functions

-- The base util namespace contains random functions
local util = {}
-- The util.shape namespace contains shape generators
util.shape = {}
-- The util.float namespace contains functions to force layout position
util.float = {}

function util.is_widget(w)
  if w["connect_signal"] ~= nil then return w else return wibox.widget(w) end
end

function util.rgba(r, g, b, a)
  return string.format("#%x%x%x%x", r, g, b, math.ceil(a or 0 * 255))
end

function util.colorify(str, color)
  return "<span color=\"" .. color .. "\">" .. str .. "</span>"
end

function util.trim(s)
  return (s:gsub("^%s*(.-)%s*$", "%1"))
end

function util.hover_effect(w, e)
  w = util.is_widget(w)
  w:connect_signal("mouse::enter", function() e(w, true)  end)
  w:connect_signal("mouse::leave", function() e(w, false) end)
end

function util.shape.hexagon(cr, w, h)
  t = 0
  if w > h then t = h else t = w end
  cr:move_to(t/2, 0)
  cr:line_to(t, t*3/11)
  cr:line_to(t, t*8/11)
  cr:line_to(t/2, t)
  cr:line_to(0, t*8/11)
  cr:line_to(0, t*3/11)
  cr:close_path()
end

function util.float.left(x)
  return wibox.widget {
    x, nil, nil,
    layout = wibox.layout.align.horizontal,
    expand = "none"
  }
end

function util.float.center(x)
  return wibox.widget {
    nil, x, nil,
    layout = wibox.layout.align.horizontal,
    expand = "none"
  }
end

function util.float.right(x)
  return wibox.widget {
    nil, nil, x,
    layout = wibox.layout.align.horizontal,
    expand = "none"
  }
end

return util
