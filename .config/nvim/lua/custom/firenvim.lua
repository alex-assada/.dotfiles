vim.g.firenvim_config = {
    globalSettings = { alt = "all" },
    localSettings = {
        [".*"] = {
            cmdline  = "neovim",
            content  = "html",
            priority = 0,
            selector = "textarea",
            takeover = "never"
        }
    }
}
