terminal = "kitty"
fileManager = terminal .. " sh -c ranger"
menu = "fuzzel"
clipboardMenu = "cliphist list | fuzzel --dmenu | cliphist decode | wl-copy"

hl.bind("SUPER + Return", hl.dsp.exec_cmd(terminal))
hl.bind("SUPER + Q", hl.dsp.window.close(), { description = "Close focus window" })
hl.bind("SUPER + SHIFT + Q", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind("SUPER + D", hl.dsp.exec_cmd(fileManager))
hl.bind("SUPER + F", hl.dsp.window.float({ action = "toggle" }))

for i=1, 10 do
    local key = i % 10
    hl.bind("SUPER + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind("SUPER + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind("SUPER + left", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + right", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + down", hl.dsp.focus({ direction = "down" }))
hl.bind("SUPER + up", hl.dsp.focus({ direction = "up" }))

-- Graphite 2 Pro Wireless
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true, repeating = true })

hl.bind("SUPER + F4", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })
hl.bind("SUPER + F6", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
hl.bind("SUPER + F7", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("SUPER + F8", hl.dsp.exec_cmd("playerctl next"), { locked = true })

hl.bind("SUPER + Pause", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true })

hl.bind("SUPER + M", hl.dsp.exec_cmd(menu))

hl.bind("SHIFT + Print", hl.dsp.exec_cmd('grim -g "$(slurp)" - | tee ~/Pictures/screenshots/$(date +"%Y-%m-%d_%H-%M-%S").png | wl-copy && notify-send "Screenshot saved successfully" "$(date +"%Y-%m-%d_%H-%M-%S").png"'), { locked = true} )
hl.bind("Print", hl.dsp.exec_cmd('grim - | tee ~/Pictures/screenshots/$(date +"%Y-%m-%d_%H-%M-%S").png | wl-copy && notify-send "Screenshot saved successfully" "$(date +"%Y-%m-%d_%H-%M-%S").png"'), { locked = true} )

hl.bind("SUPER + Period", hl.dsp.exec_cmd(clipboardMenu), { locked = true })

hl.bind("SUPER + L", hl.dsp.exec_cmd("hyprlock"), { locked = true })
