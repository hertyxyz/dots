local ram_update_interval = 20
local cpu_update_interval = 5
local temp_update_interval = 15
local disk_update_interval = 10
local batt_update_interval = 15

local ram_script = [[ sh -c "
  free -m | grep 'Mem:' | awk '{printf \"%d@@%d@\", $7, $2}'
" ]]
local cpu_script = [[ sh -c "
  vmstat 1 2 | tail -1 | awk '{printf \"%d\", $15}'
" ]]
local temp_script = [[ sh -c "
  sensors | grep Package | awk '{print $4}' | cut -c 2-3
" ]]
local disk_script = [[ sh -c "
  df -kh -B 1MB /dev/nvme0n1p2 | tail -1 | awk '{printf \"%d@%d\", $4, $3}'
" ]]
local batt_script = [[ sh -c "

" ]]

awful.widget.watch(ram_script, ram_update_interval, function(w, s)
                     local a = s:match('(.*)@@')
                     local t = s:match('@@(.*)@')
                     local u = tonumber(t) - tonumber(a)
                     awesome.emit_signal("facts::ram", used, total)
end)

awful.widget.watch(cpu_script, cpu_update_interval, function(w, s)
                     local idle = s
                     idle = string.gsub(idle, "^%s*(.-)%s*$", "%1")
                     awesome.emit_signal("facts::cpu", 100 - tonumber(idle))
end)

awful.widget.watch(temp_script, temp_update_interval, function(w, s)
                     awesome.emit_signal("facts::temp", tonumber(s))
end)

awful.widget.watch(disk_script, disk_update_interval, function(w, s)
                     local a = tonumber(s:match('^(.*)@')) / 1000
                     local u = tonumber(s:match('@(.*)$')) / 1000
                     awesome.emit_signal("facts::disk", u, a + u)
end)

awful.spawn.easy_async_with_shell(
  "sh -c 'out=\"$(find /sys/class/power_supply/BAT?/capacity)\" && (echo \"$out\" | head -1) || false' ",
  function(batt, _, _, code)
    if not (code == 0) then return end
    awful.widget.watch("cat " .. batt, batt_update_interval, function(w, s)
                         awesome.emit_signal("facts::battery", tonumber(s))
    end)
  end
)
