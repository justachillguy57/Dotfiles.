require("noice").setup({
    cmdline = {
        format = {
            search_down = {
                kind = "search",
                pattern = "^/",
                icon = " ",  -- Magnifying glass icon (nerd font icon)
                lang = "regex",
            },
            search_up = {
                kind = "search",
                pattern = "^\\?",
                icon = " ",  -- Magnifying glass icon for reverse search
                lang = "regex",
            },
        },
    },
})

