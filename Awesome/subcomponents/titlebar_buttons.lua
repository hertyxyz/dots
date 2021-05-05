local C = require("misc.custom")

local M = {}

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
                        bg = col,
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
                w:get_children_by_id("icon")[1].bg = col .. "90"
            else
                --w.bg = beautiful.transparent
                w:get_children_by_id("icon")[1].bg = col
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
                        bg = col,
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
                w:get_children_by_id("icon")[1].bg = col .. "90"
            else
                --w.bg = beautiful.transparent
                w:get_children_by_id("icon")[1].bg = col
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
                        bg = col,
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
                w:get_children_by_id("icon")[1].bg = col .. "90"
            else
                --w.bg = beautiful.transparent
                w:get_children_by_id("icon")[1].bg = col
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
                        bg = col,
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
                w:get_children_by_id("icon")[1].bg = col .. "90"
            else
                --w.bg = beautiful.transparent
                w:get_children_by_id("icon")[1].bg = col
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
                        bg = col,
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
                w:get_children_by_id("icon")[1].bg = col .. "90"
            else
                --w.bg = beautiful.transparent
                w:get_children_by_id("icon")[1].bg = col
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
                        bg = col,
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
                w:get_children_by_id("icon")[1].bg = col .. "90"
            else
                --w.bg = beautiful.transparent
                w:get_children_by_id("icon")[1].bg = col
            end
        end
    )

    widget:buttons(buttons)

    return widget
end

return M
