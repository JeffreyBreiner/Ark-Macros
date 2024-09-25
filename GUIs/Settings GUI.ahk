#Requires AutoHotkey v2.0-beta



showSettingsGUI(*) {
    calibrationText := TextFieldProps("Calibrate Screen Coords")
    macroKeybindsText := TextFieldProps("Macro Keybinds")
    ingameKeybindsText := TextFieldProps("Ingame Keybinds")
    backText := TextFieldProps("Back")
    closeText := TextFieldProps("Close")

    
    settingsMenu := Gui()
    settingsMenu.Title := "Settings"
    settingsMenu.BackColor := guiOptions.backgroundColor
    settingsMenu.SetFont(guiOptions.defaultTextOptions, guiOptions.fontName)

    settingsMenu.AddText(calibrationText.buttonOptions, calibrationText.text).OnEvent("Click", calibrationButton)
    settingsMenu.AddText(macroKeybindsText.buttonOptions, macroKeybindsText.text).OnEvent("Click", macroKeybindsButton)
    settingsMenu.AddText(ingameKeybindsText.buttonOptions, ingameKeybindsText.text).OnEvent("Click", ingameKeybindsButton)
    settingsMenu.AddText(backText.buttonOptions, backText.text).OnEvent("Click", backButton)
    settingsMenu.AddText(closeText.buttonOptions guiOptions.nextInLine, closeText.text).OnEvent("Click", closeButton)
    settingsMenu.Show

    calibrationButton(*) {
        showCalibrationGUI()
        settingsMenu.Destroy()
    }

    macroKeybindsButton(*) {
        MsgBox("Sorry, this feature is currently under development.`n"
               "You can change the keybinds manually in 'Arc Macros.ahk'")
        ;showMacroKeybindsGUI()
        ;settingsMenu.Destroy()
    }

    ingameKeybindsButton(*) {
        MsgBox("Sorry, this feature is currently under development.`n"
               "If your `"Open Remote Inventory`" button ingame is not set to 'c',`n"
               "then this behavior in this script can be changed by going to`n"
               "'Quick Actions.ahk' and changing it in the closeInventory() function.")
        ;showIngameKeybindsGUI()
        ;settingsMenu.Destroy()
    }

    closeButton(*) {
        settingsMenu.Destroy()
    }

    backButton(*) {
        showOptionsGUI()
        settingsMenu.Destroy()
    }
}