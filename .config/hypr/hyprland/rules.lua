hl.layer_rule({ match = { namespace = "wlogout" }, blur = true, animation = "fade" })

hl.window_rule({
    name  = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

hl.window_rule({
    name = "center all float windows",
    match = {float = true},
    center = true
})

hl.window_rule({
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },
    no_focus = true,
})

hl.window_rule({
    name = "Telegram",
    match = {
        class = "org.telegram.desktop"
    },
    float = true,
    center = true,
    workspace = 5
})

hl.window_rule({
    name = "GTA San Andreas",
    match = {
        class = "gta_sa.exe",
        title = "Arizona"
    },
    workspace = 7
}) 

hl.window_rule({
    match = {
        class = "gta_sa.exe",
        title = "libcore",
    },
    center = true,
    workspace = 7
})

hl.window_rule({
    name = "Steam Friend List",
    match = {
        class = "steam",
        title = "Friends List"
    },
    float = true,
    center = true
})

hl.window_rule({
    name = "Steam Settings",
    match = {
        class = "steam",
        title = "Steam Settings"
    },
    float = true,
    center = true
})

hl.window_rule({
    name = "Steam",
    match = {
        class = "steam",
        title = "Steam"
    },
    float = true,
    center = true
})

hl.window_rule({
    name = "Brotato",
    match = {
        class = "Brotato",
        title = "Brotato"
    },
    center = true,
    float = true
})

hl.window_rule({
    name = "Obsidian Settings",
    match = {
        class = "md.obsidian.Obsidian",
        title = "Настройки.*"
    },
    float = true,
    center = true
})


hl.window_rule({match = {title = "^(Open File)(.*)$" }, center = true, float = true})
hl.window_rule({match = {title = "^(Select a File)(.*)$" }, center = true, float = true})
hl.window_rule({match = {title = "^(Choose wallpaper)(.*)$" }, center = true, float = true, size = {"(monitor_w*0.60)", "(monitor_h*0.65)"} })
hl.window_rule({match = {title = "^(Open Folder)(.*)$" }, center = true, float = true})
hl.window_rule({match = {title = "^(Select the mod file to import)(.*)$" }, center = true, float = true}) -- Gale
hl.window_rule({match = {title = "^(Save As)(.*)$" }, center = true, float = true})
hl.window_rule({match = {title = "^(Library)(.*)$" }, center = true, float = true})
hl.window_rule({match = {title = "^(File Upload)(.*)$" }, center = true, float = true})
hl.window_rule({match = {title = "^(.*)(wants to save)$" }, center = true, float = true})
hl.window_rule({match = {title = "^(.*)(wants to open)$" }, center = true, float = true})
hl.window_rule({match = {class = "^(pavucontrol)$" }, center = true, float = true, size = {"(monitor_w*0.45)", "(monitor_h*0.45)"} })
hl.window_rule({match = {class = "^(org.pulseaudio.pavucontrol)$" },  center = true, float = true, size = {"(monitor_w*0.45)", "(monitor_h*0.45)"} })
hl.window_rule({match = {class = "^(nm-connection-editor)$" }, center = true, float = true, size = {"(monitor_w*0.45)", "(monitor_h*0.45)"} })
hl.window_rule({match = {class = ".*plasmawindowed.*" }, float = true})
hl.window_rule({match = {class = "kcm_.*" }, float = true})
hl.window_rule({match = {class = ".*bluedevilwizard" }, float = true})
hl.window_rule({match = {title = ".*Welcome" }, float = true})
hl.window_rule({match = {title = "^(illogical-impulse Settings)$" }, float = true})
hl.window_rule({match = {title = ".*Shell conflicts.*" }, float = true})
hl.window_rule({match = {class = "org.freedesktop.impl.portal.desktop.kde" }, float = true, size = {"(monitor_w*0.60)", "(monitor_h*0.65)"} })

