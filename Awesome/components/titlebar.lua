local B = require("subcomponents.titlebar_buttons")


client.connect_signal("request::titlebars", function(c)
    local titlewidget = awful.titlebar.widget.titlewidget(c)
    titlewidget.font = "SF Pro Display Semibold 10"

    -- buttons for the titlebar
    local buttons = gears.table.join(
        awful.button({ }, mouse.LEFT, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.move(c)
            titlewidget.font = "SF Pro Display Semibold 10"
        end),
        awful.button({ }, mouse.RIGHT, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.resize(c)
        end)
        )



    local main = wibox.widget {
        { -- Title
            align  = "center",
            widget = titlewidget
        },
        buttons = buttons,
        layout  = wibox.layout.flex.horizontal
    }
    main:connect_signal("mouse::leave", function()
        titlewidget.font = "SF Pro Display Semibold 10"
    end)

    awful.titlebar(c, {
        size = 32,
        -- comment out for normal look
        bg_normal = "#1c1f26",
        bg_focus = "#1c1f26"
    }) : setup {
        { -- Left
            B.custom_floating_button(c),
            B.custom_sticky_button(c),
            B.custom_ontop_button(c),
            layout = wibox.layout.fixed.horizontal
        },
        main,
        { -- Right
            B.custom_minimized_button(c),
            B.custom_maximized_button(c),
            B.custom_close_button(c),
            layout = wibox.layout.fixed.horizontal
        },
        layout = wibox.layout.align.horizontal
    }
end)
