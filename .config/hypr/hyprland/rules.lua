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
