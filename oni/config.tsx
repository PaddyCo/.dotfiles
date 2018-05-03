
import * as React from "/Applications/Oni.app/Contents/Resources/app/node_modules/react"
import * as Oni from "/Applications/Oni.app/Contents/Resources/app/node_modules/oni-api"

export const activate = (oni: Oni.Plugin.Api) => {
    console.log("config activated")
}

export const deactivate = (oni: Oni.Plugin.Api) => {
    console.log("config deactivated")
}

export const configuration = {
    // UI customizations
    "ui.colorscheme": "gruvbox",
    "ui.animations.enabled": true,
    "ui.fontSmoothing": "auto",

    // Other
    "oni.loadInitVim": true,
    "sidebar.enabled": false,
    "tabs.mode": "native",
    "editor.quickOpen.filterStrategy": "vscode",
}
