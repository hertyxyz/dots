local C = require("misc.custom")

local M = {}

local u_trans = "99"

-- Right Buttons

function M.custom_close_button(c)
    local buttons = gears.table.join(
        awful.button(
            {}, mouse.LEFT, function()
                c:kill()
            end
        )
    )
    local col = "#d94331"
    local col_d = "#d94331" .. u_trans
    local widget =
        C.hover_effect(
        {
            {
                {
                    nil,
                    {
                        widget = wibox.container.background,
                        shape = gears.shape.circle,
                        forced_width = 14,
                        id = "icon",
                        bg = col_d,
                        forced_height = 14
                    },
                    nil,
                    layout = wibox.layout.align.vertical,
                    expand = "none"
                },
                widget = wibox.container.margin,
                left = 4,
                right = 12
            },
            widget = wibox.container.background
        },
        function(w, m)
            if m then
                -- w.bg = col
                w:get_children_by_id("icon")[1].bg = col
            else
                --w.bg = beautiful.transparent
                w:get_children_by_id("icon")[1].bg = col_d
            end
        end
    )

    widget:buttons(buttons)

    return widget
end

function M.custom_maximized_button(c)
    local buttons = gears.table.join(
        awful.button(
            {}, mouse.LEFT, function()
                c.maximized = not state
                state = not state
            end
        )
    )
    local col = "#689d6a"
    local col_d = "#689d6a" .. u_trans
    local widget =
        C.hover_effect(
        {
            {
                {
                    nil,
                    {
                        widget = wibox.container.background,
                        shape = gears.shape.circle,
                        forced_width = 14,
                        id = "icon",
                        bg = col_d,
                        forced_height = 14
                    },
                    nil,
                    layout = wibox.layout.align.vertical,
                    expand = "none"
                },
                widget = wibox.container.margin,
                left = 4,
                right = 4
            },
            widget = wibox.container.background
        },
        function(w, m)
            if m then
                -- w.bg = col
                w:get_children_by_id("icon")[1].bg = col
            else
                --w.bg = beautiful.transparent
                w:get_children_by_id("icon")[1].bg = col_d
            end
        end
    )

    widget:buttons(buttons)

    return widget
end

function M.custom_minimized_button(c)
    local buttons = gears.table.join(
        awful.button(
            {}, mouse.LEFT, function()
                c.minimized = not c.minimized
            end
        )
    )
    local col = "#d79921"
    local col_d = "#d79921" .. u_trans
    local widget =
        C.hover_effect(
        {
            {
                {
                    nil,
                    {
                        widget = wibox.container.background,
                        shape = gears.shape.circle,
                        forced_width = 14,
                        id = "icon",
                        bg = col_d,
                        forced_height = 14
                    },
                    nil,
                    layout = wibox.layout.align.vertical,
                    expand = "none"
                },
                widget = wibox.container.margin,
                left = 4,
                right = 4
            },
            widget = wibox.container.background
        },
        function(w, m)
            if m then
                -- w.bg = col
                w:get_children_by_id("icon")[1].bg = col
            else
                --w.bg = beautiful.transparent
                w:get_children_by_id("icon")[1].bg = col_d
            end
        end
    )

    widget:buttons(buttons)

    return widget
end

-- Left Buttons

function M.custom_floating_button(c)
    local buttons = gears.table.join(
        awful.button(
            {}, mouse.LEFT, function()
                c.floating = not c.floating
            end
        )
    )
    local col = "#9e31d9"
    local col_d = "#9e31d9" .. u_trans
    local widget =
        C.hover_effect(
        {
            {
                {
                    nil,
                    {
                        widget = wibox.container.background,
                        shape = gears.shape.circle,
                        forced_width = 14,
                        id = "icon",
                        bg = col_d,
                        forced_height = 14
                    },
                    nil,
                    layout = wibox.layout.align.vertical,
                    expand = "none"
                },
                widget = wibox.container.margin,
                left = 12,
                right = 4
            },
            widget = wibox.container.background
        },
        function(w, m)
            if m then
                -- w.bg = col
                w:get_children_by_id("icon")[1].bg = col
            else
                --w.bg = beautiful.transparent
                w:get_children_by_id("icon")[1].bg = col_d
            end
        end
    )

    widget:buttons(buttons)

    return widget
end

function M.custom_sticky_button(c)
    local buttons = gears.table.join(
        awful.button(
            {}, mouse.LEFT, function()
                c.sticky = not c.sticky
            end
        )
    )
    local col = "#31c1d9"
    local col_d = "#31c1d9" .. u_trans
    local widget =
        C.hover_effect(
        {
            {
                {
                    nil,
                    {
                        widget = wibox.container.background,
                        shape = gears.shape.circle,
                        forced_width = 14,
                        id = "icon",
                        bg = col_d,
                        forced_height = 14
                    },
                    nil,
                    layout = wibox.layout.align.vertical,
                    expand = "none"
                },
                widget = wibox.container.margin,
                left = 4,
                right = 4
            },
            widget = wibox.container.background
        },
        function(w, m)
            if m then
                -- w.bg = col
                w:get_children_by_id("icon")[1].bg = col
            else
                --w.bg = beautiful.transparent
                w:get_children_by_id("icon")[1].bg = col_d
            end
        end
    )

    widget:buttons(buttons)

    return widget
end

function M.custom_ontop_button(c)
    local buttons = gears.table.join(
        awful.button(
            {}, mouse.LEFT, function()
                c.ontop = not c.ontop
            end
        )
    )
    local col = "#b3b3b3"
    local col_d = "#b3b3b3" .. u_trans
    local widget =
        C.hover_effect(
        {
            {
                {
                    nil,
                    {
                        widget = wibox.container.background,
                        shape = gears.shape.circle,
                        forced_width = 14,
                        id = "icon",
                        bg = col_d,
                        forced_height = 14
                    },
                    nil,
                    layout = wibox.layout.align.vertical,
                    expand = "none"
                },
                widget = wibox.container.margin,
                left = 4,
                right = 4
            },
            widget = wibox.container.background
        },
        function(w, m)
            if m then
                -- w.bg = col
                w:get_children_by_id("icon")[1].bg = col
            else
                --w.bg = beautiful.transparent
                w:get_children_by_id("icon")[1].bg = col_d
            end
        end
    )

    widget:buttons(buttons)

    return widget
end

return M
