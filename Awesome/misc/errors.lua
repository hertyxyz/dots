local naughty = require("naughty")

-- Did an error happen on startup? If so, let the user know!
if awesome.startup_errors then
  naughty.notify({
      preset = naughty.config.presets.critical,
      title = "Awesome startup error!",
      text = awesome.startup_errors
  })
end

-- Handle errors that occur at runtime
do
  local estate = false
  awesome.connect_signal("debug::error", function(e)
                           if estate then return end
                           estate = true
                           naughty.notify({
                               preset = naughty.config.presets.critical,
                               title = "Awesome runtime error!",
                               text = tostring(e)
                           })
                           estate = false
  end)
end
