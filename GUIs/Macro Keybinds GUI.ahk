#Requires AutoHotkey v2.0-beta



showMacroKeybindsGUI(*) {
    calibrationText := TextFieldProps("Calibrate Screen Coords")
    macroKeybindsText := TextFieldProps("Macro Keybinds")
    ingameKeybindsText := TextFieldProps("Ingame Keybinds")
    closeText := TextFieldProps("Close")
    backText := TextFieldProps("Back")

    
    settingsMenu := Gui()
    settingsMenu.BackColor := guiOptions.backgroundColor
    settingsMenu.SetFont(guiOptions.defaultTextOptions, guiOptions.fontName)

    settingsMenu.AddText(calibrationText.buttonOptions, calibrationText.text).OnEvent("Click", calibrationButton)
    settingsMenu.AddText(macroKeybindsText.buttonOptions, macroKeybindsText.text).OnEvent("Click", macroKeybindsButton)
    settingsMenu.AddText(ingameKeybindsText.buttonOptions, ingameKeybindsText.text).OnEvent("Click", ingameKeybindsButton)
    settingsMenu.AddText(closeText.buttonOptions, closeText.text).OnEvent("Click", closeButton)
    settingsMenu.AddText(backText.buttonOptions guiOptions.nextInLine, backText.text).OnEvent("Click", backButton)
    settingsMenu.Show

    calibrationButton(*) {
        showBerriesGUI() ;;;
        settingsMenu.Destroy()
    }

    macroKeybindsButton(*) {
        showBerriesGUI() ;;;
        settingsMenu.Destroy()
    }

    ingameKeybindsButton(*) {
        showBerriesGUI() ;;;
        settingsMenu.Destroy()
    }

    closeButton(*) {
        settingsMenu.Destroy()
    }

    backButton(*) {
        showOptionsGUI()
        settingsMenu.Destroy()
    }
}