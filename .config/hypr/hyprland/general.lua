hl.monitor({ output = "HDMI-A-1", mode = "2560x1440@143.91Hz", position = "auto", scale = "auto" })

hl.config({
    xwayland = {
        force_zero_scaling = true
    }
})

hl.config({
    general = {
        border_size = 1,
        gaps_in = 4,
        gaps_out = 5,
        gaps_workspaces = 25,

        col = {
            active_border = "rgba(808080cc)",
            inactive_border = "rgba(595959aa)"
        },

        resize_on_border = false,

        layout = "master",
        
        snap = {
            enabled = true,
            window_gap = 4,
            monitor_gap = 5,
            respect_gaps = true
        }
    },
    decoration = {
        rounding = 0,
        rounding_power = 0,

        active_opacity = 1.0,
        inactive_opacity = 1.0,
        
        glow = {
            enabled = false
        },
        
        shadow = { 
            enabled = false
        }
    },
    animations = {
        enabled = false
    },
    master = {
        mfact = 0.5,
        new_on_top = true,
        new_status = "slave"
    },
    input = {
        kb_layout = "us,ru",
        kb_options = "grp:caps_toggle",

        repeat_rate = 45,
        repeat_delay = 250
    },
    misc = {
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
        font_family = "Roboto",
        middle_click_paste = true
    }
})

